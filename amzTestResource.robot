*** Settings ***
Library     SeleniumLibrary
Resource    amazon_resources.robot


*** Keywords ***
# Gherking steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a categoria "Computadores e Informática"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Tablets"

# O acesso para página inicial está no primeiro caso de teste

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar o resultado da pesquisa se está listando o produdo pesquisado

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produdo pesquisado
