#!/usr/bin/env sh

# Set up Jekyll site. Run this script immediately after cloning the codebase.
# https://github.com/thoughtbot/guides/tree/master/protocol

# Exit if any subcommand fails
#set -ErrorAction

# Set up Ruby dependencies via Bundler.
iex "gem install bundler --conservative"
iex "bundle install"
iex "bundle update"

# Set up JS dependencies via Bower.
iex "npm install -g bower"
iex "bower install"
