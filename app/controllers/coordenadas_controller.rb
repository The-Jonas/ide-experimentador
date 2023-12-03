class CoordenadasController < ApplicationController

    def index

        testes = Trial.all                 #"testes" é uma lista que recebe todos os testes

        if testes.any?                     #Só roda se tiver algum teste registrado (dentro da lista)

            @ligacoes = TrialFactor.all

            lista_de_testes_incluidos = []
            lista_de_coordenadas_por_indice = []

            @ligacoes.each do |ligacao|

                nome_do_fator = ligacao.factor.name
                valor_do_fator = ligacao.factor.value       #Pega todos os valores necessários para separação
                nome_do_teste = ligacao.trial.name
                nome_do_experimento = ligacao.trial.experiment.name

                if ['X', 'Y', 'Z'].include?(nome_do_fator)                      #Verifica se o Trial_Factor se trata de uma coordenada

                    if !lista_de_testes_incluidos.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                        lista_de_testes_incluidos << [nome_do_experimento, nome_do_teste]
                        lista_de_coordenadas_por_indice << ['X', 'Y', 'Z']
                    end

                index = lista_de_testes_incluidos.find_index{ |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }

                puts "Esse é o Index: #{index}"
                puts "Esse é o Fator: #{nome_do_fator} : #{valor_do_fator}"

                if nome_do_fator == 'X'
                    lista_de_coordenadas_por_indice[index][0] = valor_do_fator
                elsif nome_do_fator == 'Y'
                    lista_de_coordenadas_por_indice[index][1] = valor_do_fator
                elsif nome_do_fator == 'Z'
                    lista_de_coordenadas_por_indice[index][2] = valor_do_fator
                end

                puts "Lista de Experimentos E Testes: #{lista_de_testes_incluidos}"
                puts "Lista de Coordenadas Por Indíce: #{lista_de_coordenadas_por_indice}"

                end
            end
        else
            puts "Não há testes registrados."
        end
        redirect_to filtros_index_path(lista_de_testes_coord: lista_de_testes_incluidos, lista_de_coordenadas_por_indice: lista_de_coordenadas_por_indice)
    end
end



#[['Experimento 1','Teste 0'], ['Experimento 1','Teste 1']['Experimento 2','Teste 1']]
#[['Louco', 'Rápido'],['Quebrado'],[]]
#[['X = 1', 'Y = 2', 'Z = 3'], ['X = 2', 'Y = 1', 'Z = 0'], ['X = 2', 'Y = 1', 'Z = 0']]
#[['80%'], ['32%'], ['21%']]
#[['Aprovado'], ['Em_execução'], '] ['Habil['Aprovado']]
#[['Habilitado'], ['Desabilitadoitado']]
