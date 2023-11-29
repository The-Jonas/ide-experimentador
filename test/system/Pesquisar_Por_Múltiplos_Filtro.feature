
Funcionalidade: Pesquisar os testes utilizando múltiplos filtros
Eu como usuário
Quero filtrar os testes por tags, coordenadas, porcentagem da bateria, status ou ativo
A fim de obter somente os testes relacionados aos filtro selecionados com maior velocidade

Cenário: Um Usuário pesquisa por um teste utilizando mais de um filtro (feliz) 

    Dado que tenha pelo menos um teste cadastrado no experimento,
    E que eu selecione o filtro ‘tag’,
    Quando eu escrever ‘Ciência’ na barra de pesquisa do filtro,
    Então eu devo ver um botão de adicionar novo filtro (‘+’) ao lado do filtro ‘tag’,
    Quando eu clicar no botão ‘+’,
    Então devo ver mais uma caixa de seleção de filtro e uma caixa de seleção central com as opções ‘&’ ou ‘Ou’ ,
    Quando eu selecionar a opção ‘Ou’ e o filtro ‘bateria’,
    E inserir um o valor ‘92’ na porcentagem da bateria,
    E clicar no botão ‘Pesquisar’,
    Então devo ver todos os testes que tenham a tag ‘Ciência’ quanto os testes com a bateria em ‘92%’.

Cenário: Um usuário pesquisa por um teste utilizando um ou mais campos dos filtros (triste) 

    Dado que não tenha nenhum teste com esse/s 'filtro/s' cadastrado/s,
    Quando eu escrever no campo de um ou mais filtros,
    E eu apertar 'enter',
    Então eu devo ver uma mensagem de aviso, indicando que nenhum teste foi encontrado para o/os filtro/s selecionado/s.