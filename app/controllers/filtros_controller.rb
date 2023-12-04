class FiltrosController < ApplicationController

    def index
        testes = Trial.all

        ########## COMEÇO // BATERIA ##########

        if testes.any?

            @ligacoes = TrialFactor.all

            lista_de_testes_bateria = []
            lista_de_baterias_por_indice = []

            @ligacoes.each do |ligacao|

                nome_do_experimento = ligacao.trial.experiment.name
                nome_do_teste = ligacao.trial.name
                nome_do_fator = ligacao.factor.name
                valor_bateria = ligacao.factor.value
                
                if ['carga', 'Carga'].include?(nome_do_fator)

                    if !lista_de_testes_bateria.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                        lista_de_testes_bateria << [nome_do_experimento, nome_do_teste]
                        lista_de_baterias_por_indice << [valor_bateria]
                    end
                end
            end

        ########### FIM // BATERIA ###########

        ########## COMEÇO // STATUS ##########

            @executions = TrialExecution.all
            lista_de_testes_status = []
            lista_de_status = []
            @statuses = ["aprovado", "reprovado", "em_execucao", "parcialmente_aprovado"]
    
            @executions.each do |trial_execution|
    
                nome_do_teste = trial_execution.trial.name
                nome_do_experimento = trial_execution.trial.experiment.name
                qualstatus = trial_execution.status
    
    
                if !lista_de_testes_status.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                    lista_de_testes_status << [nome_do_experimento, nome_do_teste]
                end
    
                if !lista_de_status.include?(qualstatus)
                    lista_de_status << [qualstatus]
                end
            end

            ########### FIM // STATUS ###########

            ########## COMEÇO // ATIVOS ##########

            lista_de_testes_ativos = []
            esta_desabilitado_list = []

            @executions = Trial.all
            @executions.each do |trial|
                nome_do_teste = trial.name
                nome_do_experimento = trial.experiment.name
                esta_desabilitado = trial.disabled
  
                if !lista_de_testes_ativos.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                    lista_de_testes_ativos << [nome_do_experimento, nome_do_teste]
                end

                esta_desabilitado_list << [esta_desabilitado]
            end

            ########## COMEÇO // TAGS ##########

            @classificacoes = Classification.all
            lista_de_testes_tags = []
            lista_de_tags_por_indice = []
            @lista_de_nomes_das_tags = []

            @classificacoes.each do |classification|

                nome_do_experimento = classification.trial.experiment.name
                nome_do_teste = classification.trial.name
                nome_da_tag = classification.tag.name
                cor = classification.tag.color

                if !lista_de_testes_tags.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                    lista_de_testes_tags << [nome_do_experimento, nome_do_teste] 
                    lista_de_tags_por_indice << []
                end

                if !@lista_de_nomes_das_tags.include?(nome_da_tag)
                    @lista_de_nomes_das_tags << nome_da_tag
                end

                index = index = lista_de_testes_tags.find_index{ |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                lista_de_tags_por_indice[index] << nome_da_tag
            end

            testes.each do |teste|

                nome_do_experimento = teste.experiment.name
                nome_do_teste = teste.name

                if !lista_de_testes_tags.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                    lista_de_testes_tags << [nome_do_experimento, nome_do_teste] 
                    lista_de_tags_por_indice << []
                end
            end

            ########### FIM // TAGS ###########
            
            ####### COMEÇO // COORDENADAS #######

            @ligacoes = TrialFactor.all

            lista_de_testes_coordenadas = []
            lista_de_coordenadas_por_indice = []

            @ligacoes.each do |ligacao|

                nome_do_fator = ligacao.factor.name
                valor_do_fator = ligacao.factor.value       #Pega todos os valores necessários para separação
                nome_do_teste = ligacao.trial.name
                nome_do_experimento = ligacao.trial.experiment.name

                if ['X', 'Y', 'Z'].include?(nome_do_fator)                      #Verifica se o Trial_Factor se trata de uma coordenada

                    if !lista_de_testes_coordenadas.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                        lista_de_testes_coordenadas << [nome_do_experimento, nome_do_teste]
                        lista_de_coordenadas_por_indice << ['X', 'Y', 'Z']
                    end
                end

                index = lista_de_testes_coordenadas.find_index{ |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }

                if nome_do_fator == 'X'
                    lista_de_coordenadas_por_indice[index][0] = valor_do_fator
                elsif nome_do_fator == 'Y'
                    lista_de_coordenadas_por_indice[index][1] = valor_do_fator
                elsif nome_do_fator == 'Z'
                    lista_de_coordenadas_por_indice[index][2] = valor_do_fator
                end
            end

            ########### FIM // COORDENADAS ###########
        else
            puts "Não há testes registrados"
        end

    #---------------------------------------------------------------------------------------------------#
    #                                     Manipulação de Dados
        
        @todos_os_experimentos = Experiment.distinct.pluck(:name)

        if params[:experimento].present?
            @selected_experimento = params[:experimento]        #Seleção do Experimento
            @pegaOx = params[:coordenadas_x]
            @pegaOy = params[:coordenadas_y]
            @pegaOz = params[:coordenadas_z]

            @pegaStatus = params[:status]
            @pegativo = params[:ativos]

            @pegaBateria = params[:bateria]
            @pegaTag = params[:tags]
        end
    
        puts "Experimento rodando #{@selected_experimento} e a lista #{@todos_os_experimentos}"
        puts "Status: #{@pegaStatus}, Ativo: #{@pegativo}, Bateria: #{@pegaBateria}, Tag: #{@pegaTag} e Coordenadas #{@pegaOx}, #{@pegaOy}, #{@pegaOz}"







    end    
end 

