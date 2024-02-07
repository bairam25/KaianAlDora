
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
                FillBrands()
                FillHotItems()
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
    Sub FillBrands()
        Try
            Dim dt As DataTable = DBContext.Getdatatable("select Id,LookupId,Value,Icon from tblLookupValue where isnull(isdeleted,0)=0 and lookupid = (select id from tblLookup where Type='Item Brand')")
            rpBrands.DataSource = dt
            rpBrands.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    Sub FillHotItems()
        Try
            Dim dt As DataTable = DBContext.Getdatatable("select top 5 * from vw_Items where hot=1")
            lvItems.DataSource = dt
            lvItems.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
End Class
