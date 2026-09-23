#!/usr/bin/env bash
# Installs tmux.conf as ~/.tmux.conf.
#
# tmux loads ~/.tmux.conf first and ~/.config/tmux/tmux.conf (Omarchy's default)
# afterwards, so Omarchy's settings would override ours. To make ours win, we
# source ~/.tmux.conf again at the end of the Omarchy config. Re-run this script
# after `omarchy refresh config tmux/tmux.conf`, which resets that file.

set -euo pipefail
cd "$(dirname "$0")"

cp tmux.conf ~/.tmux.conf

omarchy_conf=~/.config/tmux/tmux.conf
line='source-file -q ~/.tmux.conf'
marker='# Personal overrides (loaded last so they win over the defaults above)'

if [[ -f $omarchy_conf ]] && ! grep -qxF "$line" "$omarchy_conf"; then
  printf '\n%s\n%s\n' "$marker" "$line" >>"$omarchy_conf"
  echo "Added personal override include to $omarchy_conf"
fi
