*** Settings ***
Documentation    Global News Sentiment Analysis
Library          SeleniumLibrary
Library          Collections
Library          ../sentimentanalysis/SentimentAnalysis.py


*** Tasks ***

Get Top 5 Links
    Open Browser           url=${GUARDIAN}    browser=${BROWSER}
    @{LINKS}        Create List
       FOR    ${index}    IN RANGE    1    6
           ${TOPLINK}            Get Element Attribute           //*[@id="tabs-popular-1"]/ul/li[${index}]/a      attribute=href
           Append To List         ${LINKS}     ${TOPLINK}
       END
       Set Suite Variable  ${LINKS}
       Log             ${LINKS}
    Close Browser


Get texts from links
    Open Browser           url=${GUARDIAN}    browser=${BROWSER}
    @{TEXTS}        Create List
    Set Global Variable  @{TEXTS}
           FOR    ${index}    IN RANGE    0    5
                Go to           ${LINKS}[${index}]
                ${CONTENT}  Get text  class:content__main
                Append To List  ${TEXTS}     ${CONTENT}
           END
           Log     ${TEXTS}
    Close Browser

Sentiment Analysis
    @{results}  Create List
    Log     ${TEXTS}
    ${results}  Analyze Sentiment Of List  ${TEXTS}
    Log     ${results}

*** Variables ***
${BROWSER}      Firefox
${DELAY}        1
${GUARDIAN}     https://www.theguardian.com/international
${TOPLINK}
${CONTENT}
@{LINKS}
@{TEXTS}
@{results}