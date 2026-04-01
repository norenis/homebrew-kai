class Kai < Formula
  desc "Your digital twin — powered by knowledge, not prompts"
  homepage "https://github.com/norenis/kai"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-arm64.tar.gz"
      sha256 "319ff74b41a29b6b07e3d81498314ee9fe91da827adfb983e5499704b6daec00"
    end
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-darwin-amd64.tar.gz"
      sha256 "4e39fc6f9c57de6fd7e8d94ce591b104d8b4d1f00d7543c8a2b0ac541cc092a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/norenis/kai/releases/download/v#{version}/kai-linux-amd64.tar.gz"
      sha256 "4b5d40c6750893c56bc1cab6c4af60c081baa10b08c4dec5433b86e9ea884622"
    end
  end

  def install
    bin.install "kai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kai version")
  end
end
