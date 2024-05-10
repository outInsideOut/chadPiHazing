# CHAD

> '**When you base your expectations only on what you see...**
> 
> **...you blind yourself to the possibilities of a new reality**'
> (*Zaheer on the evils of GUI*)

--- 

## Requirements

- raspberry pi 4 running a zesty fresh aarch64 Ubuntu Server flash
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
cd /usr/bin/
sudo git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
sudo ./make.sh
cd
```

> [!NOTE]
> add lua_ls to the nvim config in a bit ^^

### nvim astrovim install
```
sudo apt install -y neovim
sudo apt-get install -y ripgrep
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim +:q
```

### nvim setup
```

```

---

# references
- https://github.com/tmux-plugins/tpm
- https://draculatheme.com/tmux
- https://docs.astronvim.com/
- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#set-up-rust-with-neovim
- https://ohmyz.sh/#install
- https://github.com/jesseduffield/lazygit 
