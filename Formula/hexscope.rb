# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.11.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.11.0/hexscope-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "fdcaeb2c428c20523e0a7aa4c02b6dbf8c4fa9ec348b0f4af42d8a05edc62e38"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.11.0/hexscope-0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "142ade01b50ddfcf2db4637a8b63c86322e3c652c506163660bfd80112fdfb6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.11.0/hexscope-0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c18c41ac582cc6728d965dc69e54131ff906262effe906abc0c2dfe3c0094c3d"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.11.0/hexscope-0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a28ea52a10c167729a987f01b1a9c190a3258368fc4bf494ac6654d4df9aba36"
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
