
class cactos_monitoring_gui::config inherits cactos_monitoring_gui{
  # Generates app configuration and refreshes if necessary
  file {'/opt/Infrastructure-Tools-master/monitoring-dashboard/config.yml':
    require     => Archive['master.zip'],
    content     => epp("cactos_monitoring_gui/config.yml"),
    ensure      => file,
    notify      => Python::Gunicorn['monitoring-dashboard'],
  }
}
