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

        g = Git.clone(@url, NAME, path: TEMP_BASE_PATH)
        g.config('user.name', 'John-Alves')
        g.config('user.email', 'johnnydealves99@gmail.com')

        puts 'Download concluído!'
      end

      def change_icon new_icon
        icon_path = "#{FULL_CODE_PATH}/resources/icon.png"
        logo_path = "#{FULL_CODE_PATH}/src/assets/images/clinica-logo.png"

        system "rm -f #{icon_path} #{logo_path}"
        system "cp -r #{new_icon} #{icon_path}"
        system "cp -r #{new_icon} #{logo_path}"

        go_to_directory_and_run 'ionic cordova resources'
      end

      def change_global_json(api_link:)
        json_filepath = "#{FULL_CODE_PATH}/src/app/config/global.json"
        file = File.read(json_filepath)
        data_hash = JSON.parse(file)

        data_hash['api_link'] = api_link
        File.open(json_filepath, 'w') { |f| f << data_hash.to_json }
      end

      def generate_debug_apk
        commands = [
          'npm install',
          'ionic cordova platform add android',
          'ionic cordova build android'
        ]
        go_to_directory_and_run commands
      end

      def copy_debug_build_to(path, filename)
        path = path[0...-1] if path[-1] == '/'
        filename << '.apk' if filename[-4..-1] != '.apk'
        destination_path = "#{path}/#{filename.gsub(' ', '_')}"
        debug_apk_path = "#{FULL_CODE_PATH}/platforms/android/app/build/outputs/apk/debug/app-debug.apk"
        system "cp #{debug_apk_path} #{destination_path}"
      end

      private

      def go_to_directory_and_run commands
        cmd = commands
        cmd = commands.join(';') if commands.class == Array
        system "cd #{FULL_CODE_PATH};#{cmd}"
      end
    end
  end
end