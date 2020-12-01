#!/bin/bash
set -e # Exit immediately if a command returns non-zero

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

cat < /myapp/.docker-prompt >> ~/.bashrc

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"