class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/L1-Clavier/bBpiano-L1-Clavier-260917-macOS-arm64.zip"
  version "L1-Clavier"
  sha256 "2b2848161fc3867e77cbd8866b7dfb31558bc2101c0b824dd664209703a35be5"
  license :cannot_represent
  revision 1

  depends_on :macos

  def install
    bin.install "bbpl"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS

      ┌──────────────────────────────────────┐
      │                                      │
      │  bBpiano                             │
      │  L1-Clavier/260903                   │
      │                                      │
      │  Physical Modeling Piano             │
      │                                      │
      │  Developed by                        │
      │  Ziyang Tan · Zhuoran Chen           │
      │                                      │
      │  bBSonicLab                          │
      └──────────────────────────────────────┘

       Never forget such a path of inquiry.

    EOS
  end

  test do
    system "#{bin}/bbpl", "--help"
  end
end
