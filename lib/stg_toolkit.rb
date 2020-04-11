# frozen_string_literal: true

require 'stg_toolkit/version'
require 'stg_toolkit/cli'

module StgToolkit
  class Error < StandardError; end

  def self.init
    CLI.new
  end
end
