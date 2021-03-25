*** Settings ***
Library           Selenium2Library
Library           Collections
Library           String

*** Variables ***
${URL}            https://www.powerbuy.co.th/th
${SEARCH_INPUT}    //*[@id="txt-searchBox-input"]
${SEARCH_BUTTON}    //*[@id="btn-searchBox-input"]
${44_55_CHECKBOX}    //*[contains(text(), '44 - 55')]/parent::div/preceding-sibling::div[2]
${32_43_CHECKBOX}    //*[contains(text(), '32 - 43')]/parent::div/preceding-sibling::div[2]
${TV_ITEM_2}      //*[starts-with(@id, 'productGrid') and contains(@data-product-position, '2')][1]
${LOADING_ICON}    //*[@id="img-loading"]
${ADD_TO_CART_BUTTON}    //*[starts-with(@id, 'btn-addCart')]
${MINI_CART_COUNT}    //*[starts-with(@class, 'MiniCart__CartQty')]

*** Test Cases ***
central_exam
    Open Browser    ${URL}    googlechrome
    Wait Until Page Contains Element    ${SEARCH_INPUT}    10s
    Input Text    ${SEARCH_INPUT}    TV
    Click Button    ${SEARCH_BUTTON}
    Wait Until Page Contains    44 - 55    10s
    Click Element    ${44_55_CHECKBOX}
    Wait Until Page Does Not Contain Element    ${LOADING_ICON}
    Sleep    5s
    Click Element    ${TV_ITEM_2}
    Wait Until Page Contains Element    ${ADD_TO_CART_BUTTON}    10s
    Click Button    ${ADD_TO_CART_BUTTON}
    Wait Until Element Contains    ${MINI_CART_COUNT}    1    10s
    Input Text    ${SEARCH_INPUT}    TV
    Click Button    ${SEARCH_BUTTON}
    Wait Until Page Contains    32 - 43
    Click Element    ${32_43_CHECKBOX}
    Wait Until Page Does Not Contain Element    ${LOADING_ICON}
    Sleep    5s
    Click Element    ${TV_ITEM_2}
    Wait Until Page Contains Element    ${ADD_TO_CART_BUTTON}    10s
    Click Button    ${ADD_TO_CART_BUTTON}
    Wait Until Element Contains    ${MINI_CART_COUNT}    2    10s
