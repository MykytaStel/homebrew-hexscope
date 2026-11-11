# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.19.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.19.0/hexscope-0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "673183b0338a713906628a616d6c6a5645cea9128cd79c2ad06efe164c5e2408"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.19.0/hexscope-0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "561ee15abf265a331c1f19b3d3c33ae59d862533e68308e153ad9adba18a208d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.19.0/hexscope-0.19.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2cbd7984b9441b93336d24e194067420ba03c5d319775f11c01f79e8e0b6c501"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.19.0/hexscope-0.19.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c9578699643e7b5f1ea4d329d4dd628ff95f30affe575607e239ff65134a4a84"
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
