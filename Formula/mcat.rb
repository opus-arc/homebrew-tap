class Mcat < Formula
  desc "Apple Music recorder with optional MIDI and MusicXML transcription"
  homepage "https://github.com/opus-arc/MusicCat"
  url "https://github.com/opus-arc/MusicCat/releases/download/v0.3.0/mcat-macos-arm64-v0.3.0.tar.gz"
  sha256 "95b0458664462cd967b23582048662f8cbd28ecf2c3b87d6d300ad862520ce2a"
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
      If the optional midiscribe CLI and model are also available, MusicCat
      produces <Album>/score/<Track>.musicxml. Check with:
        mcat --models

      Loopback must be open while using a Loopback-provided virtual device.

      After installation:
        mcat --test
        mcat --help
    EOS
  end

  test do
    assert_match "mcat 0.3.0", shell_output("#{bin}/mcat --version")
  end
end
