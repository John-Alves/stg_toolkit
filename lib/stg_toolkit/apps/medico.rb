# frozen_string_literal: true

require_relative '../base/general_app'

module StgToolkit
  class Medico < Base::GeneralApp
    SOURCE_URL = 'https://github.com/John-Alves/StgMedico'
    CONTROLLER_NAME = 'appAPI'

    def set_widget_id!
      id = name.downcase.gsub(/[^a-z]/, '')
      @widget_id = "medico.#{id}.sistemas.stg.com"
    end
  end
end