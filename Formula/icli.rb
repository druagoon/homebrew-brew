class Icli < Formula
  desc "Personal command-line tool includes various commonly used utilities"
  homepage "https://github.com/druagoon/icli-rs"
  url "https://github.com/druagoon/icli-rs/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "c92ccc9f4951234a321691dd899a21146c40c1a16b0b84988d0221d25e5a6f03"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-icli/releases/download/icli-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2403228d0be4efc181473a783266f654750a225d8e2afe4c9be1546019665503"
    sha256 cellar: :any_skip_relocation, ventura:       "96419354079a3da0b8735d06efb9a7ae43e9ed8642aff88b9044ef28282fc22b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3aa6dbb6db0399e30a02733f881edd96c90fa54e6f908b37f4998089ca128a18"
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
