require 'formula'

class Csound < Formula
  homepage 'http://www.csounds.com'
  url 'http://sourceforge.net/projects/csound/files/csound6/Csound6.02/Csound6.02.tar.gz'
  sha1 '9903dd2825d533d08fa333adb85bb39a2ef3da77'
  head 'git://git.code.sourceforge.net/p/csound/csound6-git', :branch => 'develop'
  version '6.02.0'

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
  depends_on 'eigen' => :recommended

  option :universal

  def install
    system "cmake", ".", "-DUSE_GETTEXT=0", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "csound"
  end
end
