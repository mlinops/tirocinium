init: dc-down dc-pull dc-build dc-up
up: dc-up
down: dc-down
restart: down up

dc-up:
	docker compose up -d

dc-rebuild-up:
	docker compose up -d --build --force-recreate
 
dc-down:
	docker compose down --remove-orphans

dc-down-clear:
	docker compose down -v --remove-orphans

dc-pull:
	docker compose pull

dc-build:
	docker compose build --pull

build: build-gateway build-frontend build-api

build-gateway:
	docker --log-level=debug build --pull ./application/gateway/docker/production/nginx --tag=${REGISTRY}/application-gateway:${IMAGE_TAG}

build-frontend:
	docker --log-level=debug build --pull ./application/frontend/docker/production/nginx --tag=${REGISTRY}/application-frontend:${IMAGE_TAG}

build-api:
	docker --log-level=debug build --pull ./application/api/docker/production/nginx --tag=${REGISTRY}/application-api:${IMAGE_TAG}
	docker --log-level=debug build --pull ./application/api/docker/production/php --tag=${REGISTRY}/application-api-php:${IMAGE_TAG}

try-build:
	REGISTRY=localhost IMAGE_TAG=0 make build

push: push-gateway push-frontend push-api

push-gateway:
	docker push ${REGISTRY}/application-gateway:${IMAGE_TAG}

push-frontend:
        docker push ${REGISTRY}/application-frontend:${IMAGE_TAG}

push-api:
        docker push ${REGISTRY}/application-api:${IMAGE_TAG}
	docker push ${REGISTRY}/application-api-php:${IMAGE_TAG}

ds:
	docker system prune -a
