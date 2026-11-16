# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.23.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.23.0/hexscope-0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "029000e000286efb0d1298457b7f4e7aaed5d18f3e0edaa76861c3c669480837"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.23.0/hexscope-0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "18b1fac2ed4906876c05035d2d2ff2da46877df6977b6cdb9960945f7c0fde13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.23.0/hexscope-0.23.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4fa171cbaaf21d8bf004817331989d66aeb02c43dccbd1cf59ac27adbe5fd713"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.23.0/hexscope-0.23.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2d5c71e335828d70940ac27c52c4bf37c472f16749e27adc7355129bfc5ebaa2"
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
