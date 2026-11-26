cask "keyway" do
  version "0.8.0"
  sha256 "15d685e83d28024bca9df5698057e601ee902fe493b717fe4f07aa18243f0a34"

  url "https://github.com/arminsameti/Keyway/releases/download/v#{version}/Keyway-v#{version}-macOS.zip"
  name "Keyway"
  desc "Native client for Xray, sing-box, V2Ray core, Mihomo and Tor"
  homepage "https://github.com/arminsameti/Keyway"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Keyway.app"

  # Keyway is signed ad hoc, not notarized yet, so Gatekeeper would block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Keyway.app"],
                   must_succeed: false
  end

  zap trash: "~/.keyway"
end
