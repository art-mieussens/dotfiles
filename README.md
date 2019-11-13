# _.dotfiles_ management
## Setup a bare git repository at $HOME/.dotfiles with a branch for each specific configuration.
If you use different environments or platforms, a branch for each would keep all the  

### Create the bare repository
```
git init --bare $HOME/.dotfiles
```

### Set an Alias on your shell
Use the _dotfiles_ command to call git overriding the work and git directories.
```
alias dotfiles='/usr/bin/git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME'
```
Now you can use the alias to manage your repository
```
dotfile status
```

### Add (this) README.md file to the repository
Put it under the .github directory to avoid polluting the home directory.
```
mkdir .github
# Make the .github/README.md file
dotfiles add .github/README.md
dorfiles commit -m "Add .github/README.md"
```

### Add the .dotfiles directory to .gitignore to prevent issues*
```
echo ".dotfiles" >> .gitignore
dotfiles add .gitignore
dotfiles commit -m "Add .gitignore"
```

### Add a remote
```
dotfiles remote add origin https://www.github.com/username/repo.git
dotfiles push origin master
```

### Add a branch for each config
```
dotfile checkout -b manjaro-i3
...
dotfile push origin manjaro-i3
```

### Now you can add your config files
```
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
...
dotfiles push
```

## Installing dotfiles to a new system
1. Add the dotfile alias to your shell 
2. Add .dotfiles directory to .gitignore*
3. Clone the repo
```
git clone --bare https://www.github.com/username/repo.git $HOME/.dotfiles
```
4. Checkout the repo
```
dotfiles checkout
```
5. Prevent untracked files from being shown on dotfile status
```
dotfiles config --local status.showUntrackedFiles no
```
------
\* Check for validity
