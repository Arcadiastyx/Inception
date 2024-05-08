FROM    debian:buster

# installation de nginx et openssl
RUN     apt-get update && apt-get install -y \
        nginx \
        openssl

# dossier pour stocker la clés de certificat pour la connexion sécuriséé = hpps
# oke vérifié via :docker exec c1(nom du contenaire) ls /etc/nginx/ssl
RUN     mkdir -p /etc/nginx/ssl

# request/type of certificat/overpass password request->stock->key:prompt info subject
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/nginx-certificate.crt \
    -keyout /etc/nginx/ssl/nginx-certificate.key \
    -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=login.42lausanne.ch/UID=inaranjo"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]