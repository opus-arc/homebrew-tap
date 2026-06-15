class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  version "L0-100c"
  url "https://github.com/opus-arc/bBpiano/releases/download/L0-100c/bBpiano-L0-100c-macOS-arm64.zip"
  sha256 "ce9e552835242fa26d134a5cef52be2301ce372dce7253b2c3ea900b17c66820"
  license "PolyForm-Internal-Use-1.0.0"

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
      │  L/260608                            │                          
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
