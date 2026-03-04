# homebrew-tap

My personal [Homebrew](https://brew.sh) tap containing custom formulae.

## How to use

Add the tap:

```sh
brew tap bethropolis/tap
```

Install a formula:

```sh
brew install bethropolis/tap/<formula>
```

## Available formulae

| Formula | Description |
| ------- | ----------- |
| `hello` | A greeting formula example |

## Adding a new formula

1. Create a new Ruby file in the `Formula/` directory (e.g., `Formula/my-tool.rb`).
2. Use the template below as a starting point:

```ruby
class MyTool < Formula
  desc "A short description of my-tool"
  homepage "https://github.com/example/my-tool"
  url "https://github.com/example/my-tool/archive/refs/tags/v1.0.0.tar.gz"
  # Generate with: shasum -a 256 <downloaded-tarball>
  sha256 "replace_with_actual_sha256_of_release_tarball"
  license "MIT"

  def install
    bin.install "my-tool"
  end

  test do
    assert_match "expected output", shell_output("#{bin}/my-tool --version")
  end
end
```

3. Run `brew audit --strict Formula/my-tool.rb` to check for issues.
4. Run `brew install --build-from-source Formula/my-tool.rb` to test installation.

## License

[MIT](LICENSE)
