Set filesys = CreateObject("Scripting.FileSystemObject")
Set objFolder = filesys.GetFolder("C:\Documents and Settings\Administrator\Desktop\portfolio\Urbanize\bin-debug\img\")
For Each File in objFolder.Files
If Left(filesys.GetFileName(File),5) = "index" Then
name = filesys.GetFileName(File)
fname = "index" + Mid(name,InStr(name,"cid"),Len(name)-div1)
filesys.CopyFile File, "C:\Documents and Settings\Administrator\Desktop\portfolio\Urbanize\bin-debug\img\"&fname
End If
Next
