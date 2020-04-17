.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles:	## Installs the dotfiles.
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".*~" -not -name ".travis.yml" -not -path ".config"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

.PHONY: bash
bash:	## Installs bash dotfiles.
	for file in $(shell find $(CURDIR) -name ".bash*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

.PHONY: fish
fish:	## Installs fish .config files.
	for file in $(shell find $(CURDIR)/.config/fish/conf.d -name "*.fish"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.config/fish/conf.d/$$f; \
	done;

.PHONY: neovim
neovim:	## Installs n(eo)vim .config files.
	for file in $(shell find $(CURDIR)/.config/nvim -name "*.vim"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.config/nvim/$$f; \
	done;

.PHONY: zsh
zsh:	## Installs zsh dotfiles.
	for file in $(shell find $(CURDIR) -name ".zsh*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

.PHONY: test
test: shellcheck ## Runs all the tests on the files in the repository.
# if this session isn't interactive, then we don't want to allocate a
# TTY, which would fail, but if it is interactive, we do want to attach
# so that the user can send e.g. ^C through.
INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKER_FLAGS += -t
endif

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./test.sh

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
