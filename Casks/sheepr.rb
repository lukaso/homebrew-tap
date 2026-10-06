cask "sheepr" do
  version "0.1.0"
  sha256 "abd822b3fd4fa9a97959ad2330906c462464bd9b5f36f0a55c9bccb7e0956a69"

  url "https://github.com/lukaso/sheepr/releases/download/v#{version}/sheepr-macos-universal.tar.gz"
  name "Sheepr"
  desc "Run a command and kill every process it started, escapees included"
  homepage "https://github.com/lukaso/sheepr"

  depends_on macos: :monterey

  app "Sheepr.app"
  binary "#{appdir}/Sheepr.app/Contents/MacOS/sheepr"

  zap trash: "~/.local/state/sheepr"

  caveats <<~EOS
    Uninstalling does not remove Sheepr's privacy grants. To remove its Full Disk Access, run this
    before you uninstall (macOS may no longer find Sheepr afterwards):
      tccutil reset SystemPolicyAllFiles com.lukaso.sheepr
  EOS
end
