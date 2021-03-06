#!/usr/bin/env bash

# 安装Dart，( 因为官方下载国内用不了，我把安装包复制在github上 )


# 安装torch
curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
git clone https://github.com/torch/distro.git ~/torch --recursive
cd torch
sed 's/read input/input="yes"/' < install.sh | bash
./install/bin/torch-activate
cd ..

# 安装caffee加载器
luarocks install loadcaffe

# 安装Deep Fuse
git clone https://github.com/rinick/deep-fuse.git --recursive
cd deep-fuse/neural-style
sh ./models/download_models.sh

cd ..

/usr/lib/dart/bin/pub get
/usr/lib/dart/bin/pub build
