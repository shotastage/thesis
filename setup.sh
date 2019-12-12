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
}

function setup_mactex {
    echo "📃  パスを設定しています..."
    /usr/local/texlive/2019/bin/x86_64-darwin/tlmgr path add
    echo "📃  MacTexのパッケージをアップデートしています..."
    # sudo tlmgr update --self --all
    echo "📃  MacTexはデフォルトでA4用紙サイズを使用します"
    # sudo tlmgr paper a4
}

function vscode {
    if [ -e /Applications/Visual\ Studio\ Code.app ]; then
        echo "🖥  Visual Studio Codeはすでにインストールされています."
        return
    fi
    echo "⬇️  Visual Studio Codeをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL https://az764295.vo.msecnd.net/stable/f359dd69833dd8800b54d458f6d37ab7c78df520/VSCode-darwin-stable.zip
    if [ -e ./VSCode-darwin-stable.zip ]; then
        echo "📦  パッケージを展開しています..."
        unzip VSCode-darwin-stable.zip >> /dev/null
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi
       
    echo "⬇️  アプリケーションをインストールしています..."
    mv Visual\ Studio\ Code.app/ /Applications/
    echo "🧹  クリーンアップしています..."
    rm VSCode-darwin-stable.zip
}

function tex_workshop {
    echo "⬇️  TexWorkshopをインストールしています..."
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension james-yu.latex-workshop
}

function main {
    install_required_pkg
    setup_mactex
    vscode
    tex_workshop
}


main
