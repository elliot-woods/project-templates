# Include environment variables from .env file
include .env
export

# Container Variables
CONTAINER_NAME ?= app
PORT ?= 8000
MEM ?= 1g
MEM_RESERVATION ?= 512m
DISK_SIZE ?= 10g
DISK_RESERVATION ?= 5g
SHM_SIZE ?= 1g

# Database Variables
DB_MEM ?= 1g
DB_DISK_SIZE ?= 20g
DB_MEM_RESERVATION ?= 512m
DB_DISK_RESERVATION ?= 10g
DB_SHM_SIZE ?= 1g

# Clean up everything (stop container, remove container and image, clean data)
clean:
	docker-compose down -v

# Build the Docker image (platform-aware)
build:
	docker-compose build

# Run the container 
run:
	docker-compose up -d app
	# docker-compose up -d db

# Start everything fresh (clean, build, run)
start: clean build run logs

# Prune all unused containers, images, and volumes
prune:
	docker system prune -af --volumes

# Show container logs
logs:
	docker-compose logs -f

shell:
	docker-compose exec $(CONTAINER_NAME) bash

db-connect:
	docker-compose exec $(CONTAINER_NAME)-db bash -c "PGPASSWORD=$(DB_PASSWORD) psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_NAME)"

# Show container status
status:
	docker ps -a | grep $(CONTAINER_NAME)

# # Test the API with a sample search query
# test:
# 	docker-compose exec api pytest


# Test if the service is ready
# ready:
# 	@echo "Checking if service is ready..."
# 	@curl -s "http://localhost:$(PORT)/ready" | jq

# setup:
# 	docker-compose exec -e TESTING=$(TESTING) api sh -c "/app/scripts/setup.sh" # Create embeddings and load them into a pg_vector table
# 	@echo "Setup complete. API container is running in the background."




