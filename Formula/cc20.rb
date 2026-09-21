class Cc20 < Formula
  desc "Password-based text encryption CLI using XChaCha20-Poly1305"
  homepage "https://github.com/opus-arc/cc20"
  url "https://github.com/opus-arc/cc20/releases/download/v0.1.1/cc20-v0.1.1-macOS-arm64.zip"
  sha256 "36f5531a533d3976a1438234dbd4fe69b680e30b87054acd0c66fec89b477772"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "cc20"
    prefix.install "libsodium-LICENSE"
  end

  test do
    assert_match "cc20 0.1.1", shell_output("#{bin}/cc20 --version")
  end
end
