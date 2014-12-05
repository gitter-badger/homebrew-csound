require 'formula'

class Csound < Formula
  homepage 'http://csound.github.io'
  url 'http://sourceforge.net/projects/csound/files/csound6/Csound6.04/Csound6.04.tar.gz/download'
  sha1 '1f2676a25da894b2805ecde9465a33a7e4cc6009'
  head 'https://github.com/csound/csound.git', :branch => 'develop'
  version '6.03.2'

  depends_on 'cmake' => :build
  depends_on 'swig' => :build

  depends_on 'libsndfile'

  depends_on 'portaudio' => :recommended
  depends_on 'portmidi' => :recommended
  depends_on 'liblo' => :recommended
  depends_on 'boost' => :recommended
  depends_on 'libpng' => :recommended
  depends_on 'stk' => :optional
  depends_on 'fltk' => :recommended
  depends_on 'eigen' => :recommended

  option :universal

  def install
    if build.with? "stk"
      system "cmake", ".", "-DUSE_GETTEXT=0", "-DBUILD_STK_OPCODES=1", *std_cmake_args
    else
      system "cmake", ".", "-DUSE_GETTEXT=0", "-DBUILD_STK_OPCODES=0", *std_cmake_args
    end
    system "make", "install"
  end

  test do
    system "csound"
  end
end
