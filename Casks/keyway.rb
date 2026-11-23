cask "keyway" do
  version "0.6.4"
  sha256 "3413490869c028cd0759f2dec58e85f5a93407b94e1a9198de0244099df07798"

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
