cask "rusted-doom-launcher" do
  version "0.3.6"
  sha256 "b6410f485593a698eb41d0c69a3b8e76e87b72028908f05998c21f4b39aa79cd"

  url "https://github.com/stared/rusted-doom-launcher/releases/download/v#{version}/Rusted.Doom.Launcher_#{version}_aarch64.dmg"
  name "Rusted Doom Launcher"
  desc "A modern launcher for classic Doom"
  homepage "https://github.com/stared/rusted-doom-launcher"

  depends_on macos: :monterey
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
