
class cactos_monitoring_gui::install inherits cactos_monitoring_gui{

  ## install zip
  package{'zip':
    ensure => installed,
  }

  ## Install python, pip and gunicorn
  class { 'python' :
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'present',
  }

  # app installation path
  file {'/opt':
    ensure => directory,
    owner  => 'www-data',
    group  => 'www-data',
  }->
  ## download and unzip code:
  archive { "master.zip":
    ensure        => present,
    path          => "/opt/master.zip",
    source         => "https://github.com/cactos/Infrastructure-Tools/archive/master.zip",
    extract       => true,
    creates       => '/opt/Infrastructure-Tools-master/monitoring-dashboard/main.py',
    extract_path  => '/opt/',
    cleanup       => false,
    user          => 'www-data',
    group         => 'www-data',
  }->
  # Install all the requirements
  python::requirements { '/opt/Infrastructure-Tools-master/monitoring-dashboard/requirements.txt' :  }

  # Store current build version to track it for redownloading
  file {'/opt/version':
    content => "$app_build",
    audit   => content,
  }

  # Executes a redownload if the version file changed
  exec {'redownload':
    command => '/bin/rm -rf /opt/master.zip; /bin/rm -rf /opt/Infrastructure-Tools-master',
    notify => Archive['master.zip'],
    subscribe     => File['/opt/version'],
    refreshonly   => true,
  }
}
