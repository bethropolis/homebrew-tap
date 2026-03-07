class Localgo < Formula
  desc "LocalSend v2.1 protocol implementation in Go — send and receive files over LAN"
  homepage "https://github.com/bethropolis/localgo"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-macos-arm64"
      sha256 "89915f9f17a1dd26d63b412bc692fe39a3360295802c11ab0be3663215fae9bf"
    end
    on_intel do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-macos-amd64"
      sha256 "ddeae48a5b9eca5604e3d8b3c6c84ef57a9b0dac42a6acdfbcbf3c51ec9abb44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-linux-arm64"
      sha256 "e063094a3d897a5fc9a6feef77d485454f1091d10a5707683b647c8fddd895b4"
    end
    on_intel do
      url "https://github.com/bethropolis/localgo/releases/download/v#{version}/localgo-linux-amd64"
      sha256 "f4545d00a4fa0a278399cbe8061c35c95eb3216779f8ed2a04ea3c44aad866cc"
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
