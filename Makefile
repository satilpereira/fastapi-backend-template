# ---- Config ----
APP_NAME=fastapi-backend
PORT=8000
IMAGE=$(APP_NAME):latest
CONTAINER=$(APP_NAME)-container

# ---- Local dev (no Docker) ----
dev:
	uv run uvicorn src.main:app --reload --host 0.0.0.0 --port $(PORT)

install:
	uv sync

# ---- Docker ----
build:
	docker build -f docker/Dockerfile -t $(IMAGE) .

run:
	docker run -d -p $(PORT):8000 --name $(CONTAINER) $(IMAGE)

stop:
	docker stop $(CONTAINER) || true
	docker rm $(CONTAINER) || true

restart: stop run

logs:
	docker logs -f $(CONTAINER)

# ---- Docker Compose ----
up:
	docker compose -f docker/docker-compose.yaml up --build

down:
	docker compose -f docker/docker-compose.yaml down

# ---- Cleanup ----
clean:
	docker system prune -f

# ---- Debug ----
shell:
	docker compose -f docker/docker-compose.yaml exec api /bin/sh
db-shell:
	docker compose -f docker/docker-compose.yaml exec database psql -U postgres_user -d postgres_db

db-logs:
	docker compose -f docker/docker-compose.yaml logs -f database
stats:
	docker compose -f docker/docker-compose.yaml stats $(docker compose -f docker/docker-compose.yaml ps -q)
