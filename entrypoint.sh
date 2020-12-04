#!/bin/bash
set -e # Exit immediately if a command returns non-zero

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

if ! tail -n 1 ~/.bashrc | grep -q PS1 ; then
  cat < /myapp/.docker-prompt >> ~/.bashrc
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
