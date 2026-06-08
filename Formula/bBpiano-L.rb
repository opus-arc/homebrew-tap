class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  version "L0-beta"
  url "https://github.com/opus-arc/bBpiano/releases/download/L0-beta/bBpiano-L0-beta-macOS-arm64.zip"
  sha256 "d6b551afe43c7d2a6b1cc4a9393b698a87e3dca4c6e5ef5c6180bdee5eaffa36"
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
