#!/usr/bin/env bash
# exit on error
set -o errexit

# Sinatra - use puma directly to avoid rackup handler issues
bundle exec puma -C config/puma.rb
