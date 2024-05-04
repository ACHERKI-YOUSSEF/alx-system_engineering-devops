#!/usr/bin/pup
# Install an especific version of flask (2.1.0)
# Define a class for clarity
class { 'install_flask':
# Ensure pip3 is available (adjust based on your system)
package { 'python3-pip': ensure => installed }

# Install Flask with specific version using pip provider
package { 'Flask':
ensure => installed,
provider => 'pip',
require => Package['python3-pip'],  # Ensure pip is installed first
# Specify the exact version
# You can use a comparison operator like '<= 2.1.0' for a range
version => '2.1.0',
}
}
