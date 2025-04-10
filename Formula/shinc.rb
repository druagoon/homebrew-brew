class Shinc < Formula
  desc "Generate a bash cli script using `argc`"
  homepage "https://github.com/druagoon/shinc-rs"
  url "https://github.com/druagoon/shinc-rs/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9ee12db1bab89bcf020e0699d661228e2a98a0b6b7b77fc4b8e8d5bd8e62262c"
  license "MIT"

  bottle do
    root_url "https://github.com/druagoon/homebrew-brew/releases/download/shinc-1.0.0"
    sha256 cellar: :any,                 arm64_sequoia: "8c8307aebc0369dcd32ef3d3244c7de695c89d2c9d65002b9a308342b99a83c3"
    sha256 cellar: :any,                 ventura:       "9a23b59ec7145fa4f873b262e67ca1e39ba53acc0f946d49319f3c08360a3eb7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d459f8b35928fdfc4579e153d5cb3e2391c147fbefe5299a0768bdbc4a5ebae0"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"
  depends_on "shfmt"
  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"shinc", "--generate-shell-completions")
  end

  test do
    system "#{bin}/shinc", "--version"
  end
end
