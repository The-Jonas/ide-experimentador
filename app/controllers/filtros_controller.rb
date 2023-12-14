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
            lista_habilitado_por_indice = []

            @executions = Trial.all
            @executions.each do |trial|
                nome_do_teste = trial.name
                nome_do_experimento = trial.experiment.name
                esta_desabilitado = trial.disabled
  
                if !lista_de_testes_ativos.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                    lista_de_testes_ativos << [nome_do_experimento, nome_do_teste]
                end

                lista_habilitado_por_indice << [esta_desabilitado]
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
                    lista_de_tags_por_indice << [""]
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
            @pegaBateria = params[:bateria]
            @pegaTag = params[:tags]
            @pegaStatus = params[:status]
            @pegativo = params[:ativos]

            if @pegativo == "Habilitado"
                @pegativo = false
            elsif @pegativo == 'Desabilitado'
                @pegativo = true
            end
            
        end
    
        #puts "Experimento rodando #{@selected_experimento} e a lista #{@todos_os_experimentos}"
        #puts "Status: #{@pegaStatus}, Ativo: #{@pegativo}, Bateria: #{@pegaBateria}, Tag: #{@pegaTag} e Coordenadas #{@pegaOx}, #{@pegaOy}, #{@pegaOz}"

        @printar_no_final = []
        contador = 0 

        @printar_no_final << ['Teste', 'Ativo', 'Status', 'Bateria', 'Tag', 'X', 'Y', 'Z']

        lista_de_testes_ativos.each do |ativo|
    
            if ativo[0] == @selected_experimento
                @printar_no_final[contador][0] = ativo[1]
                nome_teste_atual = ativo[1]
                index_a = lista_de_testes_ativos.find_index(ativo)
                #puts "O valor do indice é: #{dabliu}"
                #puts "Lista: #{lista_de_testes_ativos}"
                

                index_s = lista_de_testes_status.find_index do |lista|
                    lista[0] == @selected_experimento && lista[1] == nome_teste_atual
                end

                index_b = lista_de_testes_bateria.find_index do |lista|
                    lista[0] == @selected_experimento && lista[1] == nome_teste_atual
                end

                index_t = lista_de_testes_tags.find_index do |lista|
                    lista[0] == @selected_experimento && lista[1] == nome_teste_atual
                end
                
                index_c = lista_de_testes_coordenadas.find_index do |lista|
                    lista[0] == @selected_experimento && lista[1] == nome_teste_atual
                end

                puts "Esse é o #{nome_teste_atual} do #{@selected_experimento}"
                puts "lista de ativos #{lista_habilitado_por_indice}"
                puts "lista de tags #{lista_de_tags_por_indice}"
                


                if @pegativo.nil? || @pegativo == "" || lista_habilitado_por_indice[index_a][0] == @pegativo
                    @printar_no_final[contador][1] = lista_habilitado_por_indice[index_a][0]

                    if @pegaStatus.to_s == ""|| lista_de_status[index_s][0] == @pegaStatus
                        @printar_no_final[contador][2] = lista_de_status[index_s][0]

                        if @pegaBateria == ""|| lista_de_baterias_por_indice[index_b][0] == @pegaBateria
                            @printar_no_final[contador][3] = lista_de_baterias_por_indice[index_b][0]
                            
                            if @pegaTag == ""|| lista_de_tags_por_indice[index_t][0] == @pegaTag
                                @printar_no_final[contador][4] = lista_de_tags_por_indice[index_t]
                                
                                if @pegaOx == ""|| lista_de_coordenadas_por_indice[index_c][0] == @pegaOx
                                    @printar_no_final[contador][5] = lista_de_coordenadas_por_indice[index_c][0]
                                    
                                    if @pegaOy == ""|| lista_de_coordenadas_por_indice[index_c][1] == @pegaOy
                                        @printar_no_final[contador][6] = lista_de_coordenadas_por_indice[index_c][1]
                                        
                                        if @pegaOz == ""|| lista_de_coordenadas_por_indice[index_c][2] == @pegaOz
                                            @printar_no_final[contador][7] = lista_de_coordenadas_por_indice[index_c][2]
                                            contador += 1
                                            @printar_no_final << ['Teste', 'Ativo', 'Status', 'Bateria', 'Tag', 'X', 'Y', 'Z']
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if @printar_no_final[contador][7] == 'Z'
            @printar_no_final.pop
        end
        @printar_no_final.each do |caixinha|
            puts "Teste: #{caixinha}"
        end
        puts "Lista_de_testes: #{@printar_no_final}"
    end
end
