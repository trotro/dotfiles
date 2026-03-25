# AGENTS.md — Dotfiles Repository

## What This Repository Is

Personal macOS dotfiles for **nicolas T.** (`trotro`). Configuration files are deployed via **symlinks** using `make`, not copied. The primary shell is **fish**, with zsh and bash configs also present.

---

## Deployment Commands

```bash
make help          # list all available targets with descriptions
make all           # deploy: alacritty, fish, git, helix, mise, zed, zellij, zsh
make alacritty     # symlink alacritty/ → ~/.config/alacritty
make fish          # symlink fish configs → ~/.config/fish/
make git           # symlink .git* → ~/
make hammerspoon   # symlink hammerspoon/* → ~/.hammerspoon/
make mise          # symlink mise/* → ~/.config/mise
make neovim        # symlink nvim/ → ~/.config/nvim
make starship      # symlink starship.toml → ~/.config/starship.toml
make topgrade      # symlink topgrade.toml → ~/.config/topgrade.toml
make zed           # symlink zed/* → ~/.config/zed
make zellij        # symlink zellij/ → ~/.config/zellij
make zsh           # symlink .zsh* → ~/
```

### Testing / Linting

```bash
make test          # runs shellcheck via Dagger
make shellcheck    # alias for make test
dagger -m ci call shellcheck --source=.  # commande directe
```

Shellcheck s'exécute dans un container `koalaman/shellcheck-alpine:stable` orchestré par **Dagger** (`ci/` — module Python). Dagger est installé via mise (`dagger = "latest"`). La CI GitLab utilise le même module via `.gitlab-ci.yml`.

---

## Repository Structure

```
.
├── alacritty/          # Terminal emulator config (alacritty.toml)
├── fish/
│   ├── config.fish     # Main fish config (brew, mise, tirith, starship init)
│   ├── conf.d/         # Auto-sourced fish snippets
│   │   ├── aliases.fish   # vi=nvim, ls=lsd, docker=podman, hf=uvx hf
│   │   ├── docker.fish    # podman-based adoc/adoc2pdf helpers
│   │   ├── env.fish       # PATH additions (~/.local/bin, ~/.cargo/bin)
│   │   ├── golang.fish    # Go env (commented out, managed by mise)
│   │   └── kubectl.fish   # kubectl/kubecolor/k aliases + krew PATH
│   └── functions/
│       └── fish_greeting.fish  # Runs macchina on shell start
├── hammerspoon/
│   └── init.lua        # F1=ghostty, F2=bitwarden, F3=anytype toggles
├── helix/
│   └── config.toml     # Helix editor config (pop-dark theme)
├── mise/
│   └── config.toml     # Tool versions (all "latest") + global venv config
├── nvim/
│   └── init.vim        # Neovim config (no plugins active)
├── skills/
│   └── ikv/
│       ├── SKILL.md    # AI skill: generate PDF for bike commute allowance
│       └── scripts/
│           └── generate.py
├── starship.toml       # Prompt config (Catppuccin Mocha palette)
├── tmux/
│   ├── tmux.conf       # tmux config + session bindings (1-6 keys)
│   ├── default, habit, 3-panes, 4-panes, 6-panes  # tmux session layouts
├── topgrade.toml       # System updater config (disables: system, emacs, uv, rustup, gem, git_repos, node, containers)
├── zed/
│   └── settings.json   # Zed editor config
├── zellij/
│   ├── config.kdl      # Zellij keybinds (vim-style, clear-defaults=true)
│   └── config/layouts/
│       └── 3_panes.kdl # 3-pane zellij layout
├── .gitconfig          # Git config
├── .bashrc             # Bash config (Linux-oriented)
├── .zshrc              # Zsh config (brew + mise + starship init)
├── Makefile            # Deployment targets
└── test.sh             # Shellcheck runner
```

---

## Tool Stack

All runtime tools are managed by **mise** (`mise/config.toml`), all pinned to `"latest"`.

