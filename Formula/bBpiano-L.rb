class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/v0.1.0-L/bBpiano-Lite-v0.1.0-L-macOS-arm64.zip"
  sha256 "sha256:90c080c1fd705a5b0fac29829f5cca464519c7ae7d7c3eca6d6cdb772275b17e"
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
