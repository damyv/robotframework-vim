"=============================================================================
" File:         after/syntax/robot.vim
" Author:       Michael Foukarakis
" Version:      0.2
" Created:      Fri 17 Dec 2010 11:31:46 AM EET
" Last Update:  Tue 28 Jul 2015 15:39:21 AM CEST
"------------------------------------------------------------------------
" Description:
"       Syntax file for Robot test framework files.
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/after/syntax
"       Requires Vim 7+
" History:
"       0.1 - Robot now has a standard library, containing all sorts of goodies.
"       0.2 - Add all built-in, ssh and selenium library keywords.
"             Fix to match longest pattern instead of the first one.
" TODO:
"       * Figure out a neater alternative for the monster path regex
"=============================================================================
let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
" Matches
"------------------------------------------------------------------------
syn match robotNumber               display "\<\d\+\>"
syn match robotEllipsis             display "\.\.\."
" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial              display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"
" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotVariable             "\(\$\|@\|&\|%\){.\{-}}"
" This is by far the most stupid regex you'll see in here..
syn match robotPath                 display "\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}$"
" Operators
syn match robotOperator             "==\|="
" Table headers
syn match robotTable                "\c^\(\*\+\)\s*\(settings\|variables\|test cases\|tasks\|\(user \)\?keywords\)\s*\1$"
" Common settings
syn match robotCommonSet            "\c\[\(Documentation\|Timeout\)\]"
" Keyword settings
syn match robotKeywordSet           "\c\[\(Arguments\|Return\)\]"
" Testcase settings
syn match robotTestcaseSet          "\c\[\(Tags\|Setup\|Teardown\|Precondition\|Postcondition\|Template\)\]"

" Robot Gherkin support
syn match robotGherkin              "\c\<\(Given\|When\|Then\|And\|But\)\>"

" Settings (global)
syn match robotSetup                "\c\<\(Suite\|Test\|Task\) \(Setup\|Teardown\|Precondition\|Postcondition\)\>"
syn match robotSettings             "\c\<\(Library\|Resource\|Variables\|Documentation\|Metadata\|Force Tags\|Default Tags\|Test Template\|Test Timeout\)\>"

