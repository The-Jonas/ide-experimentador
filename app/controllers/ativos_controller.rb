class AtivosController < ApplicationController

  def index
    testes = Trial.all
    @executions = Trial.all

    # Obtém o parâmetro da URL 'disabled' para determinar se mostrar todos, desabilitados ou habilitados
    disabled_filter = params[:disabled]

    if testes.any?
      lista_de_testes_incluidos = []
      esta_desabilitado_list = []

      @executions.each do |trial|
        nome_do_teste = trial.name
        nome_do_experimento = trial.experiment.name
        esta_desabilitado = trial.disabled

          if !lista_de_testes_incluidos.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
            lista_de_testes_incluidos << [nome_do_experimento, nome_do_teste]
          end

          esta_desabilitado_list << [esta_desabilitado]
      
      end

      puts "Lista de Experimentos e Testes: #{lista_de_testes_incluidos}"
      puts "Lista de habilitados e desabilitados: #{esta_desabilitado_list}"
    else
      puts "Não há testes registrados."
    end
  end
end
