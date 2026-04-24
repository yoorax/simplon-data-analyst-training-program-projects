Sub ExportSheetsToCSV()
    Dim ws As Worksheet
    Dim wb As Workbook
    Dim savePath As String
    
    ' Set your custom folder path
    savePath = "C:\Users\rachid\3D Objects\week 10 - SQL SERVER\"
    
    For Each ws In ThisWorkbook.Worksheets
        ws.Copy
        Set wb = ActiveWorkbook
        
        ' Save with sheet name as .csv
        wb.SaveAs Filename:=savePath & ws.Name & ".csv", _
                  FileFormat:=xlCSV, CreateBackup:=False
        wb.Close SaveChanges:=False
    Next ws
    
    MsgBox "All sheets exported as CSV files in: " & savePath
End Sub
