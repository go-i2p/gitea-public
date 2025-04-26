#! /usr/bin/env sh

if [ -z "$GITEA_CUSTOM" ]; then
  echo "GITEA_CUSTOM is not set. Please set it to the path where you want to install Gitea custom files."
  exit 1
fi
if [ ! -d "$GITEA_CUSTOM" ]; then
  echo "GITEA_CUSTOM is not a directory. Please set it to a valid directory."
  exit 1
fi
if [ ! -d "$GITEA_CUSTOM/public" ]; then
    echo "Creating $GITEA_CUSTOM/public directory."
    mkdir -p $GITEA_CUSTOM/public
fi

if [ -d "$GITEA_CUSTOM/public/.well-known" ]; then
    cp -rv .well-known/* $GITEA_CUSTOM/public/.well-known/
else
    cp -rv .well-known $GITEA_CUSTOM/public/.well-known
fi

if [ -d "$GITEA_CUSTOM/public/assets" ]; then
    cp -rv assets/* $GITEA_CUSTOM/public/assets
else
    cp -rv assets $GITEA_CUSTOM/public/assets
fi

if [ -d "$GITEA_CUSTOM/public/templates" ]; then
    cp -rv templates/* $GITEA_CUSTOM/public/templates
else
    cp -rv templates $GITEA_CUSTOM/public/templates
fi