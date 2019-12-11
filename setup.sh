#!/usr/bin/env bash

echo 
echo "卒論環境Setup Tools for macOS"
echo "Version. 2019.12.5"
echo "Copyright © 2019 Shota Shimazu All rights reserved."
echo
echo


function install_required_pkg {
    echo "🍺  Homebrewをアップデートしています...."
    brew update
    echo "🍺  MacTexをインストールしています..."
    brew cask install mactex-no-gui
    echo "🍺  TexStudioをインストールしています..."
    brew cask install texstudio
}

function setup_mactex {
    echo "📃  パスを設定しています..."
    /usr/local/texlive/2019/bin/x86_64-darwin/tlmgr path add
    echo "📃  MacTexのパッケージをアップデートしています..."
    sudo tlmgr update --self --all
    echo "📃  MacTexはデフォルトでA4用紙サイズを使用します"
    sudo tlmgr paper a4
}


function setup_texstudio {
    echo "TexStudioを開きます. 環境設定を行ってください. [ENTERで続行]"
    read
    echo "👩🏻‍💻  TexStudioを起動します..."
    open /Applications/texstudio.app
}

function main {
    install_required_pkg
    # setup_mactex
    setup_texstudio
}


main
