# chadπ

> '**When you base your expectations only on what you see...**
> 
> **...you blind yourself to the possibilities of a new reality**'

(*Zaheer on the evils of GUI*)

--- 

## Reasoning

This repo exists in an attempt to have some fun doing development on a headless ubuntu server. In this case a raspberry pi, but should be usable on most ubuntu scenarios.
There are some gotchas which I needed to work out in regards to installing neovim at a suitably late version to run astrovim, and also difficulties regarding finding a lua-language server lsp which will run on the pi's aarch64 chip. 
Most of these issues can be circumvented by manually building or sourcing the required modules and setting the path to find them directly.
If you find yourself having any issues running the scripts below, please open PRs or issues with your stack-trace and we'll work it out <3

> ⚠️  Due to some heavy-lifting required for an audio-processing project. This has been migrated to a WSL2 ubuntu machine.


---

## Requirements

- raspberry pi 4 running a zesty fresh aarch64 [Ubuntu Server](https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#1-overview) flash
- [ssh setup on the pi](https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#3-using-advanced-options) 
- willingness to read documentation and overcome moments of frustration
- a dream of a dedicated dev machine with no bloat which you can access from any terminal with ssh
- chad energy

---

## Installs

### Cleaning and upgrading

```
sudo apt-get update
sudo apt-get upgrade
```

### ohmyzsh

```
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```
sudo mv .zshrc .zshrc.bak
sudo curl -O https://raw.githubusercontent.com/outInsideOut/chadPiHazing/main/.zshrc
source ~/.zshrc
```

### tmux plugins
```
sudo curl -O https://raw.githubusercontent.com/outInsideOut/chadPiHazing/main/.tmux.conf
tmux new -d -s mySession
tmux send-keys -t mySession.0 "tmux source ~/.tmux.conf" C-m 
tmux send-keys -t mySession.0 Escape
tmux run './.tmux/plugins/tpm/bin/install_plugins'
tmux send-keys -t mySession.0 Escape
tmux kill-server
cd ~/.tmux/plugins/tmux/scripts/
sudo curl -O https://raw.githubusercontent.com/outInsideOut/chadPiHazing/main/.tmux/plugins/tmux/scripts/dracula.sh
cd
tmux new -d -s mySession
tmux send-keys -t mySession.0 "tmux source ~/.tmux.conf" C-m
tmux kill-server
tmux
```

### languages

> ⚠️ choose default <1> when prompted

```
sudo apt install cmake
sudo apt install -y gcc
sudo apt-get install -y g++
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
. "$HOME/.cargo/env"
sudo apt install -y lua5.4
sudo apt-get -f install -y ninja-build
mkdir lsps
cd lsps/
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
./make.sh
cd
```

### nvim astrovim install

```
cd /bin/
sudo wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-arm64.tar.gz
sudo tar xzvf nvim-linu-arm64.tar.gz
cd
sudo apt-get install -y ripgrep
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim +:q
sudo mv .config/nvim/init.lua .config/nvim/init.lua.bak
cd .config/nvim/
curl -O https://raw.githubusercontent.com/outInsideOut/chadPiHazing/main/.config/nvim/init.lua
cd
nvim
```

### usefuls

```
sudo apt install -y unzip
sudo apt install xclip
```

---

# references
- https://github.com/tmux-plugins/tpm
- https://draculatheme.com/tmux
- https://docs.astronvim.com/
- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#set-up-rust-with-neovim
- https://ohmyz.sh/#install
- https://github.com/jesseduffield/lazygit 
- https://hackersandslackers.com/running-jupyter-notebooks-on-a-ubuntu-server/
- https://ubuntu.com/server/docs/set-up-an-ftp-server
- https://linuxconfig.org/how-to-use-xclip-on-linux
- https://github.com/bcampolo/nvim-starter-kit/tree/java#neovim-starter-kit-for-java-
