# =Class: nginx::service
# This class manages the nginx service
#
# =Parameters:
# $service:: Name of the nginx service [Default='nginx'] [String]

class nginx::service (
  $service
) {
  service { $service:
    enable    => true,
    ensure    => running,
    hasstatus => true
  }
}
