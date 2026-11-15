# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.21.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.21.0/hexscope-0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "4d190182123268ba7db89328cdb61f8c74fcad2c57ed5d226a001ed101a4a9fd"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.21.0/hexscope-0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "59754b85db41b4816a8454322aaacc9247530ff82258d032974a30594db61e19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.21.0/hexscope-0.21.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "18c498105b8ee6740eb16489dbf187bdec80a98a18f580abf7ba736f37f4bfb1"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.21.0/hexscope-0.21.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7e40266d6b9182d19b5861a38489899ab5b8bbaf97c3ca3187860f4809a019e6"
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
