class GitCm < Formula
  desc "CLI for creating conventional-commits friendly commit messages"
  homepage "https://github.com/mainrs/git-cm"
  url "https://github.com/mainrs/git-cm/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "1a8960058f7eaff99098e80d9f91017515ed1c2d5f2c337f756a553ffc4a4ff9"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/git-cm-0.2.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e2dd2d947440d59f29d06904cd039bf9a92c0762f680cd407d58fb186aea0517"
    sha256 cellar: :any_skip_relocation, ventura:       "306ba569d198eed10464f2c0f6ad5a81a19fc62adefcfc303a42982622e770cf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a4e7a5490dae28c1ea41a15e4bd71c0bc9ca67b4d437eff58ba28940386af33d"
  end

  depends_on "rust" => :build
  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/git-cm", "help"
  end
end
