cask "cq-network" do
  arch arm: "arm64", intel: "amd64"

  version "0.49.5"
  sha256 arm:   "60a28bf8af2a36586eb5a3b8b237937c4871302eb33319aa2d80e7842e7205ef",
         intel: "b59f9899ccb5e42b6c839fa76cc53742f7f4ac12ebb6ab4c66c1f48c30b8edba"

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
