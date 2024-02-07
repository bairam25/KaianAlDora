Imports System.Data
Imports BusinessLayer.BusinessLayer
Imports Microsoft.VisualBasic

Public Class clsGlobalApplication
#Region "Global Varaibles Updates"

    Public Shared Function UpdateApplicationItems() As Boolean
        Try
            Dim dtItems As New DataTable
            dtItems = DBContext.Getdatatable("SELECT * FROM vw_Items where ClientId='" & PublicFunctions.Client_Id & "'")
            HttpContext.Current.Application("Items") = dtItems
            dtItems = DBContext.Getdatatable("SELECT * FROM vw_AllItems where ClientId='" & PublicFunctions.Client_Id & "'")
            HttpContext.Current.Application("AllItems") = dtItems
            Return True
        Catch ex As Exception

            Return False
        End Try
    End Function
    ''' <summary>
    ''' Fill Application Variable of All Items 
    ''' </summary>
    Public Shared Function GetAllItemsDT() As DataTable
        Dim dtItems As DataTable
        Try

            If HttpContext.Current.Application("AllItems") Is Nothing Then
                dtItems = DBContext.Getdatatable("SELECT * FROM vw_AllItems where ClientId='" & PublicFunctions.Client_Id & "'")
                HttpContext.Current.Application("AllItems") = dtItems
            Else
                dtItems = HttpContext.Current.Application("AllItems")
            End If

            Return dtItems
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' Fill Application Variable of active Items 
    ''' </summary>
    Public Shared Function GetItemsDT() As DataTable
        Dim dtItems As DataTable
        Try
            'If HttpContext.Current.Application("Items") Is Nothing Then
            '    dtItems = DBContext.Getdatatable("SELECT * FROM vw_Items where ClientId='" & PublicFunctions.Client_Id & "'")
            '    HttpContext.Current.Application("Items") = dtItems
            'Else
            '    dtItems = HttpContext.Current.Application("Items")
            'End If
            dtItems = DBContext.Getdatatable("SELECT * FROM vw_Items where ClientId='" & PublicFunctions.Client_Id & "'")
            HttpContext.Current.Application("Items") = dtItems
            Return dtItems
        Catch ex As Exception
            Return Nothing
        End Try
    End Function
    ''' <summary>
    ''' Fill Application Variable of active Items 
    ''' </summary>
    Public Shared Function GetCompactItemsDT() As DataTable
        Dim dtItems As DataTable
        Try
            If HttpContext.Current.Application("ItemsCompact") Is Nothing Then
                dtItems = DBContext.Getdatatable("SELECT * FROM vw_ItemsCompact where ClientId='" & PublicFunctions.Client_Id & "'")
                HttpContext.Current.Application("ItemsCompact") = dtItems
            Else
                dtItems = HttpContext.Current.Application("ItemsCompact")
            End If

            Return dtItems
        Catch ex As Exception
            Return Nothing
        End Try
    End Function


#End Region
End Class
