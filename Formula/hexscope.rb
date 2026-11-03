# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.12.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.12.0/hexscope-0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "a82290245224a728c685f70c1804e1c1cd851e90a4f581f9575c43cbfd60937a"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.12.0/hexscope-0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "cbcfea4a3cc4c51adc683fd49f15b48906010f9e4c53a60a206ccf8f8bdd0e86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.12.0/hexscope-0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "46ed4984ee2fe4dd2438feb9f61fb8a343d825dd704dd873e70060eeacff08c4"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.12.0/hexscope-0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e56ef89f32bf28b1208a92d212f7b63164630f154e02e766bfb4a234515845e"
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
