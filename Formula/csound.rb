require 'formula'

class Csound < Formula
  homepage 'http://www.csounds.com'
  url 'http://www.kunstmusik.com/Csound-6.0.1-Source.tar.bz2'
  sha1 '038e5a2006f6f0796eb8f00ddf78853d1e769362'
  head 'git://git.code.sourceforge.net/p/csound/csound6-git'

  depends_on 'cmake' => :build
  depends_on 'swig' => :build

  depends_on 'libsndfile'

  depends_on 'portaudio' => :recommended
  depends_on 'portmidi' => :recommended
  depends_on 'liblo' => :recommended
  depends_on 'boost' => :recommended
  depends_on 'libpng' => :recommended
  depends_on 'stk' => :recommended
  depends_on 'fltk' => :recommended

  option :universal

  def install
    system "cmake", ".", "-DUSE_GETTEXT=0", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "csound"
  end
end
