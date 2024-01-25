# Clone The Repo
- `cd ~/`
- `git clone` repo
- `mv dotfiles .dotfiles`
- `cd .dotfiles`
- `git submodule init`
- `git submodule update`

# Install Everything
- `brew bundles install`
- Install `vim-plug`
- Install `antigen`
- `topgrade`

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
- [Setup GPG](https://docs.github.com/en/authentication/managing-commit-signature-verification)
- [Setup pinetry](https://dev.to/zemse/setup-gpg-on-macos-2iib)
- [Setup SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Change dotfiles to ssh](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#changing-a-remote-repositorys-url)