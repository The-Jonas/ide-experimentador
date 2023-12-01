class CoordenadasController < ApplicationController
    
    def index

        testes = Trial.all
        @coordenadas = Factor.where(name: ['X', 'Y', 'Z'])

        if testes.any?
        @ligacao = TrialFactor.all
        
        @x = params[:x]
        @y = params[:y]
        @z = params[:z]



    end
end