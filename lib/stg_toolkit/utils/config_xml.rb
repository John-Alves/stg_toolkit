# frozen_string_literal: true

require 'nokogiri'
require_relative '../base/constants'

module StgToolkit
  module Utils
    module ConfigXml
      include StgToolkit::Base::Constants

      FILEPATH = "#{FULL_CODE_PATH}/config.xml"

      def update_config_xml(name:, description:, widget_id:)
        load_config_xml

        @config_xml.at_css('widget name').content = name
        @config_xml.at_css('widget description').content = description
        @config_xml.at_css('widget')['id'] = widget_id

        save_config_xml
      end

      private

      def load_config_xml
        @config_xml = Nokogiri::XML(File.read(FILEPATH))
      end

      def save_config_xml
        file_content = @config_xml.to_xml
        File.open(FILEPATH, 'w') { |f| f << file_content }
      end
    end
  end
end