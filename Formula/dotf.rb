class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.1.0/dotf-v1.1.0.tar.gz"
  sha256 "e944dbe45cfc4dd2648d98567233ad2d5adeff37cf1a667f9281e7c7d4233426"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/dotf-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "946240163f14af6b708afcd894368c5c1a390527b0de6d40e2c9d0d11a2d4eb0"
    sha256 cellar: :any_skip_relocation, ventura:       "c367645ee1a6d5c1caed3a0650f8aeda7025166c9937a0983d7ce98ff30b33fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4df59bafa516bcd09dfe4826c78754f5e8cbc8eaf836939e80d9519a1814a666"
  end

  depends_on "gawk"
  depends_on "git-ignore"
  depends_on "gnu-sed"
  depends_on "stow"

  def install
    bin.install Dir["bin/*"]

    bash_completion.install "contrib/completions/bash/dotf"
    fish_completion.install "contrib/completions/fish/dotf.fish"
    zsh_completion.install "contrib/completions/zsh/_dotf"
  end

  test do
    system "#{bin}/dotf", "--version"
  end
end
