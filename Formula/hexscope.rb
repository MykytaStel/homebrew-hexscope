# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.20.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.20.0/hexscope-0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "d0f0689b28aa394237b888889a0cb1dc0cedd0fa4975b7208d8c056a495b90e8"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.20.0/hexscope-0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "9bbddd61e3602076c472a56e03c687132d08b4728673f1942e1d5bf1b777f3df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.20.0/hexscope-0.20.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cb6c1bd6530bb222a4c3fa57322fbe45e56e201bf77313f4738b716b42f2ec5d"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.20.0/hexscope-0.20.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c37856e09556ad5de33d77f6d5e1c07e0ddfb21f34992a2298eaa2a9c99b2fc"
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
