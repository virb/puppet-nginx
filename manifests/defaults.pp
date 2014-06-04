# =Class: nginx::defaults
# This module manages the default values for all nginx classes

class nginx::defaults {

  # OS-specific defaults
  case $operatingsystem {
    Debian,Ubuntu: {
      $package           = 'nginx'
      $service           = 'nginx'
      $sites_avail_dir   = '/etc/nginx/sites-available'
      $sites_enabled_dir = '/etc/nginx/sites-enabled'
      $default_sites     = [
        '/etc/nginx/sites-available/default',
        '/etc/nginx/sites-enabled/default'
      ]
    }
    CentOS,RedHat: {
      $package       = 'nginx'
      $service       = 'nginx'
      $sites_dir     = '/etc/nginx/conf.d'
      $default_sites = [
        '/etc/nginx/conf.d/default.conf',
        '/etc/nginx/conf.d/ssl.conf',
        '/etc/nginx/conf.d/virtual.conf'
      ]
    }
    default: {
      err( "${module_name} has not yet been implemented on $operatingsystem" )
    }
  }
}
