#!/bin/bash

# Control script for OJT Attendance Docker stack

# Set colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

function show_help() {
    echo -e "${BLUE}OJT Attendance Docker CLI${NC}"
    echo "Usage: ./manage.sh [command]"
    echo ""
    echo "Commands:"
    echo -e "  ${GREEN}dev-up${NC}      Start development environment"
    echo -e "  ${GREEN}dev-down${NC}    Stop development environment"
    echo -e "  ${GREEN}dev-build${NC}   Build/rebuild development images"
    echo -e "  ${GREEN}prod-up${NC}     Start production environment"
    echo -e "  ${GREEN}prod-down${NC}   Stop production environment"
    echo -e "  ${GREEN}prod-build${NC}  Build production images"
    echo -e "  ${GREEN}clean${NC}       Remove all unused docker resources"
    echo ""
}

case "$1" in
    dev-up)
        echo -e "${BLUE}Starting development environment...${NC}"
        docker compose -f docker/docker-compose.dev.yml up
        ;;
    dev-down)
        echo -e "${BLUE}Stopping development environment...${NC}"
        docker compose -f docker/docker-compose.dev.yml down
        ;;
    dev-build)
        echo -e "${BLUE}Building development images...${NC}"
        docker compose -f docker/docker-compose.dev.yml build
        ;;
    prod-up)
        echo -e "${BLUE}Starting production environment...${NC}"
        docker compose -f docker/docker-compose.prod.yml up -d
        echo -e "${GREEN}Production environment started in background!${NC}"
        echo "- API: http://localhost:8000"
        echo "- Client: http://localhost"
        ;;
    prod-down)
        echo -e "${BLUE}Stopping production environment...${NC}"
        docker compose -f docker/docker-compose.prod.yml down
        ;;
    prod-build)
        echo -e "${BLUE}Building production images...${NC}"
        docker compose -f docker/docker-compose.prod.yml build
        ;;
    clean)
        echo -e "${YELLOW}Warning: This will remove all stopped containers and unused networks/volumes!${NC}"
        read -p "Are you sure? (y/N) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            docker system prune -a --volumes -f
            echo -e "${GREEN}Docker system cleaned.${NC}"
        fi
        ;;
    *)
        show_help
        ;;
esac
