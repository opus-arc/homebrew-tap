class Mcat < Formula
  desc "macOS CLI for Apple Music background recording and track archiving"
  homepage "https://github.com/opus-arc/MusicCat"
  url "https://github.com/opus-arc/MusicCat/releases/download/v0.2.0/mcat-macos-arm64-v0.2.0.tar.gz"
  sha256 "f8c434ea019e27fc1e065143a71e908711d9968ad35567982ddd120cb9909eb7"
  license "Apache-2.0"

  depends_on "ffmpeg"
  depends_on "fileicon"
  depends_on :macos
  depends_on "sox"

  def install
    bin.install "mcat"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      mcat also requires:
        - Apple Music
        - tracks downloaded locally in Apple Music before recording
        - a configured CoreAudio virtual audio device
          (such as BlackHole, Loopback, or Soundflower)

      If the optional Transkun CLI is available on PATH, successful recordings
      also produce <Album>/midi/<Track>.mid.

      After installation:
        mcat --test
        mcat --help
    EOS
  end

  test do
    assert_match "mcat 0.2.0", shell_output("#{bin}/mcat --version")
  end
end
