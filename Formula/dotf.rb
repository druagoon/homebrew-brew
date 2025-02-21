class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.0.0/dotf-v1.0.0.tar.gz"
  sha256 "591a637c4ee8a2dcd9a7b6cacf0d1a6012e555eaacde8f9f134efe02b191befc"
  license "MIT"

  depends_on "gawk"
  depends_on "git-ignore"
  depends_on "gnu-sed"
  depends_on "stow"
  depends_on "wget"

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
