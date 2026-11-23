cask "cq-network" do
  arch arm: "arm64", intel: "amd64"

  version "0.52.13"
  sha256 arm:   "7f385aa71cec6677168f5c9a34ceb1cc94b4adf8f33f842301355d75c2a5f138",
         intel: "a6573914160f990409de98f2d063b17aadbaa5f89193018c7859ff3e0f091a19"

  url "https://github.com/jacobcxdev/cq/releases/download/v#{version}/cq_#{version}_darwin_#{arch}_bundle.tar.gz"
  name "CQ Network"
  desc "Native ChatGPT routing through CQ's configured WireGuard connection"
  homepage "https://github.com/jacobcxdev/cq"

  livecheck do
    skip "Native releases require reviewed signatures and notarisation"
  end

  depends_on macos: :ventura

  app "CQNetwork.app"

  uninstall launchctl: "dev.jacobcx.cq.network",
            script:    {
              executable: "#{appdir}/CQNetwork.app/Contents/MacOS/CQNetwork",
              args:       ["disable"],
            },
            delete:    "~/Library/LaunchAgents/dev.jacobcx.cq.network.plist"

  caveats <<~EOS
    To enable native ChatGPT routing, configure CQ's WireGuard profile and run:
      cq codex network enable
    macOS will ask you to approve CQ Network. ChatGPT is not restarted.
  EOS
end
