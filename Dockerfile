FROM odoo:17.0

EXPOSE 8069

CMD ["odoo",
     "--db_host=${PGHOST}",
     "--db_port=${PGPORT}",
     "--db_user=${PGUSER}",
     "--db_password=${PGPASSWORD}",
     "--db_sslmode=disable"]
