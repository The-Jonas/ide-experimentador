##Grupo 05 

#Nome e Matrícula dos Integrantes do Grupo:

```
João Victor Pereira Vieira - **211036114**
Luiz Henrique Silva Andrade - **211010430**
Sofia Dy La Fuente Monteiro - **211055530**
Gabriel de Castro Dias - **211055432**
Daniel do Carmo Figueiredo - **160057922**
``` 

##Nome do Projeto: - Issue 11 _ Dado que sou um usúario, quero poder filtrar os testes



###Escopo do Projeto:

- Objetivo: Adicionar a tela de pesquisa de testes por filtros, com funcionalidades específicas para cada filtro.

- Entregas: Desenvolvimento completo das features de filtro, tanto no frontend quanto no backend, até a data de entrega.

- Requisitos: Utilização das tecnologias React e Ruby on Rails, com abordagem funcional do projeto.

- Restrições: Tempo de desenvolvimento limitado, sendo necessário cumprir os prazos estabelecidos. Pré-requisito de conhecimento das tecnologias mencionadas.

- Exclusões: Não serão implementadas as issues de outros grupos, focando apenas nas funcionalidades de filtro.

- Marcos: Cada sprint deve ter um objetivo bem definido, com desenvolvimento dentro do prazo estabelecido. O código deve ser claro e conciso.





Perguntas referentes a Sprint_1:

Quem fez o papel de Scrum Master? E de Product Owner?

- Quem ficou responsável pelo papel de Scrum Master foi _João Victor Pereira_ , o papel de Product Owner não foi feito por ninguém nessa sprint, visto que todos participaram da reunião com o Stakeholder

Quais funcionalidades serão desenvolvidas? Quais serão as regras de negócio para cada funcionalidade?

-

Quem ficou responsável por cada funcionalidade?

-

Qual a política de branching utilizada pelo grupo?

-


###Histórias de Usuário com a métrica Velocity

Contexto: Dado que sou um usuário
          E estou na tela de pesquisa com filtros

Cénario 1 - Uso de um filtro específico (caminho feliz) - **_1_**

Dado que sou um usuário,
E existem vários testes com diferentes filtros,
Quando eu seleciono a opção de filtrar por uma informação específica,
Então devo ver apenas os testes associados a esse filtro na lista de testes

Cénario 2 - Uso de múltiplos filtros (caminho feliz) - **_2_**

Dado que sou um usuário
E existem vários testes com diferentes filtros,
Quando eu selecionar múltiplas opções de filtros,
Eu devo ver apenas os testes associados a todos os filtros selecionados

Cenário 3 - Uso de um filtro específico (caminho triste) - **_1_**

Dado que sou um usuário,
E não existem testes associados ao filtro selecionado,
Quando seleciono o filtro,
Então devo ver uma mensagem de aviso, indicando que nenhum teste foi encontrado para o filtro selecionado

Cenário 4 - Uso de múltiplos filtros (caminho triste) - **_1_**

Dado que sou um usuário,
E não existem testes associados a uma combinação de filtros,
Quando eu seleciono mais de um tipo de filtro,
Então devo ver uma mensagem de aviso, indicando que não existem testes associados a essa combinação de filtros

