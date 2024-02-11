# Clone The Repo
- `cd ~/`
- `git clone git@github.com:bdarfler/dotfiles.git`
- `mv dotfiles .dotfiles`
- `cd .dotfiles`
- `git submodule init`
- `git submodule update`

# Install Everything
- `brew bundle install`
- Install `vim-plug`
- Install `antigen`
- `topgrade`

# Install ASDF
- `asdf plugin add golang`
- `asdf plugin add nodejs`
- `asdf plugin add ruby`
- `asdf plugin add python`
- `asdfup`

# Link Up Dotfiles
- `cd ../`
- `ln -s .dotfiles/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh .base16_theme`
- `ln -s .dotfiles/.gitconfig .gitconfig`
- `ln -s .dotfiles/.gitignore_global .gitignore_global`
- `ln -s .dotfiles/.tigrc .tigrc`
- `ln -s .dotfiles/.vimrc .vimrc`
- `ln -s .dotfiles/.zshenv .zshenv`
- `ln -s .dotfiles/.zshrc .zshrc`
- `cd .config`
- `ln -s ~/.dotfiles/.config/base16-shell base16-shell`
- `ln -s ~/.dotfiles/.config/karabiner karabiner`
- `ln -s ~/.dotfiles/.config/starship.toml starship.toml`

# Set Up Git
- [Setup 1P, GPG & SSH](https://developer.1password.com/docs/ssh)
