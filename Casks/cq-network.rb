cask "cq-network" do
  arch arm: "arm64", intel: "amd64"

  version "0.48.5"
  sha256 arm:   "6c3fa96d0433301fbccf194e1dc84578d220ee5ffa9a8347f98a9bed152b3536",
         intel: "232b26343ae037ec28e1c685b0c0afc50a94da0053a0a25d087b6e7716e14ae0"

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
