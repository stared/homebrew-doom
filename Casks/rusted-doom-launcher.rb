cask "rusted-doom-launcher" do
  version "0.3.3"
  sha256 "1d0843512793fa2e9f8b2e1ea0a860b250660c821071978ba2f079c5adef3088"

  url "https://github.com/stared/rusted-doom-launcher/releases/download/v#{version}/Rusted.Doom.Launcher_#{version}_aarch64.dmg"
  name "Rusted Doom Launcher"
  desc "A modern launcher for classic Doom"
  homepage "https://github.com/stared/rusted-doom-launcher"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "Rusted Doom Launcher.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/Rusted Doom Launcher.app"]
  end

  caveats <<~EOS
    Rusted Doom Launcher requires:
    - UZDoom or GZDoom: brew install --cask stared/doom/uzdoom
    - doom.wad or doom2.wad (from GOG or Steam)
  EOS
end
