FROM debian:bullseye-slim
 
# Mettre à jour les informations du référentiel et installer les dépendances
 
# Installer les dépendances requises pour la compilation de psycopg2
 RUN apt-get update && \
 	apt-get install -y --no-install-recommends \
     	ca-certificates \
     	curl \
     	dirmngr \
     	libpq-dev \
     	postgresql-server-dev-all \
     	fonts-noto-cjk \
     	gnupg \
     	build-essential \
     	libldap2-dev \
     	libsasl2-dev \
     	libssl-dev \
     	node-less \
     	npm \
     	postgresql-client \
     	python3-dev \
     	python3-pip \
     	python3-setuptools \
     	python3-wheel \
     	python3-venv \
     	xz-utils \
     	zlib1g-dev && \
 	rm -rf /var/lib/apt/lists/*
 
# Installer les dépendances Python pour Odoo et nettoyer le cache
 RUN python3 -m venv /opt/odoo/venv && \
 	/opt/odoo/venv/bin/pip install --no-cache-dir -r https://raw.githubusercontent.com/odoo/odoo/15.0/requirements.txt
 
# Installer wget et gnupg
 RUN apt-get update && \
 	apt-get install -y --no-install-recommends wget gnupg && \
 	rm -rf /var/lib/apt/lists/*
 
# Ajouter les clés GPG et le dépôt Odoo
 RUN wget -O - https://nightly.odoo.com/odoo.key | gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg && \
 	echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/15.0/nightly/deb/ ./' | tee /etc/apt/sources.list.d/odoo.list
 
# Installer Odoo
 RUN apt-get update && \
 	apt-get install -y odoo && \
 	rm -rf /var/lib/apt/lists/*
 
# Créer un utilisateur dédié pour exécuter Odoo
 RUN id -u odoo &>/dev/null || useradd -m -d /opt/odoo -U -r -s /bin/bash odoo
 
# Installer les dépendances Python pour Odoo et nettoyer le cache
 RUN python3 -m venv /opt/odoo/venv && \
 	/opt/odoo/venv/bin/pip install --no-cache-dir -r https://raw.githubusercontent.com/odoo/odoo/15.0/requirements.txt
 
# Changer l'utilisateur et le répertoire de travail
 USER odoo
 WORKDIR /opt/odoo
 
# Exposer le port d'Odoo
 EXPOSE 8069
 
# Exécuter Odoo
 CMD [ "/usr/bin/odoo", "--config", "/etc/odoo/odoo.conf" ]
