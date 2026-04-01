class Kai < Formula
  desc "Your digital twin — powered by knowledge, not prompts"
  homepage "https://github.com/norenis/kai"
  license "MIT"
  version "0.0.0"

  on_macos do
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "kai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kai version")
  end
end