" Standard libraries
" List variables in reverse order to match the longest pattern not the first one.
syn match collectionsLibrary        "\c\<\(Append To List\|Combine Lists\|Convert To Dictionary\|Convert To List\|Copy Dictionary\|Copy List\|Count Values In List\|Dictionaries Should Be Equal\|Dictionary Should Contain Item\|Dictionary Should Contain Key\|Dictionary Should Contain Sub Dictionary\|Dictionary Should Contain Value\|Dictionary Should Not Contain Key\|Dictionary Should Not Contain Value\|Get Dictionary Items\|Get Dictionary Keys\|Get Dictionary Values\|Get From Dictionary\|Get From List\|Get Index From List\|Get Match Count\|Get Matches\|Get Slice From List\|Insert Into List\|Keep In Dictionary\|List Should Contain Sub List\|List Should Contain Value\|List Should Not Contain Duplicates\|List Should Not Contain Value\|Lists Should Be Equal\|Log Dictionary\|Log List\|Pop From Dictionary\|Remove Duplicates\|Remove From Dictionary\|Remove From List\|Remove Values From List\|Reverse List\|Set List Value\|Set To Dictionary\|Should Contain Match\|Should Not Contain Match\|Sort List\)\>"
syn match dateTimeLibrary           "\c\<\(Add Time To Date\|Add Time To Time\|Convert Date\|Convert Time\|Get Current Date\|Subtract Date From Date\|Subtract Time From Date\|Subtract Time From Time\)\>"
syn match dialogLibrary             "%%dialogLibrary%%"
syn match operatingSystemLibrary    "\c\<\(Append To Environment Variable\|Append To File\|Copy Directory\|Copy File\|Copy Files\|Count Directories In Directory\|Count Files In Directory\|Count Items In Directory\|Create Binary File\|Create Directory\|Create File\|Directory Should Be Empty\|Directory Should Exist\|Directory Should Not Be Empty\|Directory Should Not Exist\|Empty Directory\|Environment Variable Should Be Set\|Environment Variable Should Not Be Set\|File Should Be Empty\|File Should Exist\|File Should Not Be Empty\|File Should Not Exist\|Get Binary File\|Get Environment Variable\|Get Environment Variables\|Get File\|Get File Size\|Get Modified Time\|Grep File\|Join Path\|Join Paths\|List Directories In Directory\|List Directory\|List Files In Directory\|Log Environment Variables\|Log File\|Move Directory\|Move File\|Move Files\|Normalize Path\|Remove Directory\|Remove Environment Variable\|Remove File\|Remove Files\|Run\|Run And Return Rc\|Run And Return Rc And Output\|Set Environment Variable\|Set Modified Time\|Should Exist\|Should Not Exist\|Split Extension\|Split Path\|Touch\|Wait Until Created\|Wait Until Removed\)\>"
syn match processLibrary            "\c\<\(Get Process Id\|Get Process Object\|Get Process Result\|Is Process Running\|Join Command Line\|Process Should Be Running\|Process Should Be Stopped\|Run Process\|Send Signal To Process\|Split Command Line\|Start Process\|Switch Process\|Terminate All Processes\|Terminate Process\|Wait For Process\)\>"
syn match screenshotLibrary         "\c\<\(Set Screenshot Directory\|Take Screenshot\|Take Screenshot Without Embedding\)\>"
syn match stringLibrary             "\c\<\(Convert To Lowercase\|Convert To Uppercase\|Decode Bytes To String\|Encode String To Bytes\|Fetch From Left\|Fetch From Right\|Format String\|Generate Random String\|Get Line\|Get Line Count\|Get Lines Containing String\|Get Lines Matching Pattern\|Get Lines Matching Regexp\|Get Regexp Matches\|Get Substring\|Remove String\|Remove String Using Regexp\|Replace String\|Replace String Using Regexp\|Should Be Byte String\|Should Be Lowercase\|Should Be String\|Should Be Titlecase\|Should Be Unicode String\|Should Be Uppercase\|Should Not Be String\|Split String\|Split String From Right\|Split String To Characters\|Split To Lines\|Strip String\)\>"
syn match telnetLibrary             "\c\<\(Close All Connections\|Close Connection\|Execute Command\|Login\|Open Connection\|Read\|Read Until\|Read Until Prompt\|Read Until Regexp\|Set Default Log Level\|Set Encoding\|Set Newline\|Set Prompt\|Set Telnetlib Log Level\|Set Timeout\|Switch Connection\|Write\|Write Bare\|Write Control Character\|Write Until Expected Output\)\>"
syn match xmlLibrary                "\c\<\(Add Element\|Clear Element\|Copy Element\|Element Attribute Should Be\|Element Attribute Should Match\|Element Should Exist\|Element Should Not Exist\|Element Should Not Have Attribute\|Element Text Should Be\|Element Text Should Match\|Element To String\|Elements Should Be Equal\|Elements Should Match\|Evaluate Xpath\|Get Child Elements\|Get Element\|Get Element Attribute\|Get Element Attributes\|Get Element Count\|Get Element Text\|Get Elements\|Get Elements Texts\|Log Element\|Parse Xml\|Remove Element\|Remove Element Attribute\|Remove Element Attributes\|Remove Elements\|Remove Elements Attribute\|Remove Elements Attributes\|Save Xml\|Set Element Attribute\|Set Element Tag\|Set Element Text\|Set Elements Attribute\|Set Elements Tag\|Set Elements Text\)\>"

