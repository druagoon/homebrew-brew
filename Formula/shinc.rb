class Shinc < Formula
  desc "Generate a bash cli script using argc"
  homepage "https://github.com/druagoon/shinc-rs"
  url "https://github.com/druagoon/shinc-rs/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "87530fb4a5c01dcfb953aa585666766cda6fc6658bd1d662aba6085b459fbc84"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/shinc-1.1.0"
    sha256 cellar: :any,                 arm64_sequoia: "e7e040e48dc1d157bbda3a68a1bd7e1a7cb650095596fdee44078a2ef071ac46"
    sha256 cellar: :any,                 arm64_sonoma:  "33950e164bd81bcb2390a11437bac06392cc826ff47f24ea80865171a279911d"
    sha256 cellar: :any,                 ventura:       "53f612e7d833b792f6788b484a3754f073d16b4b41de2299c68d3d6d906ca16e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d4f9ede33a6bf1878242ff0046436a5079a7b9c6ea6dab68aae3239b6070e62e"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"
  depends_on "shfmt"
  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"shinc", "--generate-shell-completions")
  end

  test do
    system "#{bin}/shinc", "--version"
  end
end
