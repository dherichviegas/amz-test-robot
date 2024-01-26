*** Settings ***
Documentation    Desafio de estruturas utilizand o For e IF


*** Variables ***
@{LIST}     5    6    7    8    9    10


*** Test Cases ***
Contagem de numeros
    Contagem de 5 a 10


*** Keywords ***
Contagem de 5 a 10
...    FOR    ${counter}    IN RANGE    5    11    
        IF    ${counter} == 5
            Log To Console    message=Eu sou o número ${counter}!
        ELSE IF    ${counter} == 10
            Log To Console    message=Eu sou o número ${counter}!
        ELSE
            Log To Console    message=Eu não sou o número 5 e nem o 10!
        END
    END
