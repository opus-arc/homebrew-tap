class Cppobf < Formula
  desc "Modern C++ source obfuscation frontend for COBF"
  homepage "https://github.com/opus-arc/cppobf"
  url "https://github.com/opus-arc/cppobf/releases/download/v0.1.3/cppobf-v0.1.3-macos-arm64.tar.gz"
  sha256 "8a10f2763195ea8d27c00404f7942790f9017405aee981276174dc4d68abf6f8"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "cppobf", "presets", "vendor"
    bin.write_exec_script libexec/"cppobf"
    prefix.install "README.md", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "cppobf 0.1.3", shell_output("#{bin}/cppobf --version")
  end
end
