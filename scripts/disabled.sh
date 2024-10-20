#!/bin/bash

# スクリプトが置かれているディレクトリを取得
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# 固定された相対パスのディレクトリを絶対パスに変換
WORKFLOWS_DIR=$(realpath "$SCRIPT_DIR/../.github/workflows")
DISABLED_WORKFLOWS_DIR=$(realpath "$SCRIPT_DIR/../.github/disabled-workflows")

# 移動先のディレクトリが存在しない場合は作成
if [ ! -d "$DISABLED_WORKFLOWS_DIR" ]; then
    mkdir -p "$DISABLED_WORKFLOWS_DIR"
    echo "Directory '$DISABLED_WORKFLOWS_DIR' created."
fi

# .github/workflows 以下の .yml と .yaml ファイルを .github/disabled-workflows に移動
for FILE in "$WORKFLOWS_DIR"/*.yml "$WORKFLOWS_DIR"/*.yaml; do
    # ファイルが存在するか確認（存在しない場合はスキップ）
    if [ -e "$FILE" ]; then
        mv "$FILE" "$DISABLED_WORKFLOWS_DIR"
        echo "Moved '$FILE' to '$DISABLED_WORKFLOWS_DIR'"
    fi
done

echo "All YAML files moved from '$WORKFLOWS_DIR' to '$DISABLED_WORKFLOWS_DIR'."
