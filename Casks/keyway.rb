cask "keyway" do
  version "0.4.0"
  sha256 "602f8a50900fbd29682fe8d255db350735352024d94178ec49c26eeb8040d290"

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
