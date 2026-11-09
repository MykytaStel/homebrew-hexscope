# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.16.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.16.0/hexscope-0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "260ecc0fd9223735303f020fd8a638c1e2c80ecfe32f8ebb8bfb2c8fd7bf6fee"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.16.0/hexscope-0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "e0a7bb8a8760f9dde264611aa8a428eb33be674327ffd59611521ee9dc6779fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.16.0/hexscope-0.16.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c20cf990d103fc40a7cb93dea6132db0c4dcf52c7ef7fa56b5666cfc7faf0277"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.16.0/hexscope-0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ca6e98569c6dd3aa3ac594b579abaea80434081726755650dc2b0b141c0bbbf3"
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
