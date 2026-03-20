class motif < Formula
  desc "Motif is a C++ command-line tool for audio thumbnailing."
  homepage "https://github.com/opus-arc/Motif"
  url "https://github.com/opus-arc/Motif/releases/download/v0.1.0/motif-macos-arm64-v0.1.0.tar.gz"
  sha256 "f8d2c057ae35e28c7305d52c5e3b92afaca072154902fbf6a2a8043574753900"
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
