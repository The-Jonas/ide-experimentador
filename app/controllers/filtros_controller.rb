class FiltrosController < ApplicationController

    def index

        #|->Coordenadas_controller

        @testes_org_coord = params[:lista_de_testes_coord]
        @lista_coordenadas_por_indice = params[:lista_de_coordenadas_por_indice]

        #|->Battery_controller

        @testes_org_battery = params[:lista_de_testes_bateria]
        @lista_bateria_por_indice = params[:lista_de_baterias_por_indice]

        #Testes

        puts "Lista de Experimentos _ coordenadas: #{@testes_org_coord}"
        puts "Lista de Coordenadas: #{@lista_coordenadas_por_indice}"
        #puts "Lista de Experimentos _ bateria: #{@testes_org_coord}"
        #puts "Lista de Bateria: #{@lista_coordenadas_por_indice}"

    end
end 

