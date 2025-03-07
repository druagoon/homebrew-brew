class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.3.1/dotf-v1.3.1.tar.gz"
  sha256 "bc28671eabdf76bdadfe970090749ff751c3fe43cd1d969b034e765fa50f4b74"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/dotf-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e1d3a48125a7cee38d53c2ef946cda66185d657dfb65de2ce25ea5da4d01494"
    sha256 cellar: :any_skip_relocation, ventura:       "3523eea736fd045b2929aef08ba55113c5b5ea38c038b49b1bcd582a2c66f076"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "04a64d9118323f8236344efa15ef2ce3a8222ecbbe1923ee2d4d9570c119b8c0"
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
