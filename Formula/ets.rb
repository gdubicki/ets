class Ets < Formula
  desc "Command output timestamper"
  homepage "https://github.com/gdubicki/ets"
  url "https://github.com/gdubicki/ets/archive/v0.1.tar.gz"
  sha256 "7d7bf592cb36da25c941a10989622a0a0dd1a99c5dc037e840a25462a5401d66"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X main.version=#{version}"
  end

  test do
    assert_match "[00:00:00]", shell_output("#{bin}/ets -s echo hello").chomp
  end
end
