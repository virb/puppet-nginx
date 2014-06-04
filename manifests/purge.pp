# =Class: nginx::purge
# This class handles purging of default site configs
#
# =Parameters:
# default_sites:: Default site config paths [Array]
# purge:: Purge default sites [Bool]

class nginx::purge (
  $default_sites,
  $purge
) {

  if $purge {
    anchor { "${module_name}::purge::begin": }
    ->
    file { $default_sites:
      ensure => absent
    }
    ->
    anchor { "${module_name}::purge::end": }
  }
}
