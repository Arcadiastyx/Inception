FROM    debian:buster

RUN     apt-get update
RUN     apt-get install -y nginx openssl

# dossier pour  stocker la clés de certificat pour la connexion sécuriséé = hpps
RUN     mkdir /etc/nginx/ssl


# request/type of certificat/overpass password request->stock->key:prompt info subject
RUN openssl req x509 -nodes\
    -out /etc/nginx/ssl/nginx-certificate.crt \
    -keyout /etc/nginx/ssl/nginx-certificate.key \
    -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=inaranjo.42.ch/UID=inaranjo"

# dossiier pour stocker les fichiers de config de NGINX 
RUN mkdir -p /var/run/nginx

# root principal
RUN chmod 755 /var/www/html

# utilisateur principal
RUN chown -R www-data:www-data /var/www/html

# 
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Abre a porta 443
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]