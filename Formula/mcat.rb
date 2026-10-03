class Mcat < Formula
  desc "macOS CLI for Apple Music background recording and track archiving"
  homepage "https://github.com/opus-arc/MusicCat"
  url "https://github.com/opus-arc/MusicCat/releases/download/v0.2.4/mcat-macos-arm64-v0.2.4.tar.gz"
  sha256 "2f2500391bb5a95fcf28b4311e14f10ab0af43c39628d6f79abb1b7f1a652700"
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
      Disable Apple Music AutoMix/Crossfade before recording complete tracks.

      If the optional Transkun CLI is available on PATH, successful recordings
      also produce <Album>/midi/<Track>.mid.

      After installation:
        mcat --test
        mcat --help
    EOS
  end

  test do
    assert_match "mcat 0.2.4", shell_output("#{bin}/mcat --version")
  end
end
