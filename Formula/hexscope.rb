# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.22.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.22.0/hexscope-0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "c022dba36444992cb49f87d189ea97423cd0206fe77342bda3b5e35f7f4fa9b5"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.22.0/hexscope-0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "fb18253c8eca49fb6d97eb1352927b6772315c90d71e565044435918296543e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.22.0/hexscope-0.22.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5d1e366eb810b5103e4deacb0a96549f91580d9569fe283afd58e60da251d68b"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.22.0/hexscope-0.22.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "aa5688fdec784ad35c01211c965a43061c54248be8b0f6519cfdd29bd3e02e4f"
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
