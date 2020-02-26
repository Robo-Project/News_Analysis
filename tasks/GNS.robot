*** Settings ***
Documentation    Global News Sentiment Analysis
Library          SeleniumLibrary
Library          Collections
Test Setup      Open Browser           url=${GUARDIAN}    browser=${BROWSER}
Test Teardown   Close Browser

*** Tasks ***

Get Top 5 Links
    @{LINKS}        Create List
       FOR    ${index}    IN RANGE    1    6
           ${TOPLINK}            Get Element Attribute           //*[@id="tabs-popular-1"]/ul/li[${index}]/a      attribute=href
           Append To List         ${LINKS}     ${TOPLINK}
       END
       Set Suite Variable  ${LINKS}
       Log             ${LINKS}


Get texts from links
    @{TEXTS}        Create List
           FOR    ${index}    IN RANGE    0    5
                Go to           ${LINKS}[${index}]
                ${CONTENT}  Get text  class:content__main
                Append To List  ${TEXTS}     ${CONTENT}
           END
           Log     ${TEXTS}

*** Variables ***
${BROWSER}      Firefox
${DELAY}        1
${GUARDIAN}     https://www.theguardian.com/international
${TOPLINK}
${CONTENT}
@{LINKS}
