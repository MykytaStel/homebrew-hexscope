# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.15.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.15.0/hexscope-0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "59a3d5201a5f2227fc5bfdb1be0c1647dcdbdbcca802e01a215778e2c47698c9"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.15.0/hexscope-0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "257f4e9198b79f11b150b2b487362464b137b4e517192f12d46018ff1bb70153"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.15.0/hexscope-0.15.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f29173b0c50e1567f98ab151a038e3155b7ec371f6ba4b3065d73440a482068f"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.15.0/hexscope-0.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "486b72b208453dcee3f329601a6e304c9754428d14b7717ae2f388f52fe04fcd"
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
