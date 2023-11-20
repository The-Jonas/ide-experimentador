# language: pt-Br
# encoding: utf-8

Funcionalidade: Pesquisar os testes utilizando filtros
Eu como usuário
Quero filtrar os testes por tags, coordenadas ou porcentagem da bateria
A fim de obter somente os testes relacionados aos filtro selecionados com maior velocidade

Contexto:
    Dado que eu esteja logado como usuário no ide-experimentador
    E eu esteja na página de pesquisar testes
    Quando eu entrar no campo de pesquisa
    Então eu devo ver os campos de filtro 'tag','coordenadas' e 'bateria' 
    
Cénario: Um usuário pesquisa por um teste utilizando somente uma tag (feliz)
    Dado que tenha um ou mais testes com a tag 'Rápido' cadastrado
    E que eu selecione o filtro 'tag'
    Quando eu escrever 'Rápido' na barra de pesquisa do filtro
    E eu clicar no botão 'Pesquisar' 
    Então eu devo ver todos os testes com a tag 'Rápido' cadastrado

Cénario: Um usuário pesquisa por um teste utilizando somente as coordenadas (feliz)
    Dado que tenha um ou mais testes com as coordenadas "X=0 Y=1 Z=0" cadastrado
    E que eu selecione o filtro 'coordenadas'
    Quando eu escrever '0 1 0' nos três campos "X Y Z" respectivamente
    E eu clicar no botão 'Pesquisar' 
    Então eu devo ver todos os testes com as coordenadas 'X=0 Y=1 Z=0' cadastrado

Cénario: Um usuário pesquisa por um teste utilizando somente a bateria (feliz)
    Dado que tenha um ou mais testes com robôs com bateria igual a '70%'
    E que eu selecione o filtro 'bateria'
    Quando eu selecionar a opção "70%"
    E eu clicar no botão 'Pesquisar'
    Então eu devo ver todos os testes em que o robô possui a bateria igual a '70%'




Cénario: Um usuário pesquisa por um teste utilizando somente uma campo do filtro (triste)
    Quando eu escrever no campo de algum filtro
    Dado que não tenha nenhum teste com esse 'filtro' cadastrado
    Quando eu apertar 'enter'
    Então eu devo ver uma mensagem de aviso, indicando que nenhum teste foi encontrado para o fitro selecionado