Key tools installed via mise:
- **Editors**: `neovim`, `zed` (via mise); helix config present
- **Shell**: fish (primary), zsh, bash
- **Container**: `podman` (aliased as `docker`)
- **Kubernetes**: `kubectl`, `kubecolor`, `kubectx`, `k9s`, `helm`, `talosctl`
- **Cloud**: `gcloud`, `awscli`
- **Git tools**: `lazygit`, `gitui`, `delta`, `difftastic`, `github-cli`, `glab`
- **File tools**: `bat`, `lsd` (aliased as `ls`), `fd`, `fzf`, `rg` (ripgrep), `dust`, `duf`
- **Languages**: `python`, `node` (via bun), `rust`, `java`, `bun`
- **Python**: managed via `uv`; global venv at `~/.venv` (auto-created by mise)
- **AI/LLM**: `claude-code`, `gemini`, `opencode`, `llmfit`, `llmserve`
- **Other**: `age`, `sops`, `slsa-verifier`, `dagger`, `xh`, `usage`

---

## Key Conventions

### Symlinks, not copies
All configs are symlinked. Editing files in this repo directly edits the live config. `make <target>` (re)creates symlinks using `ln -sfn`.

### Fish shell patterns
- New aliases go in `fish/conf.d/aliases.fish` as `function <name> --wraps <original>` functions, not bare `alias` statements.
- New env vars go in `fish/conf.d/env.fish`.
- Tool-specific config gets its own `fish/conf.d/<tool>.fish` file.

### Shell scripts must pass shellcheck
Any `.sh` or bash/shell script added to the repo will be checked by `test.sh` via `make test`. Write POSIX-compatible or explicitly bash-compatible scripts.

### `docker` = `podman`
The `docker` function in `aliases.fish` wraps `podman`. All container commands use podman. The shellcheck CI container also uses podman (`podman run ...`).

### Python
- Global venv: `~/.venv` (auto-created by mise with `uv`)
- Neovim Python host: `~/.venv-nvim/bin/python3`
- Python formatting: `ruff` (configured in zed for format-on-save)
- npm packages: managed via `bun` (set in mise settings)

### Git config
- Default branch: `main`
- Pull strategy: `rebase`
- Auto-squash and auto-stash on rebase
- rerere enabled with auto-update
- Conflict style: `zdiff3`
- Editor: `vi` (points to nvim via alias)
- Push: `autoSetupRemote = true`

### Themes
- Terminal/prompt: **Catppuccin Mocha**
- Zed (dark): **Kanagawa Wave** / (light): **Kanagawa Lotus**
- Zed icons: **Catppuccin Latte**
- Helix: **pop-dark**
- Font everywhere: **Hack Nerd Font** 13pt

---

## Skills

`skills/ikv/` contains an AI skill for generating a **bike commute allowance PDF** (`mobilite-durable-AAAAMM.pdf`). See `skills/ikv/SKILL.md` for the full spec. Invoke with:

```bash
pip install reportlab --break-system-packages -q
python skills/ikv/scripts/generate.py <YEAR> <MONTH> "<FULL NAME>" "<EMPLOYEE_ID>" /tmp/mobilite-durable-AAAAMM.pdf
```

---

## Gotchas

- **`make all` does NOT include `hammerspoon`, `neovim`, `bash`, `starship`, `topgrade`** — those targets exist but must be run explicitly.
- **Fish config sources `tirith init`** — this tool must be installed for fish to start without errors.
- **Fish greeting runs `macchina`** — must be installed (available via cargo/brew).
- **Neovim python host** is hardcoded to `~/.venv-nvim/bin/python3` in `nvim/init.vim`; that venv must exist separately from the mise-managed `~/.venv`.
- **golang.fish is fully commented out** — Go PATH/GOPATH are expected to be managed by mise.
- **topgrade disables many updaters** — `system`, `emacs`, `uv`, `rustup`, `gem`, `git_repos`, `node`, `containers` are disabled to avoid unintended updates.
- **Zellij keybinds use `clear-defaults=true`** — the entire keymap is custom; default zellij bindings do not apply.
- **tmux session layouts** are loaded with `bind <number> source-file .tmux/<name>` — these expect to be run from `$HOME` where `.tmux/` symlink would need to exist (not currently in the Makefile).
