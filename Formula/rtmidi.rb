require 'formula'

class Rtmidi < Formula
  homepage 'http://www.music.mcgill.ca/~gary/rtmidi'
  url 'http://www.music.mcgill.ca/~gary/rtmidi/release/rtmidi-2.0.1.tar.gz'
  sha1 '894be908bb3f1480cefcb24fc4bb77ff5383f5df'

  def install
    ENV.j1
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    #lib.install %w{ librtmidi.2.0.0.dylib, librtmidi.a, librtmidi.dylib  }
    lib.install Dir['librtmidi*']
    include.install Dir['*.h']
  end

#  test do
#    system "false"
#  end
end
