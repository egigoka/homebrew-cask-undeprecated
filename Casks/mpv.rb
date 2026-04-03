cask "mpv" do
  version "0.41.0-dev-gc961c96af,23873313563"

  on_arm do
    sha256 "28fa00ade7cf799e852debf70b9998dacd763b7f1e1fb3b189018dab5664a508"

    url "https://nightly.link/mpv-player/mpv/workflows/build/master/mpv-v#{version.csv.first}-#{version.csv.second}-macos-15-arm.zip",
        verified: "nightly.link/mpv-player/mpv/"
  end
  on_intel do
    sha256 "a3f847f740df84da58f8b0f787d9e075059d18f98ca4abaea918ee4ff69d3c51"

    url "https://nightly.link/mpv-player/mpv/workflows/build/master/mpv-v#{version.csv.first}-#{version.csv.second}-macos-15-intel.zip",
        verified: "nightly.link/mpv-player/mpv/"
  end

  name "mpv"
  desc "Free, open-source, and cross-platform media player"
  homepage "https://mpv.io/"

  livecheck do
    url "https://nightly.link/mpv-player/mpv/workflows/build/master"
    regex(/mpv-v(\d+\.\d+\.\d+(?:-dev-g\w+)?)-(\d+)-macos/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: ">= :ventura"

  app "mpv.app"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/io.mpv.sfl*",
    "~/Library/Caches/io.mpv",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Saved Application State/io.mpv.savedState",
  ]
end
