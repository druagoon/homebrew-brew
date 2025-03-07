class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.3.1/dotf-v1.3.1.tar.gz"
  sha256 "bc28671eabdf76bdadfe970090749ff751c3fe43cd1d969b034e765fa50f4b74"
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
    man.install Dir["contrib/man/*"]
    bash_completion.install "contrib/completions/bash/dotf"
    fish_completion.install "contrib/completions/fish/dotf.fish"
    zsh_completion.install "contrib/completions/zsh/_dotf"
  end

  test do
    system "#{bin}/dotf", "--version"
  end
end
