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

eval aws s3 sync /var/www/hosts/amandamiranda/amandamiranda.com.br/web/wp-includes/ s3://vworks-amandamiranda/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandamiranda/amandamiranda.com.br/web/wp-admin/ s3://vworks-amandamiranda/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandamiranda/amandamiranda.com.br/web/wp-content/ s3://vworks-amandamiranda/wp-content/ $args --quiet
eval aws s3 sync /var/www/hosts/amandamiranda/amandamiranda.com.br/web/content/ s3://vworks-amandamiranda/content/ $args --quiet

eval aws s3 sync /var/www/hosts/amandapereira/brunapasquotto.com.br/web/wp-includes/ s3://vw-brunapasquotto/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/brunapasquotto.com.br/web/wp-admin/ s3://vw-brunapasquotto/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/brunapasquotto.com.br/web/wp-content/ s3://vw-brunapasquotto/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/amandapereira/grupoap2.com.br/web/wp-includes/ s3://vw-grupoap2/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/grupoap2.com.br/web/wp-admin/ s3://vw-grupoap2/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/grupoap2.com.br/web/wp-content/ s3://vw-grupoap2/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/amandapereira/andrepolonca.com.br/web/wp-includes/ s3://vw-andrepolonca/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/andrepolonca.com.br/web/wp-admin/ s3://vw-andrepolonca/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/andrepolonca.com.br/web/wp-content/ s3://vw-andrepolonca/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/amandapereira/amandapereira.com.br/web/wp-includes/ s3://vw-amandapereira/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/amandapereira.com.br/web/wp-admin/ s3://vw-amandapereira/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/amandapereira/amandapereira.com.br/web/wp-content/ s3://vw-amandapereira/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/annaceciliaandriolo/annaceciliaandriolo.com.br/web/wp-includes/ s3://vw-annaceciliaandriolo/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/annaceciliaandriolo/annaceciliaandriolo.com.br/web/wp-admin/ s3://vw-annaceciliaandriolo/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/annaceciliaandriolo/annaceciliaandriolo.com.br/web/wp-content/ s3://vw-annaceciliaandriolo/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/brunovicentini/veganeasy.com.br/web/wp-includes/ s3://vw-veganeasy/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/brunovicentini/veganeasy.com.br/web/wp-admin/ s3://vw-veganeasy/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/brunovicentini/veganeasy.com.br/web/wp-content/ s3://vw-veganeasy/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/carlafloss/katefloss.net/web/wp-includes/ s3://vw-katefloss/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/carlafloss/katefloss.net/web/wp-admin/ s3://vw-katefloss/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/carlafloss/katefloss.net/web/wp-content/ s3://vw-katefloss/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/eduardoassef/assefmoschetta.com.br/web/wp-includes/ s3://vw-assefmoschetta/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/eduardoassef/assefmoschetta.com.br/web/wp-admin/ s3://vw-assefmoschetta/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/eduardoassef/assefmoschetta.com.br/web/wp-content/ s3://vw-assefmoschetta/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/eduardocosta/kombigode.com.br/web/wp-includes/ s3://vworks-kombigode/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/eduardocosta/kombigode.com.br/web/wp-admin/ s3://vworks-kombigode/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/eduardocosta/kombigode.com.br/web/wp-content/ s3://vworks-kombigode/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/henriquemattos/visualworks.com.br/web/wp-includes/ s3://vworks-vworks/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/henriquemattos/visualworks.com.br/web/wp-admin/ s3://vworks-vworks/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/henriquemattos/visualworks.com.br/web/wp-content/ s3://vworks-vworks/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/henriquemattos/feelmymood.com/web/wp-includes/ s3://vworks-feelmymood/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/henriquemattos/feelmymood.com/web/wp-admin/ s3://vworks-feelmymood/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/henriquemattos/feelmymood.com/web/wp-content/ s3://vworks-feelmymood/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/juliapaiva/juliapaiva.com.br/web/wp-includes/ s3://vworks-juliapaiva/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/juliapaiva/juliapaiva.com.br/web/wp-admin/ s3://vworks-juliapaiva/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/juliapaiva/juliapaiva.com.br/web/wp-content/ s3://vworks-juliapaiva/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/karinaokimasu/kondor.com.br/web/wp-includes/ s3://vworks-kondor/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/karinaokimasu/kondor.com.br/web/wp-admin/ s3://vworks-kondor/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/karinaokimasu/kondor.com.br/web/wp-content/ s3://vworks-kondor/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/marianamosca/acrossperformance.com.br/web/wp-includes/ s3://vworks-acrossperformance/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/marianamosca/acrossperformance.com.br/web/wp-admin/ s3://vworks-acrossperformance/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/marianamosca/acrossperformance.com.br/web/wp-content/ s3://vworks-acrossperformance/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/mayracarvalho/matchstyle.com.br/web/wp-includes/ s3://vw-matchstyle/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/mayracarvalho/matchstyle.com.br/web/wp-admin/ s3://vw-matchstyle/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/mayracarvalho/matchstyle.com.br/web/wp-content/ s3://vw-matchstyle/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/mayracarvalho/maystuffs.com/web/wp-includes/ s3://vw-maystuffs/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/mayracarvalho/maystuffs.com/web/wp-admin/ s3://vw-maystuffs/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/mayracarvalho/maystuffs.com/web/wp-content/ s3://vw-maystuffs/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/neidelucia/brasilamerica.com.br/web/wp-includes/ s3://vworks-brasilamerica/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/neidelucia/brasilamerica.com.br/web/wp-admin/ s3://vworks-brasilamerica/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/neidelucia/brasilamerica.com.br/web/wp-content/ s3://vworks-brasilamerica/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/pedromelo/liasalgado.com.br/web/wp-includes/ s3://vw-liasalgado/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/pedromelo/liasalgado.com.br/web/wp-admin/ s3://vw-liasalgado/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/pedromelo/liasalgado.com.br/web/wp-content/ s3://vw-liasalgado/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/robertacortat/estacaodacasa.com/web/wp-includes/ s3://vworks-estacaodacasa/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/robertacortat/estacaodacasa.com/web/wp-admin/ s3://vworks-estacaodacasa/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/robertacortat/estacaodacasa.com/web/wp-content/ s3://vworks-estacaodacasa/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/sergiomatiuzzo/focuzz.com.br/web/wp-includes/ s3://vworks-focuzz/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/sergiomatiuzzo/focuzz.com.br/web/wp-admin/ s3://vworks-focuzz/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/sergiomatiuzzo/focuzz.com.br/web/wp-content/ s3://vworks-focuzz/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/suzannamargem/garciadefreitas.com.br/web/wp-includes/ s3://vw-garciadefreitas/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/suzannamargem/garciadefreitas.com.br/web/wp-admin/ s3://vw-garciadefreitas/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/suzannamargem/garciadefreitas.com.br/web/wp-content/ s3://vw-garciadefreitas/wp-content/ $args --quiet

eval aws s3 sync /var/www/hosts/sylviobastos/sbtennis.com.br/web/wp-includes/ s3://vworks-sbtennis/wp-includes/ $args --quiet &&
eval aws s3 sync /var/www/hosts/sylviobastos/sbtennis.com.br/web/wp-admin/ s3://vworks-sbtennis/wp-admin/ $args --quiet &&
eval aws s3 sync /var/www/hosts/sylviobastos/sbtennis.com.br/web/wp-content/ s3://vworks-sbtennis/wp-content/ $args --quiet
