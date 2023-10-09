SCRIPTS = .config
SECRETS = .env

all:
	echo

${SECRETS}:
	./${SCRIPTS}/setSecrets.sh

start: ${SECRETS} grafana postgres_start
	./${SCRIPTS}/startAll.sh

stop: grafana_stop postgres_stop

full_install: ${SECRETS} grafana_create postgres_create pgadmin_create

# Grafana
grafana:
	docker start grafana
	open http://localhost:3000

grafana_create:
	docker run -d --name=grafana -p 3000:3000 grafana/grafana

grafana_stop:
	docker stop grafana

# PostgreSQL
postgres_create: ${SECRETS}
	./${SCRIPTS}/createDB.sh

postgres_start: ${SECRETS}
	./${SCRIPTS}/startAll.sh

postgres_stop: ${SECRETS}
	docker stop postgres

# pgAdmin
pgadmin_create: ${SECRETS}
	./${SCRIPTS}/createWebController.sh
