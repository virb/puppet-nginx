# =Class: nginx::config
# This class handles the main nginx configs
#
# =Parameters:
# $config_content = Config file content
# $config_source = Config file source

class nginx::config (
  $config_content = undef,
  $config_source  = undef
) {
  if $config_source and $config_content {
     err( "${module_name}::config: config_content and config_source cannot both be specified" )
  } elsif $config_source {
     $content = undef
     $source  = $config_source
  } elsif $config_content {
     $content = $config_content
     $source  = undef
  }

  anchor { "${module_name}::config::begin": }
  ->
  file { '/etc/nginx/nginx.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $content,
    source  => $source,
    notify  => Service['nginx']
  }
  ->
  anchor { "${module_name}::config::end": }
}
