#!/bin/bash

gem build stg_toolkit.gemspec
gem install stg_toolkit-0.1.0.gem
ruby debug/debug.rb