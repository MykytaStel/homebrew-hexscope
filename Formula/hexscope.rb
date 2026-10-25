# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.8.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.8.0/hexscope-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "fe483c4f03a31e0171214a7e95f4e64464515926eb2a7550652cfd61a5bcf3bf"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.8.0/hexscope-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "43b7e98c0ffa015f6bcd13c15fcb6d5b6c483512cd02fc7436f946d202d39fb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.8.0/hexscope-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c5fa5a871fc42033b38c4bf966daddc9cf4f412db009f06e3c7637557d6e9b48"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.8.0/hexscope-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "71a90b69bc5c83914a584a8a836d3197b40faacd64658db538d79640a0a99445"
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
