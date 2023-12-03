class StatusController < ApplicationController

  def index

      testes = Trial.all                 #"testes" é uma lista que recebe todos os testes

      if testes.any?

        @executions = TrialExecution.all
        lista_de_testes_incluidos = []
        lista_de_status = []
        @statuses = ["aprovado", "reprovado", "em_execucao", "parcialmente_aprovado"]

        @executions.each do |trial_execution|

          nome_do_teste = trial_execution.trial.name
          nome_do_experimento = trial_execution.trial.experiment.name
          qualstatus = trial_execution.status


          if !lista_de_testes_incluidos.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
              lista_de_testes_incluidos << [nome_do_experimento, nome_do_teste]
          end

          if !lista_de_status.include?(qualstatus)
            lista_de_status << [qualstatus]
          end

        puts "Lista de Experimentos E Testes: #{lista_de_testes_incluidos}"
        puts "Lista de Status: #{lista_de_status}"

      end

      else
        puts "Não há testes registrados."
      end
  end
end
