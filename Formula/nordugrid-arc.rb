class NordugridArc < Formula
  desc "Nordugrid Arc Client"
  homepage "http://www.nordugrid.org/arc/arc6/"
  version "6.6.0"
  url "https://download.nordugrid.org/packages/nordugrid-arc/releases/#{version}/src/nordugrid-arc-#{version}.tar.gz"
  sha256 "bdd3c0ee4ce3f8d1cb75736e0320cdc5211ad4895f1dca6c65bff044e7aa9376"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "glibmm"
  depends_on "libxml2"
  depends_on "libxmlsec1"
  #depends_on "globus-toolkit"

  def install
    ENV.cxx11
    system "./configure", "--disable-dependency-tracking",
                          "--disable-swig",
                          "--prefix=#{prefix}"
    system "make", "install"

    bins = Dir["#{libexec}/bin/*"].select { |f| File.executable? f }
    bin.write_exec_script bins
  end

  test do
    system "#{bin}/arcproxy", "-"
  end
end
