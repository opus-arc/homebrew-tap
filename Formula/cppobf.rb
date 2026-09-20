class Cppobf < Formula
  desc "Modern C++ source obfuscation frontend for COBF"
  homepage "https://github.com/opus-arc/cppobf"
  url "https://github.com/opus-arc/cppobf/releases/download/v0.1.1/cppobf-v0.1.1-macos-arm64.tar.gz"
  sha256 "867eac77bc238a868866d05eabce9e124b6b0dfaab5e0d2bd367be7d63e5c869"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "cppobf", "presets", "vendor"
    bin.write_exec_script libexec/"cppobf"
    prefix.install "README.md", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "cppobf 0.1.1", shell_output("#{bin}/cppobf --version")
  end
end
