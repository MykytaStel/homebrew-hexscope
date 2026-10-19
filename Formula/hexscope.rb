# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.7.2 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.2/hexscope-0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "e7db4928860c447475be794fe7b3999c9ee64a5fec341ba921b65767a3e19ad7"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.2/hexscope-0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "db5ea028843ca20581f6cd791cc581d66098130be5f71dbce1f6ab45fe08f43e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.2/hexscope-0.7.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4bfd375ac3462591685af97c412f395c675e12d4b6644ac1a0730243b6f1baf5"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.2/hexscope-0.7.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8b82953b6e42f7cff1f1c63fcf4c7e08aecae1825625ed757a325272d4712771"
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
