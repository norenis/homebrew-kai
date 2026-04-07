class Kai < Formula
  desc "Your digital twin — powered by knowledge, not prompts"
  homepage "https://github.com/norenis/kai"
  license "MIT"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-arm64.tar.gz"
      sha256 "75d242aa7d18e0b60c5820bcbbd24b0d00fbe41723aabd05c9df101a43b3459f"
    end
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-amd64.tar.gz"
      sha256 "88fc46408ec1dfaa4de13d6cb697328e56c76b95cdbb6870b81ddd52a1ed2ce4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-amd64.tar.gz"
      sha256 "e72ba6c5882af4718b1ee7f4ad57973f2e4fc74a45e94d97294d37d3a5fabc4c"
    end
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-arm64.tar.gz"
      sha256 "5ec427756f2def5c63a07326a458ce736cfb132c8d6e37ed6fc4137c5e5ecd9b"
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
