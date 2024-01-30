
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports System.Activities.Statements
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
                Dim CatId = Request.QueryString("Cat")
                If String.IsNullOrEmpty(CatId) Then
                    FillCategories()
                Else
                    FillSubCategories(CatId)
                End If

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
    Sub FillSubCategories(ByVal CatId As String)
        Try
            If String.IsNullOrEmpty(CatId) Then
                Exit Sub
            End If
            Dim dtCategory As DataTable = DBContext.Getdatatable("select Id,LookupId,Value,Icon from tblLookupValue where isnull(isdeleted,0)=0 and Id = '" & CatId & "'")
            If dtCategory.Rows.Count = 0 Then
                ShowAlertMessgage(lblRes, "Not Valid Category", Me)
                Exit Sub
            End If
            lblSubCategoryTitle.Text = dtCategory.Rows(0).Item("Value").ToString
            Dim dt As DataTable = DBContext.Getdatatable("select Id,LookupId,Value,Icon,relatedvalueid from tblLookupValue where isnull(isdeleted,0)=0 and relatedvalueid =" & CatId & " Order by Value")

            rpSubCategory.DataSource = dt
            rpSubCategory.DataBind()
            pnlSubCategories.Visible = True
            pnlCategories.Visible = False
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub



    Private Sub rpCategory_DataBound(sender As Object, e As EventArgs) Handles rpCategory.DataBound
        Try
            For Each item As ListViewItem In rpCategory.Items
                Dim catId As String = DirectCast(item.FindControl("lblId"), Label).Text
                Dim rpSubCategory As Repeater = DirectCast(item.FindControl("rpSubCategory"), Repeater)
                Dim liViewAll As HtmlGenericControl = DirectCast(item.FindControl("liViewAll"), HtmlGenericControl)

                Dim dt As DataTable = DBContext.Getdatatable("select Id,LookupId,Value,Icon,relatedvalueid from tblLookupValue where isnull(isdeleted,0)=0 and relatedvalueid =" & catId & " Order by Value")
                Dim SubCategoriesCount = dt.Rows.Count
                If SubCategoriesCount > 3 Then
                    dt = dt.AsEnumerable.Take(3).CopyToDataTable
                End If
                rpSubCategory.DataSource = dt
                rpSubCategory.DataBind()

                liViewAll.Visible = SubCategoriesCount > 3

            Next
        Catch ex As Exception
            ShowMessage(lblRes, MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

End Class
