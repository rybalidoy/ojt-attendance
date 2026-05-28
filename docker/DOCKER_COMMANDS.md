# Docker Commands Reference Guide

This guide explains how to use the Docker environment setup for both development and production in this project.

We have provided a control script called `manage.sh` at the root of the project to simplify running these commands.

---

## 🛠️ Unified Control Script (`./manage.sh`)

Instead of writing long Docker commands, you can use our helper script inside your terminal (WSL or Linux environment). Make sure it has execution permissions (`chmod +x manage.sh`).

### 1. Development Commands
Use these commands when working on the application locally.

* **Start the environment:**
  ```bash
  ./manage.sh dev-up
  ```
  *Starts the Laravel API and Expo Web Client containers with live code syncing/hot-reloading.*

* **Stop the environment:**
  ```bash
  ./manage.sh dev-down
  ```

* **Force rebuild development images:**
  ```bash
  ./manage.sh dev-build
  ```

---

### 2. Production Commands
Use these commands on your VPS/Server to run the highly optimized production build.

* **Build production images:**
  ```bash
  ./manage.sh prod-build
  ```

* **Start production environment (background/detached mode):**
  ```bash
  ./manage.sh prod-up
  ```
  *Compiles frontend assets, runs Composer optimizations, and launches Nginx/PHP-FPM inside secure, isolated containers.*

* **Stop production environment:**
  ```bash
  ./manage.sh prod-down
  ```

---

### 3. Cleanup Command
* **Prune unused Docker assets:**
  ```bash
  ./manage.sh clean
  ```
  *Removes all stopped containers, unused networks, and dangling build caches to free up disk space.*

---

## 💻 Manual Docker CLI Commands

If you prefer using the native `docker compose` commands directly, here are the equivalent commands:

### Development Mode
* **Start:**
  ```bash
  docker compose -f docker/docker-compose.dev.yml up --build
  ```
  *Note: Because we have set up `include` in the root `docker-compose.yml`, you can also simply run `docker compose up --build` from the root directory.*

* **Stop:**
  ```bash
  docker compose -f docker/docker-compose.dev.yml down
  ```

### Production Mode
* **Build:**
  ```bash
  docker compose -f docker/docker-compose.prod.yml build
  ```

* **Start (Detached):**
  ```bash
  docker compose -f docker/docker-compose.prod.yml up -d
  ```

* **Stop:**
  ```bash
  docker compose -f docker/docker-compose.prod.yml down
  ```
