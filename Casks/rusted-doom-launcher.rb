cask "rusted-doom-launcher" do
  version "0.1.3"
  sha256 "9f89f363907f608017d99d3a11004b4b2997786c3508aeccac20efba8f73578c"

  url "https://github.com/stared/rusted-doom-launcher/releases/download/v#{version}/Rusted.Doom.Launcher_#{version}_aarch64.dmg"
  name "Rusted Doom Launcher"
  desc "Launch Doom source ports (UZDoom/GZDoom) with community WADs"
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
    - UZDoom or GZDoom: brew install --cask gzdoom
    - DOOM.WAD or DOOM2.WAD (from GOG or Steam)
  EOS
end
