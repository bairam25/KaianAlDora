
#Region "Import"
Imports System.Data
Imports System.IO
Imports BusinessLayer.BusinessLayer
Imports clsMessages

#End Region
Partial Class RegisteredUsers
    Inherits System.Web.UI.Page
#Region "Global Variables"
    Dim pf As New PublicFunctions
    Dim UserId As String = "1"
    Dim SliderTitle As String
    Dim Caption As String
    Dim URL As String
    Dim Photo As String
    Dim OrderNo As String
#End Region
#Region "Public_Functions"


    ''' <summary>
    ''' Update item to be activated or not.
    ''' </summary>
    Sub UpdateActive(sender As Object, e As EventArgs)
        Try
            Dim parent = sender.parent.parent
            Dim ItemId As String = DirectCast(parent.FindControl("lblId"), Label).Text
            Dim StatusName As String = "Active"
            Dim MSG As String = ""
            Dim chk As CheckBox = DirectCast(sender, CheckBox)

            Dim Updated As Integer = 0
            If chk.Checked Then
                StatusName = "Active"
                MSG = "Activated Successfully"
            Else
                StatusName = "Deactive"
                MSG = "Deactive Successfully"
            End If

            Updated = DBContext.ExcuteQuery("Update TblUsers set Active ='" + chk.Checked.ToString + "',ModifiedDate=getdate() where Id='" + ItemId + "' ")
            If Updated = 1 Then
                ''clsLogs.AddSystemLogs(StatusName, "TblSlider", ItemId)
                clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMSuccess, Page, Nothing, MSG)
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region
#Region "Page Load"
    ''' <summary>
    ''' Handle page_load event
    ''' </summary>
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblRes.Visible = False
        UserId = 1 ' PublicFunctions.GetUserId(Page)
        Try
            If Page.IsPostBack = False Then
                'Permissions.CheckPermisions(gvUsers, cmdNew, txtSearch, cmdSearch, Me.Page, UserId)
                'clsLogs.AddSystemLogs("Access")
                FillGrid()
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region
#Region "Fill Grid"

    ''' <summary>
    ''' Fill gridview with data from TblSlider.
    ''' </summary>
    Sub FillGrid()
        Try
            Dim dtSlider As DataTable = DBContext.Getdatatable("select * from TblUsers where isnull(Isdeleted,0)=0  and " + CollectConditions() + "")
            If dtSlider.Rows.Count > 0 Then
                pgPanel.Visible = True
                ' Initialize the sorting expression.
                If SortExpression.Value = String.Empty Then
                    SortExpression.Value = "Id ASC"
                End If
                ' Populate the GridView.
                ' Convert the DataTable to DataView.
                Dim dv As New DataView(dtSlider)

                ' Set the sort column and sort order.
                dv.Sort = SortExpression.Value.ToString()

                ' Bind the GridView control.
                gvUsers.DataSource = dv
                gvUsers.DataBind()
            Else
                pgPanel.Visible = False
                gvUsers.DataSource = Nothing
                gvUsers.DataBind()
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Collect condition string to fill grid
    ''' </summary>
    Public Function CollectConditions() As String
        Dim result As String = "1=1"
        Try
            Dim Search As String = IIf(txtSearch.Text = "", "1=1", " (FullName Like '%" + txtSearch.Text.Trim + "%' Or Username Like '%" + txtSearch.Text.Trim + "%')")
            Return Search
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return result
        End Try
    End Function
#End Region
#Region "Sorting"

    Protected Sub Gv_Sorting(ByVal sender As Object, ByVal e As GridViewSortEventArgs)
        Try
            Dim strSortExpression As String() = SortExpression.Value.ToString().Split(" "c)

            ' If the sorting column is the same as the previous one, 
            ' then change the sort order.
            If strSortExpression(0) = e.SortExpression Then
                If strSortExpression(1) = "ASC" Then
                    SortExpression.Value = Convert.ToString(e.SortExpression) & " " & "DESC"
                Else
                    SortExpression.Value = Convert.ToString(e.SortExpression) & " " & "ASC"
                End If
            Else
                ' If sorting column is another column, 
                ' then specify the sort order to "Ascending".
                SortExpression.Value = Convert.ToString(e.SortExpression) & " " & "DESC"
            End If

            ' Rebind the GridView control to show sorted data.
            FillGrid()

            ' add sorting Arrows.
            If strSortExpression(1) = "ASC" Then
                gvUsers.HeaderRow.Cells(PublicFunctions.GetColumnIndex(gvUsers, e.SortExpression)).CssClass = "faDown"
            Else
                gvUsers.HeaderRow.Cells(PublicFunctions.GetColumnIndex(gvUsers, e.SortExpression)).CssClass = "faUp"
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region
#Region "Paging"

    ''' <summary>
    ''' Paging function
    ''' </summary>
    Protected Sub gvUsers_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs)
        Try
            gvUsers.PageIndex = e.NewPageIndex
            FillGrid()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Set Number of rows at every page
    ''' </summary>
    Protected Sub PageSize_Changed(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            FillGrid()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region







End Class
