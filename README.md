# Project Template

A containerized application template with Docker and PostgreSQL (w/ `pgvector`) support. This template provides a standardized Python FastAPI backend template with database integration. 

Along with a list of **awesome** `.cursor/rules` `.mdc` files (check them out in `cursor_rules`)

## Features

- Docker-based development environment
- Pre-configured Cursor AI rule templates for different project types
- PostgreSQL database with pgvector extension
- Environment variable configuration
- Resource-managed containers
- Ready-to-use Makefile commands

## Project Structure

- `Dockerfile.template`: Base image configuration
- `docker_compose_app.yml`: Generic Python Application container configuration
- `docker_compose_api_db.yml`: Application for python api with database configuration
- `.env`: Environment variables
- `setup_db.sh`: Database initialization script
- `cursor_rules/`: Cursor AI rule templates for various project types:
  - Python-specific rules (global, FastAPI, data analysis, ML)
  - Frontend development rules
  - Fullstack development rules
  - Code quality rules 

## Tempalte Make Commands

- `make build`: Build the Docker image
- `make run`: Start the container
- `make clean`: Stop and remove containers
- `make start`: Clean, build, and run in one step
- `make logs`: View container logs
- `make shell`: Access container shell
- `make db-connect`: Connect to the database
- `make status`: Check container status
- `make prune`: Clean up unused Docker resources

# project-templates
