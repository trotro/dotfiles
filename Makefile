.PHONY: bootstrap
bootstrap: dirs all ## Fresh install: creates config dirs then deploys everything.

.PHONY: dirs
dirs: ## Creates all required config directories.
	mkdir -p $(HOME)/.config/fish/conf.d
	mkdir -p $(HOME)/.config/fish/functions
	mkdir -p $(HOME)/.config/alacritty
	mkdir -p $(HOME)/.config/mise
	mkdir -p $(HOME)/.config/zed
	mkdir -p $(HOME)/.config/zellij
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.hammerspoon

.PHONY: all
all: core hammerspoon neovim starship topgrade ## Deploys all dotfiles.

.PHONY: core
core: alacritty fish git helix mise zed zellij zsh ## Deploys core dotfiles (alacritty, fish, git, helix, mise, zed, zellij, zsh).

# .PHONY: dotfiles
# dotfiles:	## Deploys the dotfiles.
# 	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".*~" -not -name ".travis.yml"); do \
# 		f=$$(basename $$file); \
# 		ln -sfn $$file $(HOME)/$$f; \
# 	done;

.PHONY: alacritty
alacritty:	## Deploys alacrittys dotfiles.
	ln -sfn $(CURDIR)/alacritty $(HOME)/.config/alacritty;

.PHONY: bash
bash:	## Deploys bash dotfiles.
	for file in $(shell find $(CURDIR)/ -name ".bash*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

.PHONY: fish
fish:	## Deploys fish dotfiles.
	mkdir -p $(HOME)/.config/fish/conf.d/;
	ln -sfn $(CURDIR)/fish/config.fish $(HOME)/.config/fish/config.fish;
	for file in $(shell find $(CURDIR)/fish/conf.d/ -name "*.fish"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.config/fish/conf.d/$$f; \
	done;
	mkdir -p $(HOME)/.config/fish/functions/;
	for file in $(shell find $(CURDIR)/fish/functions/ -name "*.fish"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.config/fish/functions/$$f; \
	done;

.PHONY: git
git:	## Deploys git dotfiles.
	ln -sfn $(CURDIR)/.gitconfig $(HOME)/;
	ln -sfn $(CURDIR)/.gitignore $(HOME)/;

.PHONY: hammerspoon
hammerspoon:	## Deploys hammerspoons dotfiles.
	ln -sfn $(CURDIR)/hammerspoon/* $(HOME)/.hammerspoon/;

.PHONY: mise
mise:	## Deploys mise dotfiles.
	ln -sfn $(CURDIR)/mise $(HOME)/.config/mise;

.PHONY: neovim
neovim:	## Deploys n(eo)vim dotfiles.
	ln -sfn $(CURDIR)/nvim $(HOME)/.config/nvim;

.PHONY: starship
starship:	## Deploys starship dotfiles.
	ln -sfn $(CURDIR)/starship.toml $(HOME)/.config/starship.toml;

.PHONY: topgrade
topgrade:	## Deploys topgrade dotfiles.
	ln -sfn $(CURDIR)/topgrade.toml $(HOME)/.config/topgrade.toml;

.PHONY: zed
zed:	## Deploys zed dotfiles.
	ln -sfn $(CURDIR)/zed/* $(HOME)/.config/zed;

.PHONY: zellij
zellij:	## Deploys zellij dotfiles.
	ln -sfn $(CURDIR)/zellij/* $(HOME)/.config/zellij;

.PHONY: zsh
zsh:	## Deploys zsh dotfiles.
	for file in $(shell find $(CURDIR)/ -name ".zsh*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

.PHONY: test
test: shellcheck ## Runs all the tests on the files in the repository.

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts via Dagger.
	dagger -m ci call shellcheck --source=.

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
