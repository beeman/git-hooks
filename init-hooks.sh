#!/bin/bash

# This is the dir the hooks wil go into
HOOKS_TARGET_DIR="./.git/hooks"
HOOKS_SOURCE_DIR="./hooks"

# Check if we can find the source dir
if [ ! -d "$HOOKS_SOURCE_DIR" ]; then
	echo "Can't find source hooks dir: $HOOKS_SOURCE_DIR"
else 
	echo "Using source hooks dir: $HOOKS_SOURCE_DIR"
fi

# Check if we can find the target dir
if [ ! -d "$HOOKS_TARGET_DIR" ]; then
	echo "Can't find target hooks dir: $HOOKS_TARGET_DIR"
else 
	echo "Using target hooks dir: $HOOKS_TARGET_DIR"
fi

# Get a list of the available hooks
HOOKS_AVAIL=`ls $HOOKS_SOURCE_DIR`

# Try to install each hook
for HOOK in $HOOKS_AVAIL; do
	NEW_HOOK_TARGET="$HOOKS_TARGET_DIR/$HOOK"
	NEW_HOOK_SOURCE="$HOOKS_SOURCE_DIR/$HOOK"
	if [ -f "$NEW_HOOK_TARGET" ]; then
		echo "The hook $NEW_HOOK_TARGET already exists"
	else 
		echo "Installing hook $NEW_HOOK_TARGET"
		cp "$NEW_HOOK_SOURCE" "$NEW_HOOK_TARGET"
		chmod +x "$NEW_HOOK_TARGET"
	fi
done