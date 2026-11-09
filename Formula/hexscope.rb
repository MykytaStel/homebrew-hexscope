# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.17.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.17.0/hexscope-0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "59929e577abfd14a09fb270e623fc4447233eadf78a64fe9cb90bb0dc58d198a"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.17.0/hexscope-0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "2fa2cea3054106670827cdb3c4d5e02e44f0380db84f7c4035bcf04546ac58df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.17.0/hexscope-0.17.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "96c195ba83de820a606e0fac135753ab41ad3178766d936e0534e187939e9119"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.17.0/hexscope-0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59d7dae49aaf856f5611cfb9bb5cc025c5c3cd6f1dc78ee1e8599f8d23090dd4"
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
