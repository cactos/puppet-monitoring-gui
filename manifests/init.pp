# Class: cactos_monitoring_gui
# ===========================
#
# Installs the cactos monitoring gui
#
# Parameters
# ----------
#
# * `server_thrift_host`
#   Specify the host where thrift is running
# 
# * `server_thrift_port`
#   Specify the port thrift is listening on
#
# * `app_host`
#   Bind address the monitoring gui should run on
#
# * `app_port`
#   Listening port for the monitoring gui
#
# * `app_build`
#   Specify a build version
#
# Examples
# --------
#
# @example
#    class { 'cactos_monitoring_gui':
#      $server_thrift_host => '192.168.100.100',
#      $server_thrift_port => '9000',
#      $app_build          = "393"
#      $app_host           = "0.0.0.0"
#      $app_port           = "5060"
#    }
#
# Authors
# -------
#
# Simon Volpert <simon.volpert@uni-ulm.de>
#
class cactos_monitoring_gui( 
  String $server_thrift_host = $cactos_monitoring_gui::params::server_thrift_host,
  String $server_thrift_port = $cactos_monitoring_gui::params::server_thrift_port,
  String $app_host           = $cactos_monitoring_gui::params::app_host,
  String $app_port           = $cactos_monitoring_gui::params::app_port,
  String $app_build          = $cactos_monitoring_gui::params::app_build,
)inherits cactos_monitoring_gui::params {


  contain cactos_monitoring_gui::install
  contain cactos_monitoring_gui::config
  contain cactos_monitoring_gui::service
  Class['::cactos_monitoring_gui::install']->
  Class['::cactos_monitoring_gui::config']->
  Class['::cactos_monitoring_gui::service']


}
