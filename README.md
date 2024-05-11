# chadπ

> '**When you base your expectations only on what you see...**
> 
> **...you blind yourself to the possibilities of a new reality**'

(*Zaheer on the evils of GUI*)

--- 

## Requirements

- raspberry pi 4 running a zesty fresh aarch64 [Ubuntu Server](https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#1-overview) flash
- [ssh setup on the pi](https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#3-using-advanced-options) 
- willingness to read documentation and overcome moments of frustration
- a dream of a dedicated dev machine with no bloat which you can access from any terminal with ssh
- chad energy

---

## Installs

### ohmyzsh
```
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
sudo mv .zshrc .zshrc.bak
sudo curl -O https://github.com/outInsideOut/chadPiHazing/blob/main/.zshrc -o ~/.zshrc
source ~/.zshrc
```

### tmux plugins
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo curl -O https://raw.githubusercontent.com/outInsideOut/chadPiHazing/main/.tmux.conf -o ~/.tmux.conf
source ~/.tmux.conf
tmux send-keys C-a S-i
sudo curl -O https://raw.githubusercontent.com/outInsideOut/chadPiHazing/main/.tmux/plugins/tmux/scripts/dracula.sh -o ~/.tmux/plugins/tmux/scripts/dracula.sh
source ~/.tmux.conf
```

### languages
```
sudo apt install -y gcc
sudo apt-get install -y g++
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
. "$HOME/.cargo/env"
sudo apt install -y lua
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
sudo apt install -y neovim
sudo apt-get install -y ripgrep
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim +:q
nvim +':MasonInstall rust-analyzer'
```

---

# references
- https://github.com/tmux-plugins/tpm
- https://draculatheme.com/tmux
- https://docs.astronvim.com/
- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#set-up-rust-with-neovim
- https://ohmyz.sh/#install
- https://github.com/jesseduffield/lazygit 
