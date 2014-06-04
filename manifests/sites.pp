# =Class: nginx::sites
# This class handles site configs
#
# =Parameters:
# $sites:: Hash of nginx site sources or templates [Hash]

class nginx::sites (
  $sites_dir         = undef,
  $sites_avail_dir   = undef,
  $sites_enabled_dir = undef,
  $sites
) {

  case $operatingsystem {
    Debian,Ubuntu: {
      $defaults = {
        sites_avail_dir   => $sites_avail_dir,
        sites_enabled_dir => $sites_enabled_dir
      }
      create_resources(sites::debian, $sites, $defaults)
    }
    CentOS,RedHat: {
      $defaults = {
        sites_dir => $sites_dir
      }
      create_resources(site::redhat, $sites, $defaults)
    }
  }
}
