cask "cq-network" do
  version "0.41.6"
  sha256 "3d2b06ed7aa7bab4cd319678b66b7ee354f83024a87cc8c86254f8c7e9a73c1e"

  url "https://github.com/jacobcxdev/cq/releases/download/cq-network-v#{version}/CQNetwork_#{version}_universal.zip"
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
