cask "keyway" do
  version "0.5.2"
  sha256 "b26e938c0a0d491e958a9eb25ad1288480b56b4e3a01447c0fb7270d1cad52de"

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
