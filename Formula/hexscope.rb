# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.7.1 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.1/hexscope-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "ff7d8aea455c3f423f2d748c1c98fda7dfd073b94eddee32ddd97dacbb1f1d9c"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.1/hexscope-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "f5075076c0f53f19f63d8c6bcace574150d423541e2e00fc29583028c0aeec22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.1/hexscope-0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1ed876534acb64d95425452a0549caa492efa0bc2af7f5a04706225293747e99"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.7.1/hexscope-0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0968fd9ec675b18d3deeabaff060ffa2987db7f9ab43ff790be0e1c5dffffa28"
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
