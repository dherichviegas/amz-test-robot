*** Settings ***
Library     SeleniumLibrary


*** Variables ***
# Declara variáveis (globais) que tem valor constante, não pode passar keywords, apenas valores fixos
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

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
# Pode criar uma variavel apenas para frase entre aspas ex:"Eletrônicos e Tecnologia" -> "${FRASE}"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${CATEGORIA}"
# truepath //img[contains(@alt,'Computadores e Informática')]
    Element Should Be Visible    locator=//img[contains(@alt,'${CATEGORIA}')]

Digitar o nome de produto "${TEXTO}" no campo de pesquisa
    Input Text    locator=${PESQUISA}    text=${TEXTO}

Clicar no botão de pesquisa
    Click Element    locator=${CLICK_PESQUISAR}

Verificar o resultado da pesquisa se está listando o produdo pesquisado "Console Xbox Series S"
    Wait Until Element Is Visible    locator=${RESULTADO_PESQUISA}

Selecionar o item "Console Xbox Series S"
    Click Element    locator=${SELECIONAR_ITEM}

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Button    locator=${ADC_CARRINHO}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Click Element    locator=${VER_CARRINHO}

Remover o produto "Console Xbox Series S" do carrinho
    Click Button    locator=${EXCLUIR_ITEM}

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=${ITEM_EXCLUIDO}
