# frozen_string_literal: true

require 'git'
require 'json'
require_relative '../utils/config_xml'
require_relative './constants'

module StgToolkit
  module Base
    class Repository
      include Constants
      include Utils::ConfigXml

      def initialize(url)
        @url = url

        puts 'Baixando repositorio do GitHub...'
        system "rm -rf #{FULL_CODE_PATH}"

        # g = Git.clone(@url, NAME, path: TEMP_BASE_PATH)
        # g.config('user.name', 'John-Alves')
        # g.config('user.email', 'johnnydealves99@gmail.com')

        puts 'Download concluído!'
      end

      def change_icon new_icon
        icon_path = "#{FULL_CODE_PATH}/resources/icon.png"
        logo_path = "#{FULL_CODE_PATH}/src/assets/images/clinica-logo.png"

        system "rm -f #{icon_path} #{logo_path}"
        system "cp -r #{new_icon} #{icon_path}"
        system "cp -r #{new_icon} #{logo_path}"
      end

      def change_global_json(api_link:)
        json_filepath = "#{FULL_CODE_PATH}/src/app/config/global.json"
        file = File.read(json_filepath)
        data_hash = JSON.parse(file)

        data_hash['api_link'] = api_link
        File.open(json_filepath, 'w') { |f| f << data_hash.to_json }
      end
    end
  end
end