class ProtocGenDoc < Formula
  desc "Documentation generator plugin for Google Protocol Buffers"
  homepage "https://github.com/estan/protoc-gen-doc"
  url "https://github.com/estan/protoc-gen-doc/archive/v0.8.tar.gz"
  version "0.8"
  sha256 "fabd54c9bc75558a659ee0f1e52fc2c65014084de4aa5e329a3778c2c88155ee"
  head "https://github.com/estan/protoc-gen-doc.git"

  depends_on "qt5"

  def install
    if not `#{HOMEBREW_PREFIX}/bin/brew ls --versions google-protobuf`.empty?
      ENV.prepend "PROTOBUF_PREFIX", `#{HOMEBREW_PREFIX}/bin/brew --prefix google-protobuf`.chomp!
    else
      ENV.prepend "PROTOBUF_PREFIX", `#{HOMEBREW_PREFIX}/bin/brew --prefix protobuf`.chomp!
    end
    system "qmake"
    system "make"
    bin.install "protoc-gen-doc"
  end

  test do
    system "echo test > proto-gen-doc"
  end
end
