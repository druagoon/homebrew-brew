class Icli < Formula
  desc "Personal command-line tool includes various commonly used utilities"
  homepage "https://github.com/druagoon/icli-rs"
  url "https://github.com/druagoon/icli-rs/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "3d8298d96a9446db8c85898d684120e5f7e00bea750e6249872cbbbcc703a6e1"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/icli-1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d51a13dc2fcd24e1b41725a8c7dea6b23188d2de486d1b550ec0989f837985ad"
    sha256 cellar: :any_skip_relocation, ventura:       "9ea0b3acb9ebc775425720c8b06a2d195ab6429509a1d4c8312a51d9847d97e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c3daee142955ef4c0532dacdae96f1d6c4695499df68f1245a47486b540a3fd1"
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
