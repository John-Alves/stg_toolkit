# frozen_string_literal: true

module StgToolkit
  module Base
    module Constants
      TEMP_BASE_PATH = '/tmp'
      NAME = 'code_base'

      FULL_CODE_PATH = "#{TEMP_BASE_PATH}/#{NAME}"
      ICON_PATH = "#{FULL_CODE_PATH}/resources/icon.png"
      LOGO_PATH = "#{FULL_CODE_PATH}/src/assets/images/clinica-logo.png"
      GLOBAL_JSON_PATH = "#{FULL_CODE_PATH}/src/app/config/global.json"
    end
  end
end