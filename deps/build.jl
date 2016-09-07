using BinDeps
using Compat
import Compat: String

@BinDeps.setup

libxc = library_dependency("libxc", aliases=["libxc", "libxc.4.0.0"])

source_uri = URI("http://www.tddft.org/programs/octopus/down.php?file=libxc/libxc-3.0.0.tar.gz")
srcsha = "5542b99042c09b2925f2e3700d769cda4fb411b476d446c833ea28c6bfa8792a"

provides(Sources,
        source_uri, 
        libxc, filename="libxc-3.0.0.tar.gz", unpacked_dir="libxc-3.0.0",
        SHA = srcsha)


provides(BuildProcess,
        Autotools(libtarget="src/.libs/libxc.so", configure_options=["--enable-shared","--disable-fortran"]), libxc, os=:Unix)


#if is_unix() 
#    libxc_dir = BinDeps.depsdir(libxc)
#    provides(BuildProcess,
#        (@build_steps begin
#            `./configure --enable-shared --disable-fortran`
#            @build_steps begin
#                `make`
#            end
#        end), libxc, installed_libpath=joinpath(libxc_dir, "src", ".libs"))
#end

if is_apple() || is_windows()
    error("Apple and Windows not supported yet")
end

#if is_apple() 
#    if Pkg.installed("Homebrew") === nothing
#		error("Homebrew package not installed, please run Pkg.add(\"Homebrew\")")
#	end
#	using Homebrew
#	provides(Homebrew.HB, "mbedtls", mbed_all)
#end
#
#if is_windows() 
#    unpacked_dir = Int==Int32 ? "usr/bin32" : "usr/bin64"
#    provides(
#        Binaries,
#        URI("https://malmaud.github.io/files/mbedtls-2.1.1-r1.zip"),
#        mbed_all,
#        unpacked_dir=unpacked_dir,
#        SHA = "ab5a86d6c35d478082722e08747742fe04bf761a8e3ac4f3c960159244bbd8d8")
#end


@BinDeps.install Dict("libxc"=>"LIBXC")
