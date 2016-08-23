class Tomcat5 < Formula
    desc "Implementation of Java Servlet and JavaServer Pages"
    homepage "https://tomcat.apache.org/"
    url "http://archive.apache.org/dist/tomcat/tomcat-5/v5.5.36/bin/apache-tomcat-5.5.36.tar.gz"
    sha256 "572c57236c28e3066d6ed08e991cb2d3d00740e3b29853bdb841673e0adcbf06"
    
    bottle :unneeded
    
    keg_only "Some scripts that are installed conflict with other software."

def install
    rm_rf Dir["bin/*.{cmd,bat]}"]
    libexec.install Dir["*"]
    (libexec+"logs").mkpath
    bin.mkpath
    Dir["#{libexec}/bin/*.sh"].each { |f| ln_s f, bin }
end

def caveats; <<-EOS.undent
    Some of the support scripts used by Tomcat have very generic names.
    These are likely to conflict with support scripts used by other Java-based
    server software.
    You can link Tomcat into PATH with:
    brew link tomcat5
    or add #{bin} to your PATH instead.
    EOS
end
end