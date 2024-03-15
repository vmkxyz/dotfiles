#!/bin/sh
echo "file to add:"
read ADD
echo ""
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add $ADD
echo ""
echo "commit message:"
read MSG
echo ""
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m "$MSG"
echo ""
echo "push? (Y/n)"
read PUSH
if [ "$PUSH" = "" ]
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push
fi
