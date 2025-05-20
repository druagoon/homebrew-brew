class Rotz < Formula
  desc "Fully cross platform dotfile manager and dev environment bootstrapper"
  homepage "https://github.com/volllly/rotz"
  version "1.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/volllly/rotz/releases/download/v#{version}/rotz-aarch64-apple-darwin.zip"
      sha256 "8d8fccf7bc376613c22c682a6f16944385f80037a3b0d66f99871b676285444c"
    elsif Hardware::CPU.intel?
      url "https://github.com/volllly/rotz/releases/download/v#{version}/rotz-x86_64-apple-darwin.zip"
      sha256 "6283dd4e90b9ad77b1c1e04eba51b72d7e992a33f043b665ab0f28763ec28531"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/volllly/rotz/releases/download/v#{version}/rotz-x86_64-unknown-linux-musl.zip"
      sha256 "ff11ac59319cc0e54e388e81afb3b86a1ee7b887e651c2029bc417ba418aad02"
    end
  end

  def install
    bin.install "rotz"
    chmod 0755, bin/"rotz"

    generate_completions_from_executable(bin/"rotz", "completions")
  end

  test do
    system "#{bin}/rotz", "--help"
  end
end
