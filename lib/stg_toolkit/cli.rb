# frozen_string_literal: true

require 'tty-prompt'
require_relative 'app_installer'

module StgToolkit
  class CLI
    def initialize; end

    def create_app
      StgToolkit::AppInstaller.new
    end
  end
end