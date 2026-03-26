cask "macupdater" do
  version "3.5.0"
  sha256 :no_check

  url "https://www.corecode.io/downloads/macupdater_#{version}.dmg"
  name "MacUpdater"
  desc "Track and update to the latest versions of installed software"
  homepage "https://www.corecode.io/macupdater/index.html"

  livecheck do
    url "https://www.corecode.io/macupdater/history.html"
    regex(/macupdater[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on macos: ">= :monterey"

  auto_updates true

  uninstall launchctl: "com.corecode.MacUpdaterLaunchHelper",
            quit:      "com.corecode.MacUpdater"

  app "MacUpdater.app"
  binary "#{appdir}/MacUpdater.app/Contents/Resources/macupdater_install"
  binary "#{appdir}/MacUpdater.app/Contents/Resources/macupdater_client"

  zap trash: [
    "~/Library/Application Scripts/com.corecode.MacUpdaterLaunchHelper",
    "~/Library/Application Support/MacUpdater*",
    "~/Library/Caches/com.corecode.MacUpdater",
    "~/Library/Containers/com.corecode.MacUpdaterLaunchHelper",
    "~/Library/Cookies/com.corecode.MacUpdater.binarycookies",
    "~/Library/HTTPStorages/com.corecode.MacUpdater",
    "~/Library/HTTPStorages/com.corecode.MacUpdater.binarycookies",
    "~/Library/Logs/Mac Updater Logs",
    "~/Library/Preferences/com.corecode.MacUpdater.plist",
    "~/Library/WebKit/com.corecode.MacUpdater",
  ]
end
