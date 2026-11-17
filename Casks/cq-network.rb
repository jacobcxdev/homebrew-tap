cask "cq-network" do
  arch arm: "arm64", intel: "amd64"

  version "0.49.8"
  sha256 arm:   "c4a1bdce0a0de02af62f78c52162fed61b6e63272a592a44f99f840fa0e3c0ea",
         intel: "dcfbf760dc304b975beb991a50fdd54bf5dfc91a4e3ac77e6d885abdd1f9bd03"

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
