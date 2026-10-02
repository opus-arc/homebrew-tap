class Mcat < Formula
  desc "macOS CLI for Apple Music background recording and track archiving"
  homepage "https://github.com/opus-arc/MusicCat"
  url "https://github.com/opus-arc/MusicCat/releases/download/v0.2.1/mcat-macos-arm64-v0.2.1.tar.gz"
  sha256 "4f3555d5256989d29800db39ab6496e25deaad598995090d0a18d29eb21670ed"
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
    assert_match "mcat 0.2.1", shell_output("#{bin}/mcat --version")
  end
end
