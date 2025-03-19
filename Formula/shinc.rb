class Shinc < Formula
  desc "Generate bash cli script using `argc` command written in bash"
  homepage "https://github.com/druagoon/shinc"
  url "https://github.com/druagoon/shinc/releases/download/v1.0.0/shinc-v1.0.0.tar.gz"
  sha256 "5a07bdc29ef0a0f7d3f4936467c515fa66197e1d707926690876a2b9bd3a6f8f"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"
  depends_on "git"
  depends_on "git-cliff"
  depends_on "gnu-sed"
  depends_on "shfmt"
  depends_on "yq"

  def install
    bin.install Dir["bin/*"]
    man.install Dir["contrib/man/*"]
    share.install Dir['share/*']

    bash_completion.install "contrib/completions/bash/shinc"
    fish_completion.install "contrib/completions/fish/shinc.fish"
    zsh_completion.install "contrib/completions/zsh/_shinc"
  end

  test do
    system "#{bin}/shinc", "--version"
  end
end