" Other libraries
" See and follow listing order as above.
syn match seleniumLibrary           "\c\<\(Add Cookie\|Add Location Strategy\|Alert Should Be Present\|Alert Should Not Be Present\|Assign Id To Element\|Capture Element Screenshot\|Capture Page Screenshot\|Checkbox Should Be Selected\|Checkbox Should Not Be Selected\|Choose Cancel On Next Confirmation\|Choose File\|Choose Ok On Next Confirmation\|Clear Element Text\|Click Button\|Click Element\|Click Element At Coordinates\|Click Image\|Click Link\|Close All Browsers\|Close Browser\|Close Window\|Confirm Action\|Cover Element\|Create Webdriver\|Current Frame Contains\|Current Frame Should Contain\|Current Frame Should Not Contain\|Delete All Cookies\|Delete Cookie\|Dismiss Alert\|Double Click Element\|Drag And Drop\|Drag And Drop By Offset\|Element Attribute Value Should Be\|Element Should Be Disabled\|Element Should Be Enabled\|Element Should Be Focused\|Element Should Be Visible\|Element Should Contain\|Element Should Not Be Visible\|Element Should Not Contain\|Element Text Should Be\|Element Text Should Not Be\|Execute Async Javascript\|Execute Javascript\|Focus\|Frame Should Contain\|Get Alert Message\|Get All Links\|Get Cookie\|Get Cookie Value\|Get Cookies\|Get Element Attribute\|Get Element Count\|Get Element Size\|Get Horizontal Position\|Get List Items\|Get Location\|Get Locations\|Get Matching Xpath Count\|Get Selected List Label\|Get Selected List Labels\|Get Selected List Value\|Get Selected List Values\|Get Selenium Implicit Wait\|Get Selenium Speed\|Get Selenium Timeout\|Get Session Id\|Get Source\|Get Table Cell\|Get Text\|Get Title\|Get Value\|Get Vertical Position\|Get WebElement\|Get WebElements\|Get Window Handles\|Get Window Identifiers\|Get Window Names\|Get Window Position\|Get Window Size\|Get Window Titles\|Go Back\|Go To\|Handle Alert\|Input Password\|Input Text\|Input Text Into Alert\|Input Text Into Prompt\|List Selection Should Be\|List Should Have No Selections\|List Windows\|Location Should Be\|Location Should Contain\|Locator Should Match X Times\|Log Location\|Log Source\|Log Title\|Maximize Browser Window\|Mouse Down\|Mouse Down On Image\|Mouse Down On Link\|Mouse Out\|Mouse Over\|Mouse Up\|Open Browser\|Open Context Menu\|Page Should Contain\|Page Should Contain Button\|Page Should Contain Checkbox\|Page Should Contain Element\|Page Should Contain Image\|Page Should Contain Link\|Page Should Contain List\|Page Should Contain Radio Button\|Page Should Contain Textfield\|Page Should Not Contain\|Page Should Not Contain Button\|Page Should Not Contain Checkbox\|Page Should Not Contain Element\|Page Should Not Contain Image\|Page Should Not Contain Link\|Page Should Not Contain List\|Page Should Not Contain Radio Button\|Page Should Not Contain Textfield\|Press Key\|Press Keys\|Radio Button Should Be Set To\|Radio Button Should Not Be Selected\|Register Keyword To Run On Failure\|Reload Page\|Remove Location Strategy\|Scroll Element Into View\|Select All From List\|Select Checkbox\|Select Frame\|Select From List\|Select From List By Index\|Select From List By Label\|Select From List By Value\|Select Radio Button\|Select Window\|Set Browser Implicit Wait\|Set Focus To Element\|Set Screenshot Directory\|Set Selenium Implicit Wait\|Set Selenium Speed\|Set Selenium Timeout\|Set Window Position\|Set Window Size\|Simulate\|Simulate Event\|Submit Form\|Switch Browser\|Table Cell Should Contain\|Table Column Should Contain\|Table Footer Should Contain\|Table Header Should Contain\|Table Row Should Contain\|Table Should Contain\|Textarea Should Contain\|Textarea Value Should Be\|Textfield Should Contain\|Textfield Value Should Be\|Title Should Be\|Unselect All From List\|Unselect Checkbox\|Unselect Frame\|Unselect From List\|Unselect From List By Index\|Unselect From List By Label\|Unselect From List By Value\|Wait For Condition\|Wait Until Element Contains\|Wait Until Element Does Not Contain\|Wait Until Element Is Enabled\|Wait Until Element Is Not Visible\|Wait Until Element Is Visible\|Wait Until Page Contains\|Wait Until Page Contains Element\|Wait Until Page Does Not Contain\|Wait Until Page Does Not Contain Element\|Xpath Should Match X Times\)\>"
syn match sshLibrary                "\c\<\(Close All Connections\|Close Connection\|Create Local Ssh Tunnel\|Directory Should Exist\|Directory Should Not Exist\|Enable Ssh Logging\|Execute Command\|File Should Exist\|File Should Not Exist\|Get Connection\|Get Connections\|Get Directory\|Get File\|Get Pre Login Banner\|List Directories In Directory\|List Directory\|List Files In Directory\|Login\|Login With Public Key\|Open Connection\|Put Directory\|Put File\|Read\|Read Command Output\|Read Until\|Read Until Prompt\|Read Until Regexp\|Set Client Configuration\|Set Default Configuration\|Start Command\|Switch Connection\|Write\|Write Bare\|Write Until Expected Output\)\>"

