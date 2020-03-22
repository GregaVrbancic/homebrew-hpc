class NordugridArc < Formula
  desc "Nordugrid Arc Client"
  homepage "http://www.nordugrid.org/arc/arc6/"
  version "6.5.0"
  url "https://download.nordugrid.org/packages/nordugrid-arc/releases/#{version}/src/nordugrid-arc-#{version}.tar.gz"
  sha256 "93a5af2e1e5e767bd17fa0b49ed1f446891e5e7b97b041b0caf523a3cc0633bd"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "glibmm"
  depends_on "globus-toolkit"
  depends_on "libxml2"
  depends_on "libxmlsec1"
  depends_on "python2"

  def install
    ENV.cxx11
    system "./configure", "--disable-dependency-tracking",
                          "--disable-swig",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/arcproxy", "-"
  end
end
