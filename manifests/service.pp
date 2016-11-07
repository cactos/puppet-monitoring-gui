
class cactos_monitoring_gui::service inherits cactos_monitoring_gui{
  # Run the application
  python::gunicorn { 'monitoring-dashboard' :
    ensure      => present,
    mode        => 'wsgi',
    dir         => '/opt/Infrastructure-Tools-master/monitoring-dashboard/',
    appmodule   => 'main:app',
    timeout     => 30,
    bind        => "$app_host:$app_port",
    require     => Archive['master.zip'],
  }
}
