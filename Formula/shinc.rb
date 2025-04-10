class Shinc < Formula
  desc "Generate a bash cli script using `argc`"
  homepage "https://github.com/druagoon/shinc-rs"
  url "https://github.com/druagoon/shinc-rs/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9ee12db1bab89bcf020e0699d661228e2a98a0b6b7b77fc4b8e8d5bd8e62262c"
  license "MIT"

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
