#This puppet manifest increases the limit of files demmanded (requested)

exec {'change maximum of opened files limitation':
command => 'sed -i "s/15/100000/" /etc/default/nginx && sudo service nginx restart',
path    => 'usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games'
}
