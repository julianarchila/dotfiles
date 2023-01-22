#!/bin/sh

# This script is used to install all the applications that I use on a daily basis, create links to my dotfiles and install the fonts that I use.
# It is meant to be run on a arch based system using yay as the AUR helper.
#Here is a list of the applications that will be installed:
# - alacritty
# - brave
# - discord
# - brave-browser
# - notion-app-enhanced
# - neovim
# - nvm ( this should be installed using the install script provided by the nvm github page)
    # - node latest stable version
# - zsh
    # - oh-my-zsh
    # - zsh-autosuggestions (Should be installed using oh-my-zsh plugin manager)
    # - zsh-syntax-highlighting (Should be installed using oh-my-zsh plugin manager)
    # - zsh-completions (Should be installed using oh-my-zsh plugin manager)
    # Starship prompt (Should be installed using the install script provide by the starship in their website)

# Here is a list of the fonts that will be installed:
# - nerd-fonts-jetbrains-mono
# - nerd-fonts-fira-code
# - nerd-fonts-hack
# - nerd-fonts-iosevka

# Install yay
sudo pacman -S yay

# Start installing the applications
yay -S alacritty brave discord brave-browser notion-app-enhanced neovim zsh 

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install node
nvm install node

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

# Install the fonts
yay -S nerd-fonts-jetbrains-mono nerd-fonts-fira-code nerd-fonts-hack nerd-fonts-iosevka

# The dotfiles are stored in a folder called dotfiles in my home directory
# Create a symbolic link to the dotfiles

#zshrc
 # 1). Delete the .zshrc file if it exists and .zshrc.pre-oh-my-zsh if it exists
 # 2). Create a symbolic link to the .zshrc file in the dotfiles folder
rm -f ~/.zshrc ~/.zshrc.pre-oh-my-zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc


#alacritty 
ln -s ~/dotfiles/alacritty ~/.config/alacritty

#nvim
ln -s ~/dotfiles/nvim ~/.config/nvim


#gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig



### Programming languages and other tools

#-Java openjdk 17
# - cmake
# - xclip
# - bat
# - docker, docker-compose

yay -S openjdk17-jdk cmake xclip bat docker docker-compose



## Download jetbrains toolbox app
# Download tar.gz file into the Downloads folder
# Extract the tar.gz file into its own folder, then move the folder to /opt and rename it to jetbrains-toolbox
# Create a symbolic link to the jetbrains-toolbox executable in /usr/bin
# Create a desktop entry for the jetbrains-toolbox app in /usr/share/applications 

# Download the tar.gz file
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.2.13801.tar.gz -P ~/Downloads

# Extract the tar.gz file
tar -xvf ~/Downloads/jetbrains-toolbox-1.27.2.13801.tar.gz

# Move the extracted folder to /opt
sudo mv jetbrains-toolbox-1.27.2.13801 /opt/jetbrains-toolbox

# Create a symbolic link to the jetbrains-toolbox executable in /usr/bin
sudo ln -s /opt/jetbrains-toolbox/jetbrains-toolbox /usr/bin/jetbrains-toolbox

# Create a desktop entry for the jetbrains-toolbox app in /usr/share/applications
sudo tee /usr/share/applications/jetbrains-toolbox.desktop << EOF
[Desktop Entry]
Name=JetBrains Toolbox
Comment=JetBrains Toolbox
Exec=/opt/jetbrains-toolbox/jetbrains-toolbox
Icon=/opt/jetbrains-toolbox/jetbrains-toolbox.png
Terminal=false
Type=Application
Categories=Development;
EOF


# Make zsh the default shell
chsh -s $(which zsh)