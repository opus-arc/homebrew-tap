class Mcat < Formula
  desc "macOS CLI for Apple Music background recording and track archiving"
  homepage "https://github.com/opus-arc/MusicCat"
  url "https://github.com/opus-arc/MusicCat/releases/download/v0.1.2/mcat-macos-arm64-v0.1.2.tar.gz"
  sha256 "0f4caffa5cd029512bc5950aa9b7e7eab3bb5d125a4b8ee35eee4bb58627db71"
  license "Apache-2.0"

  depends_on :macos

  def install
    bin.install "mcat"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    assert_match "MusicCat", shell_output("#{bin}/mcat --help")
  end
end
