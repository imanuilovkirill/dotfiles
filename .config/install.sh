sudo pacman -Syu
sudo pacman -S --needed alacritty bat base-devel curl fzf git neovim niri npm python ripgrep waybar wget zsh
# dotfiles
git clone --bare git@github.com:imanuilovkirill/dotfiles.git $HOME/.dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
config checkout
# Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc
# packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
