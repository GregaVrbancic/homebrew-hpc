class NordugridArc < Formula
  desc "Nordugrid Arc Client"
  homepage "http://www.nordugrid.org/arc/arc6/"
  url "https://download.nordugrid.org/packages/nordugrid-arc/releases/6.4.1/src/nordugrid-arc-6.4.1.tar.gz"
  sha256 "41c9fe864e3a28e861460790acab9bce8eec5ee7cb626c9fcfb75125f81637f9"

  depends_on "pkg-config" => :build	
  depends_on "gettext"	
  depends_on "glib"	
  depends_on "glibmm"	
  depends_on "globus-toolkit"	
  depends_on "libxml2"

  def install
    ENV.cxx11	
    system "./configure", "--disable-dependency-tracking",	
                          "--disable-swig",	
                          "--prefix=#{prefix}"	
    system "make", "install"
  end

  test do
    (testpath/"foo").write("data")	
    system "#{bin}/arccp", "foo", "bar"
  end
end
