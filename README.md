# dotfiles
## summury
personal dotfiles.

it will backup old dotfiles and creat symlinks to `~`,check and install tools like `zsh&zplug`、`tmux`...etc 

if you dont need them, edit `.install.sh`
## how to use 
1. `git clone git@github.com:8bits-cat/dotfiles.git `

2. `cd ~/dotfiles`

3. `chmod +x .install.sh`

4. `./.install.sh`
***
# Manual operate (select to install)
## terminal emulator
- use [alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) terminal emulator
- use [powerlevel10k](https://github.com/romkatv/powerlevel10k#getting-started) to highly customizable zsh,(i already set it in zplug ) so just need manual execute step-1,3,4
## tools
### wireshark
- `apt install wireshark`
### htop
- [see details](https://github.com/htop-dev/htop),and install it
### python profiler
Ensure pip has been installed.
- **line_profiler**:`pip install line_profiler`
- **memory_profiler**:`pip install -U memory_profiler`
