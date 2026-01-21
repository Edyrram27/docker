FROM odoo:17.0

COPY odoo.conf /etc/odoo/odoo.conf

# Copia los módulos personalizados si existen
# COPY ./addons /mnt/extra-addons

USER root
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    && pip3 install --upgrade pip \
    && pip3 install wheel setuptools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
USER odoo

EXPOSE 8069

CMD ["odoo"]
