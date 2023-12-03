class TagsController < ApplicationController
    def index

        @testes = Trial.all 

        tag = params[:t]

        if @testes.any?

            @classificacoes = Classification.all
            lista_de_testes_para_executar = []
            lista_de_tags_por_indice = []
            @lista_de_nomes_das_tags = []

            @classificacoes.each do |classification|

                nome_do_experimento = classification.trial.experiment.name
                nome_do_teste = classification.trial.name
                nome_da_tag = classification.tag.name
                cor = classification.tag.color

                if !lista_de_testes_para_executar.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                    lista_de_testes_para_executar << [nome_do_experimento, nome_do_teste] 
                    lista_de_tags_por_indice << []
                end

                if !@lista_de_nomes_das_tags.include?(nome_da_tag)
                    @lista_de_nomes_das_tags << nome_da_tag
                end

                index = index = lista_de_testes_para_executar.find_index{ |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                lista_de_tags_por_indice[index] << nome_da_tag
            end

            @testes.each do |teste|

                nome_do_experimento = teste.experiment.name
                nome_do_teste = teste.name

                if !lista_de_testes_para_executar.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                    lista_de_testes_para_executar << [nome_do_experimento, nome_do_teste] 
                    lista_de_tags_por_indice << []
                end
            end
            
        else
            puts "Não há testes para serem filtrados"    
        end
        puts "Experimentos e Testes: #{lista_de_testes_para_executar}"
        puts "Lista de Tags Referente aos testes: #{lista_de_tags_por_indice}"
        puts "Lista de Todas as Tags: #{@lista_de_nomes_das_tags}"
    end
end
