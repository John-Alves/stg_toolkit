# frozen_string_literal: true

require 'tty-prompt'
require 'tty-logger'
require_relative 'apps/medico'
require_relative 'apps/paciente'

module StgToolkit
  class AppInstaller
    def initialize
      @prompt = TTY::Prompt.new
      @logger = TTY::Logger.new

      selected_app = choose_app
      @app = Paciente.new if selected_app == 'Paciente'
      @app = Medico.new if selected_app == 'Medico'

      get_app_detail

      # puts @app.inspect
      @app.generate
      @logger.success 'Aplicativo gerado com sucesso!'
    end

    private

    def get_app_detail
      @app.name = @prompt.ask("Informe o nome do app: \n", default: 'Stg App')
      @app.description = @prompt.ask("Breve descrição do app: \n", default: 'O aplicativo da sua clinica!')
      @app.api_link = @prompt.ask("Link do Endreço Externo: \n", default: 'https://stgfidelidade.ddns.net/clinicasAPP')
      @app.icon = request_icon
      @app.set_widget_id!
    end

    def choose_app
      @prompt.select('Você deseja gerar qual tipo de aplicativo?', %w(Paciente Medico))
    end

    def request_icon
      icon = ''
      invalid_icon = true

      while invalid_icon
        answer = @prompt.ask("Insira o caminho absoluto para o icone (PNG, tamanho 1024x1024): \n")
        if File.exist? answer.to_s
          icon = answer
          invalid_icon = false
        else
          @logger.warn 'Caminho inválido!'
        end
      end
      puts ' '
      icon
    end
  end
end