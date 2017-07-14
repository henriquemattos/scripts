#!/bin/bash

client=$1
domain=$2
#bucket=$3
#awsuser=$4

host="/var/www/hosts"

if [ ! -d $host/$client ]; then
  echo "Client does not exists"
  return 0
fi

rm -rf $host/$client/$domain/web/wp-content/themes/jupiter
rm -rf $host/$client/$domain/web/wp-content/themes/jupiterbkp
rm -rf $host/$client/$domain/web/wp-content/plugins/js_composer_theme
unzip -q /home/ec2-user/virtualhost/jupiter.zip -d $host/$client/$domain/web/wp-content/themes/

chown -R apache:$client $host/$client/$domain/web/wp-content
find $host/$client/$domain/web/ -type d -exec chmod 2755 {} \;
find $host/$client/$domain/web/ -type f -exec chmod 0644 {} \;

setfacl -R -m u:$client:rwx $host/$client/$domain/web

*.jpg
*.jpeg
*.gif
*.png
*.css
*.js
*.woff
*.woff2
*.otf
*.gzip
*.json
*.mov
*.pdf
*.doc
*.docx

#aws configure --profile $awsuer

#aws s3 sync $host/$client/$domain/web/wp-content/ s3://$bucket/wp-content/ --exclude "*" --include "*.jpg" --include "*.gif" --include "*.png" --include "*.woff" --include "*.css" --include ".js" --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers

#echo "Completed"
#return 1
