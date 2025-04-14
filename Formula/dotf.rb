class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.4.0/dotf-v1.4.0.tar.gz"
  sha256 "7deb4081df76c5e41aa361dfef57e556b22f19ba0e2f0371d6f5ea42e6a8576e"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/dotf-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9a6070a6fb87ea5a2a888e36c94cc189ad26abe73154f28d0ed217425881f29c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5627918ee4ec0d8443d36a467754913424770457376ee9fb58aa775cb4089884"
    sha256 cellar: :any_skip_relocation, ventura:       "6ed087ac11bcd2506dc916dd066239622f20a2e0ee170a51f6ce4007d4a535d7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8c5dea2927a6412df5984fe644b8acef18c7b8df28be83ad1e821a676c1d2616"
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
