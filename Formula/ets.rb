class Ets < Formula
  desc "Command output timestamper"
  homepage "https://github.com/gdubicki/ets"
  url "https://github.com/gdubicki/ets/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "ec0e34ee4dc1da16c89efb1cf98f7f8b26cc836a48548b79175eac4093c45215"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X main.version=#{version}"
  end

  test do
    assert_match "[00:00:00]", shell_output("#{bin}/ets -s echo hello").chomp
  end
end
