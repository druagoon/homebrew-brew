class Icli < Formula
  desc "Includes various commonly used utilities for personal use"
  homepage "https://github.com/druagoon/icli-rs"
  url "https://github.com/druagoon/icli-rs/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "5701f7869d5fed3e4171482db21bb5836bd94b3622a37b532957581c674d33fd"
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
