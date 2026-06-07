class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/v0.1.0-L/bBpiano-Lite-v0.1.0-L-macOS-arm64.zip"
  sha256 "2a2619a09b0af9a65d57137b2611c18aacfb9acca2486f79383ca4b80d2af723"
  license "PolyForm-Internal-Use-1.0.0"

  depends_on :macos

  def install
    bin.install "bbpl"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      Never forget such a path of inquiry.
      不要忘记这样的求索之路。

      After installation:
        bbpl
        bbpl --help
    EOS
  end

  test do
    system "#{bin}/bbpl"
  end
end
