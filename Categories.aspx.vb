
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports System.Data

Partial Class Categories
    Inherits clsLang
    ''' <summary>
    ''' Handle page load event
    ''' </summary>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            lblRes.Visible = False

            If Not Page.IsPostBack Then
                FillCategories()
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    Sub FillCategories()
        Try
            Dim dt As DataTable = DBContext.Getdatatable("select Id,LookupId,Value,Icon from tblLookupValue where isnull(isdeleted,0)=0 and lookupid = (select id from tblLookup where Type='Item Category')")
            rpCategory.DataSource = dt
            rpCategory.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    Private Sub rpCategory_DataBound(sender As Object, e As EventArgs) Handles rpCategory.ItemDataBound
        Try
            For Each item As RepeaterItem In rpCategory.Items
                Dim catId As String = DirectCast(item.FindControl("lblId"), Label).Text
                Dim rpSubCategory As Repeater = DirectCast(item.FindControl("rpSubCategory"), Repeater)
                Dim liViewAll As HtmlGenericControl = DirectCast(item.FindControl("liViewAll"), HtmlGenericControl)

                Dim dv As DataTable = DBContext.Getdatatable("select top(3) Id,LookupId,Value,Icon,relatedvalueid from tblLookupValue where isnull(isdeleted,0)=0 and relatedvalueid =" & catId)
                'DirectCast(item.FindControl("lbltest"), Label).Text = "select Id,LookupId,Value,Icon,relatedvalueid from tblLookupValue where isnull(isdeleted,0)=0 and relatedvalueid =" & catId

                rpSubCategory.DataSource = dv
                rpSubCategory.DataBind()

                liViewAll.Visible = dv.Rows.Count > 3

            Next
        Catch ex As Exception
            ShowMessage(lblRes, MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

End Class
