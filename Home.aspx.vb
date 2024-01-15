
Imports System.Data
Imports BusinessLayer.BusinessLayer

Partial Class Home
    Inherits clsLang
    ''' <summary>
    ''' Handle page load event
    ''' </summary>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            lblRes.Visible = False

            If Not Page.IsPostBack Then
                FillSlider()
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    Sub FillSlider()
        Try
            Dim dt As DataTable = DBContext.Getdatatable("Select * from tblslider where active='1' and ISNULL(isdeleted,0)=0")
            lvSlider.DataSource = dt
            lvSlider.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
End Class
