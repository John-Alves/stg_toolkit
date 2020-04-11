# frozen_string_literal: true

require_relative '../base/general_app'

module StgToolkit
  class Paciente < Base::GeneralApp
    SOURCE_URL = 'https://github.com/John-Alves/StgPaciente'
    CONTROLLER_NAME = 'appPacienteAPI'

    def set_widget_id!
      id = name.downcase.gsub(/[^a-z]/, '')
      @widget_id = "paciente.#{id}.sistemas.stg.com"
    end
  end
end