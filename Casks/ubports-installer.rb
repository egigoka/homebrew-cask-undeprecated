cask "ubports-installer" do
  version "0.11.2"
  sha256 "cd5532fff5c2a35e04f55b6b0ad03918404bfbaa1065e54a87cf9fb69609807b"

  url "https://github.com/ubports/ubports-installer/releases/download/#{version}/ubports-installer_#{version}_mac_x64.dmg",
      verified: "github.com/ubports/ubports-installer/"
  name "ubports installer"
  desc "Application to install ubports on mobile devices"
  homepage "https://ubports.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "ubports-installer.app"

  zap trash: [
    "~/Library/Application Support/ubports-installer",
    "~/Library/Preferences/com.ubports.installer.plist",
    "~/Library/Saved Application State/com.ubports.installer.savedState",
  ]
end
