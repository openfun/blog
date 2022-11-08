# ==============================================================================
# VARIABLES

# -- Hugo
THEME = blowfish

# -- Docker
# Get the current user ID to use for docker run and docker exec commands
DOCKER_UID = $(shell id -u)
DOCKER_GID = $(shell id -g)
DOCKER_USER = $(DOCKER_UID):$(DOCKER_GID)
COMPOSE = DOCKER_USER=$(DOCKER_USER) docker compose
COMPOSE_RUN = $(COMPOSE) run --rm
COMPOSE_RUN_HUGO = $(COMPOSE_RUN) hugo
COMPOSE_RUN_NODE = $(COMPOSE_RUN) -e HOME="/tmp" node
COMPOSE_RUN_PRETTIER = $(COMPOSE_RUN_NODE) npx --yes prettier

# ==============================================================================
# RULES

default: help

# -- Docker
run: ## run dev server
	@$(COMPOSE) up --force-recreate -d hugo
.PHONY: run

stop: ## stop container
	@$(COMPOSE) stop
.PHONY: stop

down: ## stop and remove container
	@$(COMPOSE) down
.PHONY: down

logs: ## display hugo logs
	@$(COMPOSE) logs -f hugo
.PHONY: logs

status: ## an alias for "docker-compose ps"
	@$(COMPOSE) ps
.PHONY: status

## -- Git
git-modules-init: ## Init git modules
	 git submodule update --init --recursive
.PHONY: git-modules-init

git-modules-update: ## Update git modules
	 git submodule update --remote --recursive
.PHONY: git-modules-update

git-modules-status: ## Display git modules status (e.g: to display version)
	git submodule status
.PHONY: git-modules-status

git-clean: ## restore repository state as it was freshly cloned
	git clean -idx
.PHONY: clean

# -- Project
bootstrap: ## Bootstrap project
bootstrap: \
	gitmodules-init \
	run
.PHONY: bootstrap

build: ## Build static blog
	@$(COMPOSE_RUN_HUGO) -t $(THEME)
.PHONY: build

lint-posts: ## Run prettier over all markdown post files -- beware! overwrites files
	@$(COMPOSE_RUN_PRETTIER) --write /src/content/posts/**/*.md
.PHONY: lint-posts

lint:
	make lint-posts
.PHONY: lint

# -- Post
post: ## Create a new post
	bin/new-post
.PHONY: post

# -- Misc
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
