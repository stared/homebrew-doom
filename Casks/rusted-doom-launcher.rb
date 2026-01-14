cask "rusted-doom-launcher" do
  version "0.1.2"
  sha256 "d631951b6c06f45a0e2ffdf116e94ba7d2819a9a80b994671bc9d72e631129c5"

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
    - DOOM.WAD or DOOM2.WAD (from Steam or GOG)
  EOS
end
