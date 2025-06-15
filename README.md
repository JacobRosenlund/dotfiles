# Dotfiles
These are my dotfiles. I use GNU Stow to manage them, and the file structure is designed to be useful for that purpose.

Each folder is a "containing folder," that separates each program's dotfiles into easier-to-manage chunks. Inside each "containing folder," there is a `.config/` folder that contains the actual dotfiles.

If you want to `stow .` into `$HOME/.config`, traverse into the desired program's "containing folder," and then type `stow .`. The symlinks should be generated in the correct places after that.

If you are trying to create a stow dotfile directory for an already existing `.config/` file, use the `--adopt` tag, and it should adopt the contents of said `.config/` file.
