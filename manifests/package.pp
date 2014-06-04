# =Class: nginx::package
# This class manages the nginx package
#
# =Parameters:
# $package:: Name(s) of the nginx package. Defaults differ according to distro (see nginx::defaults) [String, Array]

class nginx::package (
  $package
) {
  package { $package:
    ensure => installed
  }
}
