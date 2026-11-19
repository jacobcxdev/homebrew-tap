cask "cq-network" do
  arch arm: "arm64", intel: "amd64"

  version "0.51.2"
  sha256 arm:   "9de69126f5d6e7aa1879f23d706eaa9c964d7513673214638d655e3f7db71fa2",
         intel: "b1a3746a697f3ea4de02d52ec80551a64f191945a6b671e6bfab81c08e854406"

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
