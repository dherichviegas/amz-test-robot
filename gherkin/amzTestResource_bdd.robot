*** Settings ***
Library     SeleniumLibrary
# Resource    amazon_resources.robot


*** Variables ***
${URL}                          https://www.amazon.com.br/
${MENU_ELETRONICOS}             //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}           //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}     Eletrônicos e Tecnologia
${PESQUISA}                     //input[contains(@type,'text')]
${CLICK_PESQUISAR}              //input[contains(@type,'submit')]
${RESULTADO_PESQUISA}           //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]
${SELECIONAR_ITEM}              //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
${ADC_CARRINHO}                 //input[contains(@name,'submit.add-to-cart')]
${VER_CARRINHO}                 //a[contains(.,'Ir para o carrinho')]
${EXCLUIR_ITEM}                 //input[@aria-label='Excluir Console Xbox Series S']
${ITEM_EXCLUIDO}                //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=edge
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

# Gherking steps

Dado que estou na home page da Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Quando acessar o menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    # Pode criar uma variavel apenas para frase entre aspas ex:"Eletrônicos e Tecnologia" -> "${FRASE}"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

E o texto "${CATEGORIA}" deve ser exibido na página
# truepath //img[contains(@alt,'Computadores e Informática')]
    Element Should Be Visible    locator=//h1[contains(.,'${CATEGORIA}')]

Quando pesquisar pelo produto "${TEXTO}"
    Input Text    locator=${PESQUISA}    text=${TEXTO}

    Click Element    locator=${CLICK_PESQUISAR}

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Wait Until Element Is Visible    locator=${RESULTADO_PESQUISA}

E um produto da linha "Xbox Series S" deve ser mostrado na página
   Click Element    locator=${SELECIONAR_ITEM}


