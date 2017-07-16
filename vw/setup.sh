#!/bin/bash

client=$1
domain=$2
#salt=$3

host="/var/www/hosts"
#gen_passwd() { dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev; }
#passwd=$(gen_passwd)

#gen_passwd() { perl -e'print crypt($salt, date)'; }
#passwd=$(gen_passwd)
passwd=$3

check_user(){ grep -c '^'$client':' /etc/passwd; }

if [ $(check_user) == "0" ]; then
  useradd -d $host/$client -G apache -p "$passwd" $client
else
  echo 'User exists!\n'
fi

if [ ! -d $host/$client ]; then
  mkdir $host/$client
else
  echo 'Client directory exists!\n'
fi

if [ ! -d $host/$client/$domain ]; then
  mkdir $host/$client/$domain
  mkdir $host/$client/$domain/logs
  mkdir $host/$client/$domain/web
else
  echo 'Domain directory exists!\n'
fi

echo "Install WordPress? [y/n]"
read install_wp

if [ $install_wp == "y" ]; then
  #TODO check if zip is downloaded
  #wget -q https://br.wordpress.org/wordpress-latest-pt_BR.zip
  #unzip -q wordpress-latest-pt_BR.zip -d $host/$client/$domain/web/
  cp -rf /home/ec2-user/virtualhost/wordpress/* $host/$client/$domain/web/
  #rm -rf $host/$client/$domain/web/wordpress $host/$client/$domain/web/wordpress-latest-pt_BR.zip

  #TODO check if zip is downloaded
  #wget -q https://downloads.wordpress.org/plugin/w3-total-cache.zip
  #unzip -q w3-total-cache.zip -d $host/$client/$domain/web/wp-content/plugins/

  #TODO check if zip is downloaded
  #wget -q https://downloads.wordpress.org/plugin/wp-mail-smtp.zip
  #unzip -q wp-mail-smtp.zip -d $host/$client/$domian/web/wp-content/plugins/

  #TODO check if zip is downloaded
  #wget -q https://downloads.wordpress.org/plugin/sucuri-scanner.zip
  #unzip -q sucuri-scanner.zip -d $host/$client/$domain/web/wp-content/plugins/

  #TODO check if zip is downloaded
  #wget -q https://downloads.wordpress.org/plugin/amazon-web-services.zip
  #unzip -q amazon-web-services.zip -d $host/$client/$domain/web/wp-content/plugins/

  #TODO check if zip is downloaded
  #wget -q https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.zip
  #unzip -q amazon-s3-and-cloudfront.zip -d $host/$client/$domain/web/wp-content/plugins/

  #rm -f $host/$client/$domain/web/wp-content/plugins/*.zip readme.html
  rm -f $host/$client/$domain/web/readme.html

  cp -rf /var/www/backup/$client/$domain/web/wp-config.php $host/$client/$domain/web/
  cp -rf /var/www/backup/$client/$domain/web/wp-content/* $host/$client/$domain/web/wp-content/
  cp -f /var/www/backup/$client/$domain/web/.htaccess $host/$client/$domain/web/
  #TODO ask to install jupiter
  #TODO remove tweenty* themes
fi

file='/etc/httpd/conf.d/vhost-'$client'.conf'

#if [ -f $file ]; then
#    echo 'File exists'
#fi
echo '<VirtualHost *:80>' >> $file
echo '    DocumentRoot '$host'/'$client'/'$domain'/web' >> $file
echo '    <Directory '$host'/'$client'/'$domain'/web>' >> $file
echo '        allow from all' >> $file
echo '        Options +Indexes' >> $file
echo '    </Directory>' >> $file
echo '    ErrorLog '$host'/'$client'/'$domain'/logs/error.log' >> $file
echo '    CustomLog '$host'/'$client'/'$domain'/logs/access.log common' >> $file
echo '    ServerAlias '$domain >> $file
echo '    ServerName www.'$domain >> $file
echo "Is HTTPS? [y/n]"
read is_https
if [ $is_https == "y" ]; then
echo '    SetEnvIfNoCase X-FORWARDED-PROTO "^https$" HTTPS' >> $file
fi
echo '</VirtualHost>' >> $file

chown -R $client:apache $host/$client
find $host/$client -type d -exec sudo chmod 2755 {} \;
find $host/$client -type f -exec sudo chmod 0644 {} \;
setfacl -R -m u:apache:rwx $host/$client
