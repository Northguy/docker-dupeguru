#!/usr/bin/with-contenv sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

mkdir -p "$XDG_CONFIG_HOME/Hardcoded Software" \
         "$XDG_DATA_HOME/Hardcoded Software/dupeGuru"

# Upgrade previous installations.
[ ! -f /config/debug.log ] || mv -v /config/debug.log "$XDG_DATA_HOME/Hardcoded Software/dupeGuru/"
[ ! -d /config/share ] || mv -v /config/share/* "$XDG_DATA_HOME/Hardcoded Software/dupeGuru/"
[ ! -d /config/share ] || rm -r /config/share
[ ! -f /config/dupeGuru.conf ] || mv -v /config/dupeGuru.conf "$XDG_CONFIG_HOME/Hardcoded Software/"

# Install default config if needed.
[ -f "$XDG_CONFIG_HOME/Hardcoded Software/dupeGuru.conf" ] || cp -v /defaults/dupeGuru.conf "$XDG_CONFIG_HOME/Hardcoded Software/"

# Adjust ownership.
chown -R $USER_ID:$GROUP_ID /config

# vim: set ft=sh :
