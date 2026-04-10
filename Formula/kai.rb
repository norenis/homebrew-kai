class Kai < Formula
  desc "Your digital twin — powered by knowledge, not prompts"
  homepage "https://github.com/norenis/kai"
  license "MIT"
  version "1.0.2"

  on_macos do
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-arm64.tar.gz"
      sha256 "09ad6e284e1f169002e756207a292849f2424c382026c76bded90bbde02c9b16"
    end
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-amd64.tar.gz"
      sha256 "e49aff48a9843e321e59af717ed27e1147ccab8df9372b01c7593ff6759d592a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-amd64.tar.gz"
      sha256 "89ae0d4315479014bd45613526caf7ad77786eeb52d73989bc8f309400fcc27f"
    end
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-arm64.tar.gz"
      sha256 "d420d1bc4b45cecfba7ea0ddaaf162f71f0549497b098de92a1f806ccc9426ac"
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
