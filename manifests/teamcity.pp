# Install Teamcity

class teamcity {

    exec { 'Update repos':
      command => "sudo apt-get update"
    }

    package {
      'openjdk-7-jdk':
      ensure  => installed,
      require => Exec['Update repos']
    }

    exec { 'Download teamcity':
      command => "wget http://download.jetbrains.com/teamcity/TeamCity-8.1.3.tar.gz?_ga=1.144115703.350412549.1400070332",
      cwd => "/tmp",
      timeout => "0"
    }

    exec { 'Extract teamcity':
      command => "tar zxvf /tmp/TeamCity-8.1.3.tar.gz",
      cwd => "/var",
      require => Exec['Download teamcity']
    }

    exec { 'Start teamcity':
      command => "nohup sudo ./bin/runAll.sh start &",
      cwd => "/var/TeamCity",
      require => [Package['openjdk-7-jdk'],Exec['Extract teamcity']]
    }
    

}

include teamcity
