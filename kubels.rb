# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubels < Formula
  desc "kubels (kube ls) is a Kubernetes tool that allows you to list Kubernetes resources with a simple command(s)."
  homepage "https://github.com/semihtok/kubels"
  version "0.2.1"
  license "Apache 2.0"

  depends_on "git"
  depends_on "go"

  on_macos do
    url "https://github.com/semihtok/kubels/releases/download/v0.2.1/kubels_0.2.1_darwin_amd64.tar.gz"
    sha256 "30f797846626f7419a5fe82eea304190c603008630b546ac9fe3c1709294e4ac"

    def install
      bin.install "kubels"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Kubels
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/semihtok/kubels/releases/download/v0.2.1/kubels_0.2.1_linux_armv6.tar.gz"
      sha256 "839c0451605c90ad0a221384cd7cb797990a35305620a375fcb42628ce51fdb4"

      def install
        bin.install "kubels"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/semihtok/kubels/releases/download/v0.2.1/kubels_0.2.1_linux_amd64.tar.gz"
      sha256 "2fba15bace295e3a62070921762a8f05bc417695864e47cedd82a744bf10894b"

      def install
        bin.install "kubels"
      end
    end
  end
end
