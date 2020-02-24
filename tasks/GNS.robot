*** Settings ***
Documentation    Global News Sentiment Analysis
Library          SeleniumLibrary

*** Tasks ***
Guardian
    Open Browser           ${GUARDIAN}    ${BROWSER}
    ${CONTENT}=  Get Text  id:most-viewed
    Log                    ${CONTENT}
  
*** Variables ***
${BROWSER}      Chrome
${DELAY}        0
${GUARDIAN}     https://www.theguardian.com/international
${CONTENT}
