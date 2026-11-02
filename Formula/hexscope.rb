# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.10.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.10.0/hexscope-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "b3496938ab27e36d4374505ed9d2a560bdc9473a7d229553225cb9a339f84edd"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.10.0/hexscope-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "ceaa957879563a3c352395de51b9ff007f026599f773e41aed864c0dd9a07211"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.10.0/hexscope-0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a75554b8ac10623d7288dd65fcbbac0ae75b8defc83306ab02e0b4a59864a340"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.10.0/hexscope-0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "735e2b4e9a0409624f1777d566a0d2b8779a2d974b83922c460ddc49a1b1ba05"
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
