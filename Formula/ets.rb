class Ets < Formula
  desc "Command output timestamper"
  homepage "https://github.com/gdubicki/ets"
  url "https://github.com/gdubicki/ets/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "c91fd1ff15dfa343d0bcfff543578c8645ee18ce4e07968a11f277fb41b9b5c5"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X main.version=#{version}"
  end

  test do
    assert_match "[00:00:00]", shell_output("#{bin}/ets -s echo hello").chomp
  end
end
