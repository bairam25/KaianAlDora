Imports BusinessLayer.BusinessLayer
Partial Class Favorites
    Inherits System.Web.UI.Page
    Dim UserId As String = "1"
#Region "Page Load"
    ''' <summary>
    ''' Handle page_load event
    ''' </summary>
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblRes.Visible = False
        UserId = PublicFunctions.GetUserId(Page)
        Try
            If Page.IsPostBack = False Then
                FillWishList()
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

    Sub FillWishList()
        Try
            Dim dt = DBContext.Getdatatable("Select I.* from vw_Items I inner join tblWishList W on I.ID = w.ItemID where W.UserId='" & UserId & "'")
            rpFavorit.DataSource = dt
            rpFavorit.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
End Class
