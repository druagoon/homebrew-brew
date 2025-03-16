class Icli < Formula
  desc "Personal command-line tool includes various commonly used utilities"
  homepage "https://github.com/druagoon/icli-rs"
  url "https://github.com/druagoon/icli-rs/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "3d8298d96a9446db8c85898d684120e5f7e00bea750e6249872cbbbcc703a6e1"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/icli-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5635a98df485036804dbf67e551fa53e4b53543a59dcde2ac9c81327cd9cb5c5"
    sha256 cellar: :any_skip_relocation, ventura:       "2eea215c9e9aa4ac26edfcbe114ef2cf1b04e970506d5fbe34a770bee985862c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "75507b35263d79b0d13d2572426253cde4269137fde73ac88318ac2ac42ea146"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", "--all-features", *std_cargo_args

    generate_completions_from_executable(bin/"icli", "completion")
  end

  test do
    system "#{bin}/icli", "--version"
  end
end
