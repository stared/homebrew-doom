cask "rusted-doom-launcher" do
  version "0.3.4"
  sha256 "28c3666b481f62f9b8676e17f8788f79ad987f9d428545d0057723fdd45c50a1"

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
