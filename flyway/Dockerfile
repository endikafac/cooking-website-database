# FROM flyway/flyway:6.5.1

# COPY ./conf/ /flyway/conf/
# COPY ./drivers/ /flyway/drivers/
# # COPY ./globalConfigurationLocal /flyway/sql/
# COPY ./sql/01-core/ /flyway/sql/
# COPY ./sql/02-structure-updates/ /flyway/sql/
# COPY ./sql/03-master-data-updates/ /flyway/sql/

# ENTRYPOINT ["/flyway/flyway"]
# CMD ["migrate"]


# Derived from official mysql image (our base image)
FROM mysql
# Add a database
ENV MYSQL_DATABASE company
# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./sql/01-core/ /docker-entrypoint-initdb.d/
COPY ./sql/02-structure-updates/ /docker-entrypoint-initdb.d/
COPY ./sql/03-master-data-updates/ /docker-entrypoint-initdb.d/