require_relative "../lib/bbs_internal_release_download_strategy"

class BbsDecomp < Formula
  desc "Reversible single-note partials, bands, figures and offline listening"
  homepage "https://github.com/opus-arc/bBpiano-internal"
  url "https://github.com/opus-arc/bBpiano-internal/releases/download/bbs-decomp-v0.1.0/bbs-decomp-0.1.0-macos-arm64.tar.gz",
      using: BbsInternalReleaseDownloadStrategy
  version "0.1.0"
  sha256 "7b63f12e0d1cc74690ad21aad4ac5aea72b9b6c34a4a76b5fff373ea1074976b"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on "gh"
  depends_on macos: :sonoma

  def install
    # Homebrew rewrites dylib IDs before post_install and would replace Developer
    # ID signatures. Keep the verified payload packed until that step is over.
    libexec.mkpath
    cp cached_download, libexec/"payload.tar.gz"
    bin.write_exec_script libexec/"runtime/bbs-decomp-0.1.0-macos-arm64/bbs-decomp/bbs-decomp"
    (bin/"bbs-decomp").chmod 0755
    prefix.install "README.md", "LICENSE.txt", "BUILD_VERSIONS.txt"
    prefix.install "THIRD_PARTY_LICENSES"
  end

  post_install_steps do
    mkdir_p "runtime", base: :libexec
    run "/usr/bin/tar",
        args: ["-xzf", "{{libexec}}/payload.tar.gz", "-C", "{{libexec}}/runtime"],
        writable_paths: ["runtime"], writable_base: :libexec
  end

  def caveats
    <<~EOS
      bbpl-internal tool. Private Release download uses your existing gh login.
      If needed: gh auth login

      bbs-decomp audio.wav -o outputfolder
      Open outputfolder/试听台.html for offline listening and selection.
      Decomposition preserves the selected input; residual is not noise-only.
    EOS
  end

  test do
    assert_match "bbs-decomp 0.1.0", shell_output("#{bin}/bbs-decomp --version")
    samples = (0...4001).map { |i| (8000 * Math.sin(2 * Math::PI * 440 * i / 16_000)).to_i }.pack("s<*")
    wav = "RIFF" + [36 + samples.bytesize].pack("V") + "WAVEfmt " +
          [16, 1, 1, 16_000, 32_000, 2, 16].pack("VvvVVvv") + "data" + [samples.bytesize].pack("V") + samples
    (testpath/"tone.wav").binwrite(wav)
    system bin/"bbs-decomp", testpath/"tone.wav", "-o", testpath/"out", "--note", "A4",
           "--max-partials", "3", "--no-plots"
    assert_path_exists testpath/"out/试听台.html"
    result = JSON.parse((testpath/"out/manifest.json").read)
    assert result["complete"]
    assert_operator result["reconstruction"]["partial_plus_residual_relative_error"], :<, 1e-12
  end
end
