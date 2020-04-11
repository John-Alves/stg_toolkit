# frozen_string_literal: true

require_relative 'repository'

module StgToolkit
  module Base
    class GeneralApp
      SOURCE_URL = ''
      CONTROLLER_NAME = ''

      attr_accessor :name, :description, :icon
      attr_reader :widget_id, :api_link, :color

      def initialize
        repo_url = self.class::SOURCE_URL
        @repository ||= Repository.new(repo_url)
      end

      def api_link=(url)
        @api_link = "#{sanitize_api_link(url)}/#{self.class::CONTROLLER_NAME}"
      end

      def generate
        @repository.update_config_xml(name: name, description: description, widget_id: widget_id)
        @repository.change_icon(icon)
        @repository.change_global_json(api_link: api_link)
      end

      private

      def sanitize_api_link url
        last_char_index = url.length - 1
        return url[0...last_char_index] if url[last_char_index] == '/'

        url
      end
    end
  end
end