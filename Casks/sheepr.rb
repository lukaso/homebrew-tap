cask "sheepr" do
  version "0.1.3"
  sha256 "82d79fb28c3294b02026fda78794812cc7ccebaf33b95d650f8d2224f41006e1"

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
