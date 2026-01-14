cask "uzdoom" do
  version "4.14.3"
  sha256 "7fea2eb9de6a4694e56da9f7750f8f002d272891908b730020122b22beb59c0c"

  url "https://github.com/UZDoom/UZDoom/releases/download/#{version}/macOS-UZDoom-#{version}.zip"
  name "UZDoom"
  desc "Modern Doom source port (GZDoom fork)"
  homepage "https://github.com/UZDoom/UZDoom"

  depends_on macos: ">= :monterey"

  app "uzdoom.app", target: "UZDoom.app"

  caveats <<~EOS
    UZDoom is a community fork of GZDoom.

    You'll also need game data:
    - DOOM.WAD or DOOM2.WAD (from Steam or GOG)
  EOS
end
