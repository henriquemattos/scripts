#!/bin/bash

host="/var/www/hosts"
client=
domain=
bucket=

function usage {
    echo "usage: sync.sh [--client [client_name] --domain [domain.tld] --bucket [s3_bucket_name]]"
}

# Loop until all parameters are used up
while [ "$1" != "" ]; do
    case $1 in
        -c | --client ) shift
                        client=$1
                        ;;
        -d | --domain ) shift
                        domain=$1
                        ;;
        -b | --bucket ) shift
                        bucket=$1
                        ;;
        * )             usage
                        exit 1
    esac
    # Shift all the parameters down by one
    shift
done

if [ "$client" == "" ]; then
  echo "Please insert client name:"
  read client
fi

if [ "$domain" == "" ]; then
  echo "Please insert domain name:"
  read domain
fi

if [ "$bucket" == "" ]; then
  echo "Specify which S3 bucket to use:"
  read bucket
fi

if [[ ( "$client" == "" ) || ( "$domain" == "" ) || ( "$bucket" == "" ) ]]; then
  echo "we are done here!"
  exit 2
fi

args='--exclude "*"
--include "*.jpg"
--include "*.jpeg"
--include "*.gif"
--include "*.png"
--include "*.bmp"
--include "*.mov"
--include "*.mp4"
--include "*.mpeg"
--include "*.mp3"
--include "*.wav"
--include "*.js"
--include "*.css"
--include "*.json"
--include "*.gzip"
--include "*.woff"
--include "*.woff2"
--include "*.otf"
--include "*.eot"
--include "*.svg"
--include "*.ttf"
--include "*.xml"
--grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers'

echo "Would you like to sync TO [t] or FROM [f] the bucket? [t/f]"
read stream

if [ "$stream" == "f" ]; then
  echo "getting files from amazon"
  sync_inc="aws s3 sync s3://$bucket/wp-includes/ $hosts/$client/$domain/web/wp-includes/"
  sync_adm="aws s3 sync s3://$bucket/wp-admin/ $hosts/$client/$domain/web/wp-admin/"
  sync_con="aws s3 sync s3://$bucket/wp-content/ $hosts/$client/$domain/web/wp-content/"
else if [ "$stream" == "t" ]; then
  echo "sending files to amazon"
  sync_inc="aws s3 sync $hosts/$client/$domain/web/wp-includes/ s3://$bucket/wp-includes/"
  sync_adm="aws s3 sync $hosts/$client/$domain/web/wp-admin/ s3://$bucket/wp-admin/"
  sync_con="aws s3 sync $hosts/$client/$domain/web/wp-content/ s3://$bucket/wp-content/"
fi

eval $sync_inc $args --quiet &&
eval $sync_adm $args --quiet &&
eval $sync_con $args --quiet
