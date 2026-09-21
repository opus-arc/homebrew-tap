class Cc20 < Formula
  desc "Password-based text encryption CLI using XChaCha20-Poly1305"
  homepage "https://github.com/opus-arc/cc20"
  url "https://github.com/opus-arc/cc20/releases/download/v0.1.0/cc20-v0.1.0-macOS-arm64.zip"
  sha256 "71b14824cd5d6b2b568e09ba15ef4e69dbf2a8d50e8b7bfdb26118bff5eaf332"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "cc20"
    prefix.install "libsodium-LICENSE"
  end

  test do
    assert_match "cc20 0.1.0", shell_output("#{bin}/cc20 --version")
  end
end
