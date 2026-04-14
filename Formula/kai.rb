class Kai < Formula
  desc "Your digital twin — powered by knowledge, not prompts"
  homepage "https://github.com/norenis/kai"
  license "MIT"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-arm64.tar.gz"
      sha256 "3154f537c990f3868a7f4ad1bb65f0afddf5103565b006fe8c145385572b6368"
    end
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-amd64.tar.gz"
      sha256 "3b53190f0c6785a0eac7c93578d5941f585bd90deee1f04ada384b1aeac9b3da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-amd64.tar.gz"
      sha256 "46a60ca023a2ea8c2d351cf47b65ac85228614befbad4bf93892b99ceed4dbdb"
    end
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-arm64.tar.gz"
      sha256 "78f710d642ac0ed3ca544414bcde6bab50232fc1a3c3e49fe506348a29aaab35"
    end
  end

  def install
    bin.install "kai"
  end

  def caveats
    <<~EOS
      To get started, initialize your ~/.kai directory and register as an MCP server:
        kai setup

      Then set your API key:
        kai auth set-key --provider claude

      Run `kai --help` for all available commands.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kai version")
  end
end
