# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.13.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.13.0/hexscope-0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "4d66d645fe79caecf4e11e426f8820deaedf6aea3343c2a492dff7ea9af5ba61"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.13.0/hexscope-0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "0111b95aafca1f921ea569a99215b11df44b80083e903fb0629a4d7790ddae8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.13.0/hexscope-0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7e3de7fa53d595ea10bab1506ce61f21099b90d7affd7a36c0d0f45f6c904b1c"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.13.0/hexscope-0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ffc2e34e58292f01657f4c69a2adb8508b6198bc191f3d174287ac38da12c27b"
    end
  end

  def install
    bin.install "hexscope"
  end

  def caveats
    <<~EOS
      To clean files from Finder's Quick Actions (or the Scripts menu of
      GNOME Files), run once:
        hexscope menu
    EOS
  end

  test do
    assert_match "hexscope #{version}", shell_output("#{bin}/hexscope --version")
  end
end
