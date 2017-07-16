#!/bin/bash
# need to rollback?

check_user() {
  echo "\nChecking for user..."
  if [[ $1 ]]; then
    user=$1
  else
    echo "\nEnter username:"
    read user
  fi
  user_exists=`id $user > /dev/null 2>&1`
# user=`grep "^${1}:" /etc/passwd|cut -d":" -f1`
  if [ "$?" -ne "0" ]; then
    echo "\nUser does not exists. End of execution!\n"
    exit 1
  fi
}

check_site() {
  echo "\nChecking for site..."
  if [[ $2 ]]; then
    domain=$2
  else
    echo "\nEnter site name:"
    read domain
  fi
  dir="/var/www/hosts/$user/$domain/web/"
#  dir="/Users/$user/Projects/$domain/"
  dir_exists=`ls -A $dir > /dev/null 2>&1`
  if [ "$?" -ne "0" ]; then
    echo "\nDirectory does not exists: " $dir
    exit 1
  fi
}

download_bucket() {
  echo "\nDownloading S3 bucket..."
  if [[ $3 ]]; then
    bucket=$3
  else
    echo "\nEnter S3 Bucket name:"
    read bucket
  fi
  aws s3 mv s3://$bucket/wp-content/uploads /var/www/hosts/$1/$2/web/wp-content/uploads --recursive --include "*" --quiet
  aws s3 rm s3://$bucket --recursive --include "*"
  aws s3 rb s3://$bucket --force
}

zip_content() {
  cd /var/www/hosts/$1/$2/web/
  zip -r9q /home/ec2-user/$1.zip ./wp-content/*
  mv -f /home/ec2-user/$1.zip ../../../$client/$domain/web/
  chown apache:$client ../../../$client/$domain/web/$1.zip
  cd  /home/ec2-user/
}

remove_user() {
  echo "\n\n You are about to remove the user and their home directory for good. Are you sure you want to continue? [y/n]:"
  read remove
  if [[ "$remove" -eq "y" ]]; then
    rm -f /etc/httpd/conf.d/vhost-$1.conf
    userdel -rf $1
  else
    echo "\n User was not removed."
    id $1
    exit 1
  fi
}

##Main script
check_user $1
check_site $user $2
download_bucket $user $domain $3
#export_database $user $domain
zip_content $user $domain
remove_user $user
