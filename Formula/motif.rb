class Motif < Formula
  desc "Motif is a C++ command-line tool for audio thumbnailing."
  homepage "https://github.com/opus-arc/Motif"
  url "https://github.com/opus-arc/Motif/releases/download/v0.1.0/motif-macos-arm64-v0.1.0.tar.gz"
  sha256 "734ea37eddcb2f6f9f321b1677977dd7afc88c5a10ed64e32cf8d90e4983e481"
  license "Apache-2.0"

  depends_on :macos
  depends_on "ffmpeg"

  def install
    bin.install "motif"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    assert_match "Motif", shell_output("#{bin}/motif --help")
  end
end
