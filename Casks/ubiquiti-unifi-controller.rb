cask "ubiquiti-unifi-controller" do
  version "10.1.89"
  sha256 "6a3e7c5c971250d5f50b8fdd54e62483220204e4e47bb45ce280861c45ef6438"

  url "https://dl.ubnt.com/unifi/#{version}/UniFi-Network-Server.dmg",
      verified: "dl.ubnt.com/"
  name "Ubiquiti UniFi Network Controller"
  desc "Set up, configure, manage and analyze your UniFi network"
  homepage "https://unifi-sdn.ui.com/"

  livecheck do
    url "https://fw-update.ubnt.com/api/firmware-latest?filter=eq~~product~~unifi-controller&filter=eq~~channel~~release&filter=eq~~platform~~macos"
    strategy :json do |json|
      json.dig("_embedded", "firmware")&.map { |fw| fw["version"] }
    end
  end

  depends_on macos: ">= :catalina"

  uninstall signal: ["TERM", "com.ubnt.UniFi"]

  app "UniFi.app"

  zap trash: [
    "~/Library/Application Support/UniFi",
    "~/Library/Saved Application State/com.ubnt.UniFi-Discover.savedState",
    "~/Library/Saved Application State/com.ubnt.UniFi.savedState",
  ]

  caveats <<~EOS
    ubiquiti-unifi-controller is built for Intel macOS and so requires Rosetta 2 to be installed.
    You can install Rosetta 2 with:
      softwareupdate --install-rosetta --agree-to-license

    Installing ubiquiti-unifi-controller means you have AGREED to the license at:
      https://www.ui.com/eula/
  EOS
end
