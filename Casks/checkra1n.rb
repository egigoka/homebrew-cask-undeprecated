cask "checkra1n" do
  version "0.12.4"
  sha256 "754bb6ec4747b2e700f01307315da8c9c32c8b5816d0fe1e91d1bdfc298fe07b"

  url "https://checkra.in/assets/downloads/macos/#{sha256}/checkra1n%20beta%20#{version}.dmg"
  name "checkra1n"
  desc "Jailbreak for iPhone 5s through iPhone X, iOS 12.0 and up"
  homepage "https://checkra.in/"

  livecheck do
    url "https://checkra.in/"
    regex(/checkra1n%20beta%20(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on macos: ">= :catalina"

  app "checkra1n.app"
  binary "#{appdir}/checkra1n.app/Contents/MacOS/checkra1n"

  caveats <<~EOS
    checkra1n is built for Intel macOS and so requires Rosetta 2 to be installed.
    You can install Rosetta 2 with:
      softwareupdate --install-rosetta --agree-to-license
  EOS
end
