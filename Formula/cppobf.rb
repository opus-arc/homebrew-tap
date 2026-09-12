class Cppobf < Formula
  desc "Modern C++ source obfuscation frontend for COBF"
  homepage "https://github.com/opus-arc/cppobf"
  url "https://github.com/opus-arc/cppobf/releases/download/v0.1.0/cppobf-v0.1.0-macos-arm64.tar.gz"
  sha256 "5665468ab9fa425661088d9adbbfdf88f7c55af833b7ce68fde5e6c8ccef7447"

  depends_on :macos
  depends_on arch: :arm64

  def install
    libexec.install "cppobf", "presets", "vendor"
    bin.write_exec_script libexec/"cppobf"
    prefix.install "README.md", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "cppobf 0.1.0", shell_output("#{bin}/cppobf --version")
  end
end
