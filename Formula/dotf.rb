class Dotf < Formula
  desc "Lightweight and flexible bash tool for managing dotfiles efficiently"
  homepage "https://github.com/druagoon/dotf"
  url "https://github.com/druagoon/dotf/releases/download/v1.2.0/dotf-v1.2.0.tar.gz"
  sha256 "2f000968e771b26650b5e461ee3230062c35d5743b8fa8e6fa11b7d80ac5a8f6"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/dotf-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9c095a2eb693d2c5016092d1927d504a4b467f2cf4ead30493eae1e65538b23d"
    sha256 cellar: :any_skip_relocation, ventura:       "b51e4ef192628411b2c1ca5650e72bd9a2f3264ca2047431987a1ddd5a6157ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "301d1ac8ed4c603477b524b78e8a13467b92473db95b45a04b1237a61edc7109"
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
