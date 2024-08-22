#Fix the 500 internal error by changing phpp with php
exec {'fix-wp':
command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
path    => '/usr/local/bin/:/bin/'
}
