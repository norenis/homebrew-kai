class Kai < Formula
  desc "Your digital twin — powered by knowledge, not prompts"
  homepage "https://github.com/norenis/kai"
  license "MIT"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-arm64.tar.gz"
      sha256 "7def63da757d0cb2d7bacaebf1a623a4e96f738ec09c601074f27539f6f2f836"
    end
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-amd64.tar.gz"
      sha256 "d6efd6c96c71de09bdc3f945a847b80e9ed71bef70be563ce787f258eea1f15c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-amd64.tar.gz"
      sha256 "e3048b61d8abd881710e1ee957837782dc636247d25f13f431d62be1ce645afa"
    end
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-arm64.tar.gz"
      sha256 "5bb359d1ac4c5e44e8212a34c9796ae30b6e69ff0d122b74b897e0b376a11f35"
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
