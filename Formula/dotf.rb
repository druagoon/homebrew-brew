class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.1.0/dotf-v1.1.0.tar.gz"
  sha256 "e944dbe45cfc4dd2648d98567233ad2d5adeff37cf1a667f9281e7c7d4233426"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/dotf-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a00cc404cb8112e8832c06edf7fb26eb9992cad05163181f47b251269d2d35cd"
    sha256 cellar: :any_skip_relocation, ventura:       "279d31fe91d751764f23dd2e219d8c80d24e3ee8096c5627e511a8a0ad206c15"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "95b076d90cd159939b22025f42537c68fe2a0d29a2fc196d75efa93253290119"
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
