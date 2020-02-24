*** Settings ***
Documentation    Global News Sentiment Analysis
Library          SeleniumLibrary

*** Tasks ***
Guardian
    Open Browser           url=${GUARDIAN}    browser=${BROWSER}
    ${TOP1LINK}           Get Element Attribute           ${TOP1XPATH}      attribute=href
    Log                    ${TOP1LINK}
  
*** Variables ***
${BROWSER}      Chrome
${DELAY}        0
${GUARDIAN}     https://www.theguardian.com/international
${TOP1XPATH}    //*[@id="tabs-popular-1"]/ul/li[1]/a
${TOP1LINK}
${CONTENT}
