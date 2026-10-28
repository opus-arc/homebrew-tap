# typed: true
# frozen_string_literal: true

require "download_strategy"

# Download private Release assets with the user's existing gh login. No token is
# interpolated into the URL, Ruby source, process arguments, or console output.
class BbsInternalReleaseDownloadStrategy < AbstractFileDownloadStrategy
  def fetch(timeout: nil)
    match = url.match(%r{\Ahttps://github\.com/(opus-arc/bBpiano-internal)/releases/download/([^/]+)/([^/]+)\z})
    raise "Expected a bBpiano-internal Release asset" unless match

    gh = HOMEBREW_PREFIX/"bin/gh"
    raise "Run `brew install gh` and `gh auth login` first" unless gh.executable?

    lock = DownloadLock.new(temporary_path)
    begin
      lock.lock_or_wait(quiet: quiet?, timeout: timeout)
      unless cached_location.exist?
        cached_location.dirname.mkpath
        ohai "Downloading bBpiano-internal Release (gh authentication)"
        command! gh.to_s, args:    ["release", "download", match[2], "--repo", match[1],
                                    "--pattern", match[3], "--output", temporary_path.to_s, "--clobber"],
                          timeout: timeout
        temporary_path.rename(cached_location)
      end
      create_symlink_to_cached_download(cached_location)
    ensure
      lock.unlock(unlink: true)
    end
  end
end
