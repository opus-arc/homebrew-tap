class Cppobf < Formula
  desc "Modern C++ source obfuscation frontend for COBF"
  homepage "https://github.com/opus-arc/cppobf"
  url "https://github.com/opus-arc/cppobf/releases/download/v0.1.2/cppobf-v0.1.2-macos-arm64.tar.gz"
  sha256 "8228be4d4ac8080cad0ef29e21d054df230c3c2bc4dd71cd24ee3ec0a5f23d3c"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "cppobf", "presets", "vendor"
    bin.write_exec_script libexec/"cppobf"
    prefix.install "README.md", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "cppobf 0.1.2", shell_output("#{bin}/cppobf --version")
  end
end
