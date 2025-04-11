.PHONY: all
all: fish git helix mise zed zellij zsh

# .PHONY: dotfiles
# dotfiles:	## Deploys the dotfiles.
# 	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".*~" -not -name ".travis.yml"); do \
# 		f=$$(basename $$file); \
# 		ln -sfn $$file $(HOME)/$$f; \
# 	done;

.PHONY: bash
bash:	## Deploys bash dotfiles.
	for file in $(shell find $(CURDIR)/ -name ".bash*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

.PHONY: fish
fish:	## Deploys fish dotfiles.
	ln -sfn $(CURDIR)/fish/config.fish $(HOME)/.config/fish/config.fish;
	for file in $(shell find $(CURDIR)/fish/conf.d/ -name "*.fish"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.config/fish/conf.d/$$f; \
	done;
	for file in $(shell find $(CURDIR)/fish/functions/ -name "*.fish"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.config/fish/functions/$$f; \
	done;

.PHONY: git
git:	## Deploys git dotfiles.
	ln -sfn $(CURDIR)/.git* $(HOME)/;

.PHONY: helix
helix:	## Deploys helix dotfiles.
	ln -sfn $(CURDIR)/helix/* $(HOME)/.config/helix;

.PHONY: mise
mise:	## Deploys mise dotfiles.
	ln -sfn $(CURDIR)/mise/* $(HOME)/.config/mise;

.PHONY: neovim
neovim:	## Deploys n(eo)vim dotfiles.
	ln -sfn $(CURDIR)/nvim/* $(HOME)/.config/nvim;

.PHONY: zed
zed:	## Deploys zed dotfiles.
	ln -sfn $(CURDIR)/zed/* $(HOME)/.config/zed;

.PHONY: zellij
zellij:	## Deploys zellij dotfiles.
	ln -sfn $(CURDIR)/zellij $(HOME)/.config/zellij;

.PHONY: zsh
zsh:	## Deploys zsh dotfiles.
	for file in $(shell find $(CURDIR)/ -name ".zsh*"); do \
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
