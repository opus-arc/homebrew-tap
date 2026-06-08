class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/L0-α/bBpiano-L0-alpha-260607-macOS-arm64.zip"
  sha256 "05e355528e180d69f545a48a5b4581165bea53d68eb2a9169c1da1ee399a9a2f"
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
