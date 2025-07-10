curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /usr/local/nvim
sudo tar -C /usr/local/ -xzf nvim-linux-x86_64.tar.gz --transform 's/nvim-linux-x86_64/nvim/'
rm nvim-linux-x86_64.tar.gz
