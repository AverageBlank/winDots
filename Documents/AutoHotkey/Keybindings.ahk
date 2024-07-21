#SingleInstance

;;;;;;;;;;;! Variables ;;;;;;;;;;;
;;;;? Applications ;;;;
browser := "msedge" ;* Browser
terminal := "wt" ;* Terminal, wt = Windows Terminal
code := "code" ;* Code editor, code=Visual Studio Code

;;;;;;;;;;;! Key Bindings ;;;;;;;;;;;
;;;;? Applications ;;;;
#Enter::Run, %terminal% ;* Terminal ==> Win + Enter
#^b::Run, %browser% ;* Browser ==> Win + Control + B
#^e::Run, %code% ;* Code Editor ==> Win + Control + E
