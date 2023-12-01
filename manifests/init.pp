#
# @summary Manages powertop
#
# @param ensure
#   Whether powertop should be present or absent.
#
class powertop (
  Enum['present', 'absent'] $ensure = 'present',
) {
  $pkg_name = 'powertop'

  package { $pkg_name:
    ensure => $ensure,
  }

  if $ensure == present {
    # powertop service unit tweaks values and then exits. There is no persistent daemon.
    service { 'powertop':
      enable  => true,
      require => Package[$pkg_name],
    }
  }
}
