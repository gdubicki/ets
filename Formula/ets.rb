class Ets < Formula
  desc "Command output timestamper"
  homepage "https://github.com/gdubicki/ets"
  url "https://github.com/gdubicki/ets/archive/v0.3.0.tar.gz"
  sha256 "0586c5f1608c0a8eba7a27e2e0605129cab634c21d1206eb99fabdf70f68af3d"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X main.version=#{version}"
  end

  test do
    assert_match "[00:00:00]", shell_output("#{bin}/ets -s echo hello").chomp
  end
end
