class BbpianoL < Formula
  desc "Command-line acoustic engine laboratory for bBpiano Lite"
  homepage "https://github.com/opus-arc/bBpiano"
  url "https://github.com/opus-arc/bBpiano/releases/download/L2-200c/bBpiano-L2-200c-macos-arm64.zip"
  version "L2-200c"
  sha256 "5a20184e119adfcdbe4a8ed5221abd66a37d4bcc4566c9d04768e1363ea522a8"
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
