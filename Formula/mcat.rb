class Mcat < Formula
  desc "macOS CLI for Apple Music background recording and track archiving"
  homepage "https://github.com/opus-arc/MusicCat"
  url "https://github.com/opus-arc/MusicCat/releases/download/v0.2.3/mcat-macos-arm64-v0.2.3.tar.gz"
  sha256 "e0cde3587e5d3ccfd75f6c696bd2a67fb2d6250486ed16a4d08bf016a3de9bf3"
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
        - a configured CoreAudio virtual audio device
          (such as BlackHole, Loopback, or Soundflower)

      Downloading albums before recording is recommended but not required.
      mcat does not repair or splice network interruptions.

      If the optional Transkun CLI is available on PATH, successful recordings
      also produce <Album>/midi/<Track>.mid.

      After installation:
        mcat --test
        mcat --help
    EOS
  end

  test do
    assert_match "mcat 0.2.3", shell_output("#{bin}/mcat --version")
  end
end
