# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.7.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.0/hexscope-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "17b0a43672e6eb2adb25100b2f2d4350e5c05c23f9745d654496f436b3010f3b"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.0/hexscope-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "6dd79caa5b19b71bfa097ae79229109e10e3c47f266290d4483c39ee1a179372"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.0/hexscope-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d5289abcf40c6dbbc4b7ebebb6c8b2a0515d6780095dc102cf1e00ba88da2af2"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.0/hexscope-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8e7eb79738734d4566fc296c670ae35ad14abe6b2d3f6b77413b9b499e551f77"
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
