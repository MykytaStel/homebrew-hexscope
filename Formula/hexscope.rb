# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.18.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.18.0/hexscope-0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "700ead8197d9bb15f3d6d17eeb6d2e1a05268334a3cb7f87c54207f122837215"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.18.0/hexscope-0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec8d0bc503d9aef8d92a9781373e11d8cc7cf11ab6efaaa434b803f948e5b970"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.18.0/hexscope-0.18.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a25ebcc0b7864972f2641082579262d9095097dd6bade2179b964aba5a1fe3bb"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.18.0/hexscope-0.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f41f4f0357e44cd7c43621be59ff606000f96eac61fe488d3934fbd12230248a"
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
