﻿#Region "Import"
Imports System.Data
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports clsGlobalApplication
Imports PublicFunctions

#End Region

Partial Class Item_Details
    Inherits clsLang
#Region "Global Variables"
    Dim UserId As String
    Dim Client_ID As String = "1001"
    Dim PageNotFoundURL As String = "~/PageNotFound"
    'Dim dtItemsApp As DataTable
#End Region
#Region "Page Load"
    ''' <summary>
    ''' Handle page_load event
    ''' </summary>
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            lblRes.Visible = False
            UserId = PublicFunctions.GetRegisteredUserId()

            If Not Page.IsPostBack Then
                If Page.RouteData.Values("Id") IsNot Nothing Then
                    Dim ItemId As String = Page.RouteData.Values("Id")
                    FillItem(ItemId)
                    UpdateViewCount(ItemId)

                Else
                    Response.Redirect(PublicFunctions.ServerURL, False)
                    Return
                End If
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub



#End Region

#Region "Fill Item Details"
    ''' <summary>
    ''' Fill Item Details
    ''' </summary>
    Sub FillItem(ByVal ItemId As String)
        Try
            'dtItemsApp = DBContext.Getdatatable("select * from vw_Items where Id='" & ItemId & "'")
            'Dim dvListItems As New DataView(dtItemsApp)
            'dvListItems.RowFilter = "Id='" & ItemId & "'"
            Dim dtListItems As DataTable = DBContext.Getdatatable("select * from vw_Items where Id='" & ItemId & "'")
            If dtListItems.Rows.Count > 0 Then
                If dtListItems.Rows(0).Item("Active").ToString <> "True" Then
                    lvDetails.Enabled = False
                End If
                lvDetails.DataSource = dtListItems
                lvDetails.DataBind()

                lblBrand.Text = dtListItems.Rows(0).Item("BrandName").ToString
                lblCatCode.Text = dtListItems.Rows(0).Item("CatCode").ToString
                lblSubCatCode.Text = dtListItems.Rows(0).Item("SubCategoryCode").ToString
                lbCategory.Text = dtListItems.Rows(0).Item("CategoryName").ToString
                lbCategory.NavigateUrl = PublicFunctions.ServerURL + "Category=" + dtListItems.Rows(0).Item("CategoryName").ToString.Replace(" ", "-")
                lbSubcategory.Text = dtListItems.Rows(0).Item("SubCategoryName").ToString
                lbSubcategory.NavigateUrl = PublicFunctions.ServerURL + "Category=" + dtListItems.Rows(0).Item("CategoryName").ToString.Replace(" ", "-") + "/SubCategory=" + dtListItems.Rows(0).Item("SubCategoryName").ToString.Replace(" ", "-")
                lblItemId.Text = dtListItems.Rows(0).Item("Id").ToString

                FillDetails()

            Else
                Response.Redirect(PageNotFoundURL, False)
                Return
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Fill Photos,size,color and video
    ''' </summary>
    Sub FillDetails()
        Try
            For Each dr As ListViewItem In lvDetails.Items
                Dim lblId As Label = DirectCast(dr.FindControl("lblId"), Label)

                'Fill Photos
                Dim lvPhotos As ListView = DirectCast(dr.FindControl("lvPhotos"), ListView)
                Dim lvPhotosButtons As ListView = DirectCast(dr.FindControl("lvPhotosButtons"), ListView)
                Dim dtPhotos As DataTable = DBContext.Getdatatable("select 	id,main,REPLACE(Photo, '~/','') as Photo,REPLACE(PhotoThumb, '~/', '') as PhotoThumb from tblItemsPhotos where  isnull(Isdeleted,0)=0 and itemId='" & lblId.Text & "' order by main DESC")

                lvPhotos.DataSource = dtPhotos
                lvPhotos.DataBind()

                lvPhotosButtons.DataSource = dtPhotos
                lvPhotosButtons.DataBind()
            Next
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region

#Region "Update View Count"
    Sub UpdateViewCount(ByVal ItemId As String)
        Try
            Dim dtItems As DataTable = DBContext.Getdatatable("select isnull(ViewsCount,0) as ViewsCount from tblItems where  Id='" & ItemId & "' and isnull(Isdeleted,0)=0 and ClientId='" & PublicFunctions.Client_Id & "'")
            If dtItems.Rows.Count > 0 Then
                Dim NewViewCount As Integer = CInt(dtItems.Rows(0).Item("ViewsCount")) + 1
                Dim Updated As Integer = DBContext.ExcuteQuery("update tblItems set ViewsCount='" & NewViewCount.ToString & "' where Id='" & ItemId & "' and isnull(Isdeleted,0)=0 and ClientId='" & PublicFunctions.Client_Id & "'")
                If Updated <> 1 Then
                    clsMessages.ShowErrorMessgage(lblRes, "Error at view count", Me.Page)
                End If
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

End Class
