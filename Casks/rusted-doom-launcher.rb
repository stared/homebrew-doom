cask "rusted-doom-launcher" do
  version "0.1.5"
  sha256 "dbf534346639ad5d6fd231cf54a2e7be6f8bef22f13363f764bb472ad28bc248"

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
