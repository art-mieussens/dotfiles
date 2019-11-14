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

Multiple platforms or configurations can be handled by a single repository by using branches for specific programs and branches for specific configurations.

### Add a branch for a program configuration
```
dotfile checkout -b ssh
...
dotfile add .ssh
...
dotfile push origin ssh
```

### Add another branch for a system configuration
```
dotfile checkout -b manjaro-i3
dotfile push origin manjaro-i3
```
### Add a config file from another branch to a system configuration branch
```
dotfile checkout manjaro-i3
dotfile ckeckout ssh -- .ssh 
dotfile commit -m "Copy .ssh file from the ssh branch"

#Edit your file as desired

dotfile commit -m "modify .ssh with specifics for manjaro-i3"

```
