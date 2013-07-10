require 'formula'

class Csound < Formula
  homepage 'http://www.csounds.com'
  url 'http://sourceforge.net/projects/csound/files/csound6/csound6.00/Csound6.00.tar.gz'
  sha1 '1de92681ed2c9067a9ae113fb518a06b259c02ad'
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
