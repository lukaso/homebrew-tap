cask "sheepr" do
  version "0.1.2"
  sha256 "4266a3da9607bcf29094ca75d299c4a96a9c63fda0634e8f2f4a1560975bc955"

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
