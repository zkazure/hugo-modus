.PHONY: dev watch build

# Resolve a tailwindcss command: prefer one on PATH, then a local
# node_modules install, otherwise fall back to npx.
TAILWIND := $(shell \
	if command -v tailwindcss >/dev/null 2>&1; then echo tailwindcss; \
	elif [ -x node_modules/.bin/tailwindcss ]; then echo node_modules/.bin/tailwindcss; \
	else echo "npx --yes @tailwindcss/cli@4"; fi)

dev:
	hugo server \
		--contentDir exampleSite/content \
		--config exampleSite/hugo.toml \
		--buildDrafts \
		--disableFastRender \
		--navigateToChanged \
		--printI18nWarnings

watch:
	$(TAILWIND) -i assets/css/main.css -o assets/css/dist/main.css --optimize --watch

build:
	$(TAILWIND) -i assets/css/main.css -o assets/css/dist/main.css --optimize
