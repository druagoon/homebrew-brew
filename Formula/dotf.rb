class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.4.0/dotf-v1.4.0.tar.gz"
  sha256 "7deb4081df76c5e41aa361dfef57e556b22f19ba0e2f0371d6f5ea42e6a8576e"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/dotf-1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e1d5acb391eb015d93d07d9c045ea22c6e6d4a77e6a6d1a5f100e880e9966963"
    sha256 cellar: :any_skip_relocation, ventura:       "970aa865cf653f45619d05e4ce9300159c1dae203210e148b8b059481a3d1f62"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "61907eec11c426908838ac90e259ef72f494b71fe79ed0144335b81d16730867"
  end

  depends_on "gawk"
  depends_on "git-ignore"
  depends_on "gnu-sed"
  depends_on "stow"

  def install
    bin.install Dir["bin/*"]
    # Install man pages
    man.install Dir["share/man/*"]
    # Install bash, fish, and zsh completions
    bash_completion.install Dir["share/completions/bash/*"]
    fish_completion.install Dir["share/completions/fish/*"]
    zsh_completion.install Dir["share/completions/zsh/*"]
  end

  test do
    system "#{bin}/dotf", "--version"
  end
end
