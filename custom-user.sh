# Install Clojure.
curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
chmod +x linux-install.sh
sudo ./linux-install.sh

# Install the Clojure CLI tool `deps-new`.
clojure -Ttools install-latest :lib io.github.seancorfield/deps-new :as new

# Install Prelude for Emacs.
curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh

# Perform custom configurations for Emacs.
cat custom-emacs.el >> ~/.emacs.d/init.el

# Install Starship prompt.
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Configure bash to use Starship prompt.
echo 'eval "$(starship init bash)"' >> ~/.bashrc

# Create a symlink to lolcat in a locatrion on the PATH.
ln -s /usr/games/lolcat /usr/local/bin/lolcat
