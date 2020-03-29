class GlobusToolkit < Formula
  desc "Toolkit used for building grids"
  homepage "https://www.globus.org/toolkit/"
  version "6.0.1558548600"
  url "https://downloads.globus.org/toolkit/gt6/stable/installers/src/globus_toolkit-#{version}.tar.gz"
  sha256 "59a938ad6b43305c1d7e212a350260822e8c3b0a8cfd4d9bb68ff619992677cc"

  depends_on "pkg-config" => :build
  depends_on "libtool"
  depends_on "openssl@1.1"
  uses_from_macos "zlib"

  def install
    ENV.deparallelize
    ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
    man.mkpath
    system "./configure", "--prefix=#{libexec}",
                          "--mandir=#{man}",
                          "--disable-dependency-tracking"
    system "make"
    system "make", "install"
    bins = Dir["#{libexec}/bin/*"].select { |f| File.executable? f }
    bin.write_exec_script bins
  end

  test do
    system "#{bin}/globusrun", "-help"
  end
end
