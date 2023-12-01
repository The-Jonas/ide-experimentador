
Tag.delete_all
Trial.delete_all
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

experimento = Experiment.create(id: 1, name: 'Experimento1', disabled: false)
experimento_especifico = Experiment.find(1)

trial = Trial.create(id: 1, name: 'Teste 0', disabled: false, deleted: false, runs: 10, experiment: experimento_especifico)

coordenada = Factor.create(id: 1, name: 'X', value: '1')
coordenada = Factor.create(id: 2, name: 'Y', value: '0')
coordenada = Factor.create(id: 3, name: 'Z', value: '1')

coordenada = Factor.create(id: 4, name: 'X', value: '2')
coordenada = Factor.create(id: 5, name: 'Y', value: '1')
coordenada = Factor.create(id: 6, name: 'Z', value: '0')

bateria = Factor.create(name: 'Carga', value: '80%')

trial_factor = TrialFactor.create(factor: Factor.find(1), trial: Trial.find(1))
trial_factor = TrialFactor.create(factor: Factor.find(2), trial: Trial.find(1))
trial_factor = TrialFactor.create(factor: Factor.find(3), trial: Trial.find(1))

trial_factor = TrialFactor.create(factor: Factor.find(4), trial: Trial.find(1))

p 'Finalizando carregamento de dados'



