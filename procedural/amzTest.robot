*** Settings ***
# No Settings é feita a configuração da suite de teste
Documentation       Essa suite testa o site da Amazon.com.br

Resource            amzTestResource.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu Eletrônicos da Amazon.com.br
    ...    categoria computadores e Informática
    [Tags]    menus
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produdo
    [Tags]    busca_produtos lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produdo pesquisado "Console Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]    adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produdo pesquisado "Console Xbox Series S"
    Selecionar o item "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
   [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
   [Tags]    remover_carrinho
   Acessar a home page do site Amazon.com.br
   Digitar o nome de produto "Xbox Series S" no campo de pesquisa
   Clicar no botão de pesquisa
   Verificar o resultado da pesquisa se está listando o produdo pesquisado "Console Xbox Series S"
   Selecionar o item "Console Xbox Series S"
   Adicionar o produto "Console Xbox Series S" no carrinho
   Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
   Remover o produto "Console Xbox Series S" do carrinho
   Verificar se o carrinho fica vazio
