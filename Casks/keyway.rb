cask "keyway" do
  version "0.3.0"
  sha256 "dac3af7a0805d964aedbea6cb5ef7c83747f576fe2f360ad2db9824480561e70"

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
