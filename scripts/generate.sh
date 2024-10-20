#!/bin/bash

# スクリプトが置かれているディレクトリを取得
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# 固定された相対パスのディレクトリ (スクリプトディレクトリから見た相対パス)
TARGET_DIR="$SCRIPT_DIR/../.github/workflows"

# 使用方法を表示する関数
usage() {
    echo "Usage: $0 <filename>"
    exit 1
}

# 引数が1つなければ使用方法を表示
if [ "$#" -ne 1 ]; then
    usage
fi

FILENAME=$1

# ディレクトリが存在しない場合は作成
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo "Directory '$TARGET_DIR' created."
fi

# ファイル名に拡張子がない場合、.ymlを追加
if [[ "$FILENAME" != *.yml && "$FILENAME" != *.yaml ]]; then
    FILENAME="${FILENAME}.yml"
fi

# 空のYAMLファイルを作成
touch "$TARGET_DIR/$FILENAME"

echo "Empty YAML file '$TARGET_DIR/$FILENAME' created."
