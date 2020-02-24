*** Settings ***
Documentation    Global News Sentiment Analysis
Library          SeleniumLibrary        
Library          Collections
Test Setup      Open Browser           url=${GUARDIAN}    browser=${BROWSER}
Test Teardown   Close Browser

*** Tasks ***

Get Top 5 Links
    ${LINKS}        Create List
    FOR    ${index}    IN RANGE    1    5
        ${TOPLINK}            Get Element Attribute           //*[@id="tabs-popular-1"]/ul/li[${index}]/a      attribute=href
        Append To List         ${LINKS}     ${TOPLINK}
    END
    Log     ${LINKS}


*** Variables ***
${BROWSER}      Chrome
${DELAY}        0
${GUARDIAN}     https://www.theguardian.com/international
${TOPLINK}
${CONTENT}
${index}        0
