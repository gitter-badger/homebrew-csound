require 'formula'

class Csoundaccelerate < Formula
    homepage ''
    url 'https://github.com/eddyc/CsoundAccelerate/archive/v0.001.tar.gz'
    head 'https://github.com/eddyc/CsoundAccelerate.git'
    version '0.001'
    sha1 '68855a6c1e6f96ca4473c6f098c02acd8bc7e545'
    
    depends_on 'hdf5'
    depends_on 'Csound'
    
    def install
        
        system "xcodebuild -configuration Release ONLY_ACTIVE_ARCH=YES"
    end
end
