class Hello < Formula
  desc "A greeting formula example"
  homepage "https://github.com/bethropolis/homebrew-tap"
  # Replace the URL below with the actual release tarball URL (e.g., a GitHub tag archive).
  url "https://github.com/bethropolis/homebrew-tap/archive/refs/tags/v1.0.0.tar.gz"
  # Generate with: shasum -a 256 <downloaded-tarball>
  sha256 "replace_with_actual_sha256_of_release_tarball"
  license "MIT"

  def install
    bin.install "hello"
  end

  test do
    assert_match "Hello, world!", shell_output("#{bin}/hello")
  end
end
