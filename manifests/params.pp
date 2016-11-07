# == Class cactos_monitoring_gui::params
#
# This class is meant to be called from cactos_monitoring_gui.
# It sets variables according to platform.
#
class cactos_monitoring_gui::params{ 
  $app_build          = "393"
  $server_thrift_host = "0.0.0.0"
  $server_thrift_port = "9000"
  $app_host           = "0.0.0.0"
  $app_port           = "5060"
}
