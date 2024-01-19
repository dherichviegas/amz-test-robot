*** Settings ***
# No Settings é feita a configuração da suite de teste
Documentation       Essa suite testa o site da Amazon.com.br

Resource            amzTestResource_bdd.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu Eletrônicos da Amazon.com.br
    ...    categoria computadores e Informática
    [Tags]    menus
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produdo
    [Tags]    busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
