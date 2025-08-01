class Shinc < Formula
  desc "Generate a bash cli script using argc"
  homepage "https://github.com/druagoon/shinc-rs"
  url "https://github.com/druagoon/shinc-rs/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "87530fb4a5c01dcfb953aa585666766cda6fc6658bd1d662aba6085b459fbc84"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/shinc-1.0.0"
    sha256 cellar: :any,                 arm64_sequoia: "2c8e198a4900200c3e00a27b26f4e4fd700d8a3cd7eacb0859473459a219180f"
    sha256 cellar: :any,                 arm64_sonoma:  "32302026c0255f1892fa2a7354b1098d44e668e0ddd04959cf258bda5b198c96"
    sha256 cellar: :any,                 ventura:       "677fe80a9e4ebab3b2d0e172472e4fb58f48b5c14449c3054711dfd6822693ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b5c5d833e116a46451d744310d7e6460c4b738d4cae66c534a717775e1aca5d2"
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
