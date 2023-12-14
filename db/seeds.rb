#Deleta tudo para não corromper os IDs

Tag.delete_all
Trial.delete_all
Factor.delete_all
Experiment.delete_all
TrialFactor.delete_all
Classification.delete_all
TrialExecution.delete_all

p 'Iniciando carregamento de dados'

#Experimentos do Sistema

experimento = Experiment.create(id: 1, name: 'Experimento 9', disabled: false)
experimento = Experiment.create(id: 2, name: 'Experimento 5', disabled: false)
experimento = Experiment.create(id: 3, name: 'Experimento 2', disabled: false)
experimento = Experiment.create(id: 4, name: 'Experimento 1', disabled: true)

#Testes do sistema

trial = Trial.create(id: 1, name: 'Teste 1', disabled: false, deleted: false, runs: 10, experiment: Experiment.find(1))
trial = Trial.create(id: 2, name: 'Teste 2', disabled: false, deleted: false, runs: 49, experiment: Experiment.find(3))
trial = Trial.create(id: 3, name: 'Teste 1', disabled: false, deleted: false, runs: 82, experiment: Experiment.find(2))
trial = Trial.create(id: 4, name: 'Teste 4', disabled: false, deleted: false, runs: 49, experiment: Experiment.find(1))
trial = Trial.create(id: 5, name: 'Teste 5', disabled: false, deleted: false, runs: 49, experiment: Experiment.find(3))
trial = Trial.create(id: 6, name: 'Teste 9', disabled: false, deleted: false, runs: 98, experiment: Experiment.find(2))

#Coordenadas no sistema 

coordenada = Factor.create(id: 1, name: 'X', value: '1')        
coordenada = Factor.create(id: 2, name: 'Y', value: '0')    
coordenada = Factor.create(id: 3, name: 'Z', value: '1')        

coordenada = Factor.create(id: 4, name: 'X', value: '14')
coordenada = Factor.create(id: 5, name: 'Y', value: '10')
coordenada = Factor.create(id: 6, name: 'Z', value: '24')

#Tags do sistema

tag = Tag.create(id: 1, name: 'Louco', color: 'Roxo')
tag = Tag.create(id: 2, name: 'Rápido', color: 'Amarelo')
tag = Tag.create(id: 3, name: 'Upgrade', color: 'Verde')
tag = Tag.create(id: 4, name: 'Quebrado', color: 'Vermelho')
tag = Tag.create(id: 5, name: 'Resistente', color: 'Azul')
tag = Tag.create(id: 6, name: 'Confuso', color: 'Cinza')

#Baterias no sistema

bateria = Factor.create(id: 7, name: 'Carga', value: '80%')
bateria = Factor.create(id: 8, name: 'carga', value: '42%')
bateria = Factor.create(id: 9, name: 'carga', value: '31%')

#Ligar Tags aos testes

classificacao = Classification.create(id: 1, trial: Trial.find(1), tag: Tag.find(1))
classificacao = Classification.create(id: 2, trial: Trial.find(2), tag: Tag.find(2))
classificacao = Classification.create(id: 3, trial: Trial.find(2), tag: Tag.find(3))
classificacao = Classification.create(id: 4, trial: Trial.find(2), tag: Tag.find(4))
classificacao = Classification.create(id: 5, trial: Trial.find(2), tag: Tag.find(1))

#Ligar Coordenadas aos testes

trial_factor = TrialFactor.create(factor: Factor.find(1), trial: Trial.find(1))
trial_factor = TrialFactor.create(factor: Factor.find(2), trial: Trial.find(1)) #Experimento 1, Teste 1
trial_factor = TrialFactor.create(factor: Factor.find(3), trial: Trial.find(1))

trial_factor = TrialFactor.create(factor: Factor.find(4), trial: Trial.find(2))
trial_factor = TrialFactor.create(factor: Factor.find(5), trial: Trial.find(2)) #Experimento 1, Teste 2
trial_factor = TrialFactor.create(factor: Factor.find(6), trial: Trial.find(2))

trial_factor = TrialFactor.create(factor: Factor.find(1), trial: Trial.find(3))
trial_factor = TrialFactor.create(factor: Factor.find(5), trial: Trial.find(3)) #Experimento 2, Teste 1
trial_factor = TrialFactor.create(factor: Factor.find(3), trial: Trial.find(3))

trial_factor = TrialFactor.create(factor: Factor.find(1), trial: Trial.find(4))
trial_factor = TrialFactor.create(factor: Factor.find(2), trial: Trial.find(4)) #Experimento 1, Teste 1
trial_factor = TrialFactor.create(factor: Factor.find(3), trial: Trial.find(4))

trial_factor = TrialFactor.create(factor: Factor.find(1), trial: Trial.find(5))
trial_factor = TrialFactor.create(factor: Factor.find(2), trial: Trial.find(5)) #Experimento 1, Teste 1
trial_factor = TrialFactor.create(factor: Factor.find(3), trial: Trial.find(5))

trial_factor = TrialFactor.create(factor: Factor.find(1), trial: Trial.find(6))
trial_factor = TrialFactor.create(factor: Factor.find(2), trial: Trial.find(6)) #Experimento 1, Teste 1
trial_factor = TrialFactor.create(factor: Factor.find(3), trial: Trial.find(6))

#Ligar Baterias aos testes

trial_factor = TrialFactor.create(factor: Factor.find(7), trial: Trial.find(1))
trial_factor = TrialFactor.create(factor: Factor.find(8), trial: Trial.find(2)) 
trial_factor = TrialFactor.create(factor: Factor.find(9), trial: Trial.find(3))
trial_factor = TrialFactor.create(factor: Factor.find(7), trial: Trial.find(4))
trial_factor = TrialFactor.create(factor: Factor.find(8), trial: Trial.find(5)) 
trial_factor = TrialFactor.create(factor: Factor.find(9), trial: Trial.find(6))

#Ligar Status aos Testes

trialExecution = TrialExecution.create(log: "A1", status: "aprovado", trial: Trial.find(1))
trialExecution = TrialExecution.create(log: "B2", status: "aprovado", trial: Trial.find(2))
trialExecution = TrialExecution.create(log: "C3", status: "em_execucao", trial: Trial.find(3))
trialExecution = TrialExecution.create(log: "D4", status: "reprovado", trial: Trial.find(4))
trialExecution = TrialExecution.create(log: "E5", status: "aprovado", trial: Trial.find(5))
trialExecution = TrialExecution.create(log: "F6", status: "reprovado", trial: Trial.find(6))

p 'Finalizando carregamento de dados'