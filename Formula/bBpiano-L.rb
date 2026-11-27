class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/L2-200c-Tiny/bBpiano-L2-200c-Tiny-macos-arm64.zip?sha256=4797cb92a9c02019ce59890c7f1b79ca822042741ef0fcb6a63a9f2f588fac26"
  version "L2-200c-Tiny"
  sha256 "4797cb92a9c02019ce59890c7f1b79ca822042741ef0fcb6a63a9f2f588fac26"
  license :cannot_represent
  revision 1

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "bbpl"
    prefix.install "README.md", "LICENSE"
  end

  def caveats
    <<~EOS

      ┌──────────────────────────────────────┐
      │                                      │
      │  bBpiano                             │
      │  200c Tiny Soft v1 / 261127          │
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
    assert_match "200c tiny soft v1", shell_output("#{bin}/bbpl -v")
    system "#{bin}/bbpl", "--help"
  end
end
