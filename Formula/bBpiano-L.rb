class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/L2-200c-Tiny/bBpiano-L2-200c-Tiny-macos-arm64.zip"
  version "L2-200c-Tiny"
  sha256 "c0dbf4a63f03a93d73515d703d93e4ebcaf07a9df9348350d8f98d6dfeca5dbb"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "bbpl"
    prefix.install "README.md", "BENCHMARKS.md", "README.txt", "LICENSE", "Developer-ID-Application.cer"
    prefix.install "doc"
  end

  def caveats
    <<~EOS

      ┌──────────────────────────────────────┐
      │                                      │
      │  bBpiano                             │
      │  L2-200c/261122                      │
      │                                      │
      │  Physical Modeling Piano             │
      │                                      │
      │  Developed by                        │
      │  Ziyang Tan                          │
      │                                      │
      │  bBSonicLab                          │
      └──────────────────────────────────────┘

       Never forget such a path of inquiry.

    EOS
  end

  test do
    assert_match "L2-200c", shell_output("#{bin}/bbpl -v")
    system "#{bin}/bbpl", "--help"
  end
end
