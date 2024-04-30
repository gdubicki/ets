class Ets < Formula
  desc "Command output timestamper"
  homepage "https://github.com/gdubicki/ets"
  url "https://github.com/gdubicki/ets/archive/v0.2.2.tar.gz"
  sha256 "decfe53acb1a912b51c81c22695f92caa72c79f1d6ec5ef23d0fb6be4e1f2db5"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X main.version=#{version}"
  end

  test do
    assert_match "[00:00:00]", shell_output("#{bin}/ets -s echo hello").chomp
  end
end
