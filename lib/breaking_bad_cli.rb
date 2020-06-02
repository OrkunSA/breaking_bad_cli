# application environment

require 'bundler/setup'
Bundler.require(:default)


require_relative './breaking_bad_cli/cli.rb'
require_relative './breaking_bad_cli/api.rb'
require_relative './breaking_bad_cli/character.rb'

