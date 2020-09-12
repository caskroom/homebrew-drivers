cask "corsair-icue" do
  version "3.33.246"
  sha256 "acad88e36b0497603916a4efa0c7534a7606032e30f16a2cf9e05e8448a1abfd"

  url "https://downloads.corsair.com/Files/CUE/iCUE-#{version}-release.dmg"
  appcast "https://www.corsair.com/us/en/downloads/search?searchCategory=Cor_Products_iCue_Compatibility"
  name "Corsair iCUE"
  homepage "https://www.corsair.com/us/en/icue"

  depends_on macos: ">= :high_sierra"

  pkg "iCUE.pkg"

  uninstall launchctl: [
    "com.corsair.AudioConfigService.System",
    "com.corsair.cue.3.launchHelper",
  ],
            quit:      [
    "com.corsair.cue.*",
    "org.qt-project.*",
  ],
            script:    {
    executable: "/usr/bin/osascript",
    args:       ["#{appdir}/Corsair/iCUEUninstaller.app/Contents/Scripts/uninstall.scpt"],
    sudo:       true
  },
            pkgutil:   [
    "com.corsair.CorsairAudio",
    "com.corsair.cue.*",
  ],
            delete:    [
    "/Library/Audio/Plug-Ins/HAL/CorsairAudio.plugin",
    "/Library/LaunchAgents/iCUELaunchAgent.plist",
  ],
            delete:    "/Applications/Corsair"

  zap trash: [
    "~/.config/com.corsair",
    "~/Library/Application Support/Corsair",
    "~/Library/Caches/Corsair",
    "~/Library/Caches/iCUEUninstaller",
    "~/Library/Preferences/com.corsair.cue.3.plist",
    "~/Library/Saved Application State/com.corsair.cue.3.cue_unistaller.savedState",
    "~/Library/Saved Application State/com.corsair.cue.3.savedState",
  ]
end
