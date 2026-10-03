class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/L0-100c/bBpiano-L0-100c-macOS-arm64.zip"
  version "L0-100c"
  sha256 "5403bdc1305bb49e660cfc05cf16fd6571413302087707cc3c98b9c11c18177c"
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