" The built-in standard library comes last to re-match the keywords already caught.
" See and follow listing order as above.
syn match builtInLibrary            "\c\<\(Call Method\|Catenate\|Comment\|Continue For Loop\|Continue For Loop If\|Convert To Binary\|Convert To Boolean\|Convert To Bytes\|Convert To Hex\|Convert To Integer\|Convert To Number\|Convert To Octal\|Convert To String\|Create Dictionary\|Create List\|Evaluate\|Exit For Loop\|Exit For Loop If\|Fail\|Fatal Error\|Get Count\|Get Length\|Get Library Instance\|Get Time\|Get Variable Value\|Get Variables\|Import Library\|Import Resource\|Import Variables\|Keyword Should Exist\|Length Should Be\|Log\|Log Many\|Log To Console\|Log Variables\|No Operation\|Pass Execution\|Pass Execution If\|Regexp Escape\|Reload Library\|Remove Tags\|Repeat Keyword\|Replace Variables\|Return From Keyword\|Return From Keyword If\|Run Keyword\|Run Keyword And Continue On Failure\|Run Keyword And Expect Error\|Run Keyword And Ignore Error\|Run Keyword And Return\|Run Keyword And Return If\|Run Keyword And Return Status\|Run Keyword If\|Run Keyword If All Critical Tests Passed\|Run Keyword If All Tests Passed\|Run Keyword If Any Critical Tests Failed\|Run Keyword If Any Tests Failed\|Run Keyword If Test Failed\|Run Keyword If Test Passed\|Run Keyword If Timeout Occurred\|Run Keyword Unless\|Run Keywords\|Set Global Variable\|Set Library Search Order\|Set Log Level\|Set Suite Documentation\|Set Suite Metadata\|Set Suite Variable\|Set Tags\|Set Task Variable\|Set Test Documentation\|Set Test Message\|Set Test Variable\|Set Variable\|Set Variable If\|Should Be Empty\|Should Be Equal\|Should Be Equal As Integers\|Should Be Equal As Numbers\|Should Be Equal As Strings\|Should Be True\|Should Contain\|Should Contain Any\|Should Contain X Times\|Should End With\|Should Match\|Should Match Regexp\|Should Not Be Empty\|Should Not Be Equal\|Should Not Be Equal As Integers\|Should Not Be Equal As Numbers\|Should Not Be Equal As Strings\|Should Not Be True\|Should Not Contain\|Should Not Contain Any\|Should Not End With\|Should Not Match\|Should Not Match Regexp\|Should Not Start With\|Should Start With\|Sleep\|Variable Should Exist\|Variable Should Not Exist\|Wait Until Keyword Succeeds\)\>"

"------------------------------------------------------------------------
" Regions
"------------------------------------------------------------------------
" Single-line comments. Are there multi-line comments?
syn region robotComment     display start="#" excludenl end="$"
syn region robotString      start="\"" excludenl end="\""

"------------------------------------------------------------------------
" Keywords
"------------------------------------------------------------------------

"------------------------------------------------------------------------
" Links
"------------------------------------------------------------------------
hi def link robotVariable           Type
hi def link robotSetup              Include
hi def link robotSettings           Include
hi def link robotTestCaseName       Function
hi def link robotComment            Comment
hi def link robotEllipsis           String
hi def link robotTable              Identifier
hi def link robotImport             Include
hi def link robotSpecial            Special
hi def link robotString             String
hi def link robotNumber             Number
hi def link robotPath               Constant
hi def link robotOperator           Operator
hi def link robotCommonSet          Keyword
hi def link robotKeywordSet         Keyword
hi def link robotTestcaseSet        Keyword
hi def link robotGherkin            Keyword

hi def link builtInLibrary          Comment
hi def link collectionsLibrary      Keyword
hi def link dateTimeLibrary         Keyword
hi def link dialogLibrary           Keyword
hi def link operatingSystemLibrary  Keyword
hi def link processLibrary          Keyword
hi def link screenshotLibrary       Keyword
hi def link stringLibrary           Keyword
hi def link telnetLibrary           Keyword
hi def link xmlLibrary              Keyword
hi def link seleniumLibrary         Keyword
hi def link sshLibrary              Keyword

let b:current_syntax = "robot"
"------------------------------------------------------------------------
let &cpo=s:cpo_save
" vim700: set fdm=marker:
