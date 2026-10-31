# Written by scripts/homebrew-formula.mjs in MykytaStel/hexscope from the
# checksums release v0.9.0 carries. Edit that script, not this file.
class Hexscope < Formula
  desc "See what a file gives away before you send it, and save a clean copy"
  homepage "https://hexscope.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.9.0/hexscope-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "81929bc86445fec668026da7294ed3034361c63c409de89f6aa402f8054854c3"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.9.0/hexscope-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "73ab25033a448c63d2cc53a1cd791ee351d8056376529ed3731dd1726de66289"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.9.0/hexscope-0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8c48d6603d594f4f92177d3362a719b9f180f3ff877e72e16d133f4a2a34bfd5"
    end
    on_intel do
      url "https://github.com/MykytaStel/hexscope/releases/download/v0.9.0/hexscope-0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "297f090b69443f5dfec55749f94a58984c7e894b61e6132f44f84570ae71f7f4"
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
