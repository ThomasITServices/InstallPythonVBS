''  Install Python 2.7.11
''  by Edward L. Thomas                                                     
''  Email: Edward@ThomasITServices.com Phone: 503-409-8918
''  Created:    7/6/2016                                                                           
''  Last Modified:  7/6/2016                                                                              
''  Last Modified By: Edward Thomas                                                            
''  Programming Language: VBScript

Option Explicit

'''''Start Up'''''
If WScript.Arguments.Named.Exists("elevated") = False Then
    'Launch the script again as administrator
    Dim StartMeUP : Set StartMeUP = createObject("Shell.Application")
    Call StartMeUP.ShellExecute("wscript.exe", chr(34) + WScript.ScriptFullName + chr(34) + " /elevated", "", "runas", 1)
                
Else

    '''' Setting Variables ''''

    Dim ProgramName: ProgramName = "Install Python 2.7.11"
    Dim popOnTop : popOnTop = 4096
    Dim ProgramPath : ProgramPath = "\\netapp3\Aero_IET\Software\Applications\Python\source\python-2.7.11.amd64.msi" 
    Dim ProgramPathTwo : ProgramPathTwo = "powershell.exe -NoProfile -File C:\Users\g0069775-ta\Documents\VBSProject\InstallPython\SetEnvForPython.ps1 -verbose"

    Dim Arg : Arg = "/passive /norestart"
    Dim objShell : Set objShell = createobject("Wscript.shell")
    Dim oFSO: Set oFSO = CreateObject("Scripting.FileSystemObject")
    Dim oEnv : Set oEnv = objShell.Environment("PROCESS")

    '''''Process Block ''''
    objShell.run ProgramPathTwo,4,false

    'Call installSoftware(ProgramName,ProgramPath,Arg)
    'Call installSoftware(ProgramPathTwo,ProgramPath,ArgTwo)

    ''''Function Block '''''
'/passive /norestart
 Sub installSoftware(ProgramName,installPath,arg)
	oENV("SEE_MASK_NOZONECHECKS") = 1
	Dim BWaitOnReturn : bWaitOnReturn = True
		If Not oFSO.FileExists(installPath) Then
			objShell.Popup "File Not found! " + installPath ,5,"Missing File"
			Exit Sub
		Else
			objShell.popup "Installing " + ProgramName,2,ProgramName
			objShell.run Chr(34) + installPath + Chr(34)  + " " + arg,0,bWaitOnReturn 
			objShell.popup ProgramName + " is now Installed ",2,ProgramName
		End If
	oEnv.Remove("SEE_MASK_NOZONECHECKS") 
End Sub
    ''''End'''
    Wscript.Quit

End IF
