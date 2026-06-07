class BbpianoLite < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/v0.1.0-L/bBpiano-Lite-v0.1.0-L-macOS-arm64.zip"
  sha256 "0c2c2b8ef1d70c5aead5dedca30995217536e894c34300b09c5bff94947eb107"
  license "PolyForm-Internal-Use-1.0.0"

  depends_on :macos

  def install
    bin.install "bbl"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      bBpiano Lite is an experimental command-line acoustic engine laboratory.

      After installation:
        bbl
        bbl --help
    EOS
  end

  test do
    system "#{bin}/bbl"
  end
end
