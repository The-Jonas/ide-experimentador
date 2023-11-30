# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or newd alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_new_by!(name: genre_name)
#   end

Tag.delete_all
Factor.delete_all
Experiment.delete_all
TrialFactor.delete_all

p 'Iniciando carregamento de dados'

tag = Tag.create(id: 1, name: 'Louco', color: 'Roxo')
tag = Tag.create(id: 2, name: 'Rápido', color: 'Amarelo')
tag = Tag.create(id: 3, name: 'Upgrade', color: 'Verde')
tag = Tag.create(id: 4, name: 'Quebrado', color: 'Vermelho')
tag = Tag.create(id: 5, name: 'Resistente', color: 'Azul')
tag = Tag.create(id: 6, name: 'Confuso', color: 'Cinza')

=begin
experimento = Experiment.new(id: 1, name: 'Experimento1', disabled: false)

trial = Trial.new(name: 'Teste 0', disabled: false, deleted: false, runs: 10, experiment: Experiment(1))

coordenada = Factor.new(id: 1, name: 'X', value: '1')
coordenada = Factor.new(id: 2, name: 'Y', value: '0')
coordenada = Factor.new(id: 3, name: 'Z', value: '1')

coordenada = Factor.new(id: 4, name: 'X', value: '2')
coordenada = Factor.new(id: 5, name: 'Y', value: '1')
coordenada = Factor.new(id: 6, name: 'Z', value: '0')

bateria = Factor.new(name: 'Bateria', value: '80%')

trial_factor = TrialFactor.new(factor: Factor.find(1), trial: experimento_especifico)
trial_factor = TrialFactor.new(factor: Factor.find(2), trial: experimento_especifico)
trial_factor = TrialFactor.new(factor: Factor.find(3), trial: experimento_especifico)

trial_factor = TrialFactor.new(factor: Factor.find(4), trial: experimento_especifico)


p 'Finalizando carregamento de dados'
=end