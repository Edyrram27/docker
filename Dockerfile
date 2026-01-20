# Usamos la imagen oficial de Odoo 17
FROM odoo:17.0

# Copiamos los módulos personalizados (si existen) a la carpeta de addons de Odoo
# Asegúrate de tener una carpeta llamada "addons" en la raíz del repositorio si tienes módulos personalizados
# COPY ./addons /mnt/extra-addons

# Instalamos dependencias adicionales (ejemplo: librerías para reportes PDF, etc.)
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
