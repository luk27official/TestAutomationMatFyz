*** Settings ***
Library  Browser

*** Variables ***

${SIS_TITLE}         Studijní informační systém
${PREDMETY_TITLE}    Předměty

${PREDMETY_BTN}      id=hint_predmety
${HLEDEJ_BTN}        //input[@type="submit" and @value="Hledej"]

${VYUCUJICI_RADIO}   id=utyp_2
${UCITEL_INPUT}      id=ujmeno
${NAZEV_INPUT}       id=nazev
${ANOTACE_CHECKBOX}  id=srch_pam_a
${SEMESTR_MULTIBOX}  id=sem

${SIS_HOMEPAGE}      https://is.cuni.cz/studium/

*** Test Cases ***

TC_Predmety_01
    Start prohlizece + SIS
    Prejit na stranku Predmety
    Fill Text  ${NAZEV_INPUT}  txt=Úvod do softwarového
    Click      ${ANOTACE_CHECKBOX}
    Select Options By  ${SEMESTR_MULTIBOX}  value  2
    Fill Text  ${UCITEL_INPUT}  txt=Nečaský
    Click  ${VYUCUJICI_RADIO}
    Click  ${HLEDEJ_BTN}
    #Get Element Count  //form/table[@class="tab1"]/tbody  ==  2
    Click  //*[text()="Úvod do softwarového inženýrství"]
    Get Text  css=div.form_div_title  ==  Úvod do softwarového inženýrství - NSWI041
    Get Text  xpath=//tr[./th/text()="E-Kredity:"]/td  ==  5
    Sleep  10

*** Keywords ***
Start prohlizece + SIS
    New Browser  browser=chromium  headless=False
    New Page       ${SIS_HOMEPAGE}
    Get Title  ==  ${SIS_TITLE}

Prejit na stranku Predmety
    Click          ${PREDMETY_BTN}
    Get Title  ==  ${PREDMETY_TITLE}
