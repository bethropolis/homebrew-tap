class Localgo < Formula
  desc "LocalSend v2.1 protocol implementation in Go — send and receive files over LAN"
  homepage "https://github.com/bethropolis/localgo"
  version "0.3.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-macos-arm64"
      sha256 "8fdf88c2c3864fa1153ad80083dfbf50c00206f983aa5c63d5bd635aa4527c91"
    end
    on_intel do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-macos-amd64"
      sha256 "864faaa0ed95873d65300229c5fc2e1547295727ee33c9888387a2976485587f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-linux-arm64"
      sha256 "211a5fac76d2bdba4e89394709f9be383a0bb490b7ab07cf702ae320182c63ca"
    end
    on_intel do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-linux-amd64"
      sha256 "3d7439013c1c960a2b2636a41e57312ea057cb3aef7e4c1389bfd06cf84f7f8d"
    end
  end

  def install
    os   = OS.mac? ? "macos" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "localgo-#{os}-#{arch}" => "localgo"
  end

  def post_install
    (var/"localgo/downloads").mkpath
  end

  test do
    assert_match "LocalGo", shell_output("#{bin}/localgo version")
  end
end
