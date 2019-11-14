## _.dotfiles_ management
Setup a bare git repository at $HOME/.dotfiles.git

### Create the bare repository
```
git init --bare $HOME/.dotfiles.git
```

### Set an Alias on your shell
Use the _dotfiles_ alias to call git overriding the work and git directories.
```
alias dotfiles='/usr/bin/git --git-dir=/$HOME/.dotfiles.git/ --work-tree=$HOME'
```
Now you can use the ```dotfile``` command to manage your repository
```
dotfile status
```

### Add (this) README.md file to the repository
Put it under the .github directory to have it shown in github but avoid polluting the home directory.
```
mkdir .github
# Make the .github/README.md file
dotfiles add .github/README.md
dotfiles commit -m "Add .github/README.md"
```

### Add the .dotfiles directory to .gitignore to prevent the git directory from tracking itself!!!
```
echo ".dotfiles.git" >> .gitignore
dotfiles add .gitignore
dotfiles commit -m "Add .gitignore"
```

### Add a remote
```
dotfiles remote add origin https://www.github.com/username/repo.git
dotfiles push origin master
```

### Now you can add your config files
```
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles push
```

## Installing dotfiles to a new system
1. Add the dotfile alias to your shell 
2. Add .dotfiles directory to .gitignore
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

## Branching structure

### Add a branch for each config
```
dotfile checkout -b manjaro-i3
...
dotfile push origin manjaro-i3
```

------
\* Check for validity
