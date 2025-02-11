class Icli < Formula
  desc "Includes various commonly used utilities for personal use"
  homepage "https://github.com/druagoon/icli-rs"
  url "https://github.com/druagoon/icli-rs/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "5701f7869d5fed3e4171482db21bb5836bd94b3622a37b532957581c674d33fd"
  license "MIT"

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
