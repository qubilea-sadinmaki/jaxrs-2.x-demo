*** Settings ***
Documentation
...  This test suite tests endpoints of a RESTful web service that returns JSON and XML responses.
...  Rest apis on jaxrs-2.x-demo are implemented using JAX-RS.
Suite Setup    Setup suite
Suite Teardown    Teardown suite
Library  DateTime
Library  RequestsLibrary
Library  JSONLibrary
Library  XML
Library  Process

*** Variables ***
${baseUrl}  http://localhost:8080/
${JAVA_DIR}    ${CURDIR}../../../quickstart

*** Test Cases ***
TestPing
    [Documentation]  Test the ping endpoint (empty)
    Create Session    ping    ${baseUrl}
    ${response}=  Head On Session    ping    /ping
    Should Be Equal As Strings    ${response.status_code}  204

TestPong
    [Documentation]  Test the pong endpoint (json)
    Create Session    pong    http://localhost:8080
    ${response}=  Get On Session    pong    /pong
    Should Be Equal As Strings    ${response.status_code}  200
    Json should have node with value    ${response.json()}    $.city    chicago
    Json should have node with value    ${response.json()}    $.name    jon doe
    Json should have node with value    ${response.json()}    $.age    22 

TestPingPong
    [Documentation]  Test the pingpong endpoint (xml)
    Create Session    pingpong    http://localhost:8080
    ${response}=  Get On Session    pingpong    /pingpong/getpingpong
    Should Be Equal As Strings    ${response.status_code}  200
    ${xml}=    Parse Xml    ${response.text}
    Xml should have node with value    ${xml}    city    chicago
    Xml should have node with value    ${xml}    name    jon doe
    Xml should have node with value    ${xml}    age    22

*** Keywords ***
Setup suite
    Log  Start java application
    Run Process    mvn clean install    shell=True    cwd=${JAVA_DIR}
    ${process}=    Start Process    java -jar target/jaxrs-quickstart-1.0-SNAPSHOT-jar-with-dependencies.jar    shell=True    cwd=${JAVA_DIR}
    Wait For Process    ${process}    timeout=10s
    Log datetime information
    Log  Test execution started

Teardown suite
    Log  Close java application
    Terminate All Processes
    Log datetime information
    Log  Test execution completed

Log datetime information
    ${date}=  Get Current Date
    log  ${date}

Json should have node with value
    [Arguments]  ${json}  ${nodeName}    ${expectedNodeValue}
    ${nodeValue}=    Get Value From Json    ${json}    ${nodeName}
    Should Be Equal As Strings    ${nodeValue}[0]  ${expectedNodeValue}

Xml should have node with value
    [Arguments]  ${xml}  ${nodeName}    ${expectedNodeValue}
    ${nodeValue}=    Get Element Text    ${xml}    ${nodeName}
    Should Be Equal As Strings    ${nodeValue}  ${expectedNodeValue}