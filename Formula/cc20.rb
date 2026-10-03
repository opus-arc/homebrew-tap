class Cc20 < Formula
  desc "Password-based text encryption CLI using XChaCha20-Poly1305"
  homepage "https://github.com/opus-arc/cc20"
  url "https://github.com/opus-arc/cc20/releases/download/v0.1.1/cc20-v0.1.1-macOS-arm64.zip"
  sha256 "c081b23cd37bc283c76412de33b15e4df945e3a11df0ef4cd7de7b7fc7f80449"

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
