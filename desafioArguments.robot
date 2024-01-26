*** Settings ***
Documentation       Desafio criar Argumentos
Library             String

*** Variables ***
&{PESSOA}       nome=David    sobrenome=Viegas    email=@testerobot.com

*** Test Cases ***
Desafio Argumentos
    Criar usuário    ${PESSOA.nome}    ${PESSOA.sobrenome}
 
*** Keywords ***
Criar usuário
    [Documentation]    Produzirá um e-mail customizado
    [Arguments]    ${PESSOA.nome}    ${PESSOA.sobrenome}
    ${RET}    Generate Random String      length=4    chars=[LETTERS]
    Log To Console    message=${PESSOA.nome}${PESSOA.sobrenome}${RET}${PESSOA.email}

    
    

    
