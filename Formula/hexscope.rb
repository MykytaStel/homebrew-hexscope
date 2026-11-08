# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.14.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.14.0/hexscope-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "53bf7758c741f7693ee8fa14b7d65ff37b6c2952e792d733a81cd72dd7cfd2ad"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.14.0/hexscope-0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "2915023940b53c0d1bdb811c31312629ef89ca76dd5c4392c69bb96d738517d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.14.0/hexscope-0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "374f388bd7e70ad79e9f8c6a9c03c16ab55695a94549ca45b69a1f7af39429c5"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.14.0/hexscope-0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e6c3b09917656496c6dbd758f6dca49a60e9bd0b527d73342e602c8bd2349aeb"
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
