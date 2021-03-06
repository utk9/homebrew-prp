# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Prp < Formula
  desc "prp (Print Relative Path) command, written in Go"
  homepage "github.com/utk9/prp" 
  url "https://github.com/utk9/prp/archive/v1.0.tar.gz"
  sha256 "e90d4b8c3df7aacf19c9168b005d5952325a4f87a8ae01e427765e0148575d0c"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/utk9"
    ln_s buildpath, buildpath/"src/github.com/utk9/prp"
    system "go", "build", "-o", "prp", "."
    bin.install "prp"
  end

end
