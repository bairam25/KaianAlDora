﻿
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports System.Activities.Statements
Imports System.Data
Imports System.Data.SqlClient

Partial Class Master
    Inherits System.Web.UI.MasterPage
#Region "Variables"

    Dim UserId As String
    Dim _sqlconn As New SqlConnection(DBContext.GetConnectionString)
    Dim _sqltrans As SqlTransaction
    Dim dtItems As DataTable
#End Region

#Region "Page Load"
    ''' <summary>
    ''' Handle page_load event
    ''' </summary>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            lblRes.Visible = False
            UserId = PublicFunctions.GetRegisteredUserId()
            CheckLogin()
            If Not Page.IsPostBack Then
                setLangText(clsLang.GetLang)
                FillCategories()
                lblFavCount.Text = PublicFunctions.GetFavouritCount
                lblFavoriteIcon.InnerHtml = "<use xlink:href='/images/sprite-icon.svg?v=20231114_3#icon-heart-full'></use>"
                If Val(lblFavCount.Text) = 0 Then
                    lblFavCount.Attributes.Add("style", "display:none")
                    lblFavoriteIcon.InnerHtml = "<use xlink:href='/images/sprite-icon.svg?v=20231114_3#icon-heart-line'></use>"
                End If
            Else
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "AddScriptsPostback", "AddScriptsPostback();", True)
            End If
        Catch ex As Exception
            ShowMessage(lblRes, MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region

#Region "Check Login"
    Private Sub CheckLogin()
        Try
            If UserId = 0 Then
                pnlJoin.Visible = True
                pnlJoinMobile.Visible = True
                pnlWelcome.Visible = False
                lblRegisteredFirstName.Text = String.Empty
                'lblRegisteredFullName.Text = String.Empty
                Exit Sub
            End If
            Dim dt As DataTable = DBContext.Getdatatable("select * from tblUsers where isnull(isDeleted,0)=0 and Active=1 and ID=@Par1", UserId)
            If dt.Rows.Count = 0 Then
                pnlJoin.Visible = True
                pnlJoinMobile.Visible = True
                pnlWelcome.Visible = False
                lblRegisteredFirstName.Text = String.Empty
                lblRegisteredEmail.Text = String.Empty
                lblRegisteredAvatar1.Text = String.Empty
                lblRegisteredAvatar2.Text = String.Empty
                Exit Sub
            End If
            pnlJoin.Visible = False
            pnlJoinMobile.Visible = False
            pnlWelcome.Visible = True
            Dim FirstName As String = dt.Rows(0).Item("FullName").ToString
            Dim FullName As String = dt.Rows(0).Item("FullName").ToString
            lblRegisteredFirstName.Text = FullName ' PublicFunctions.GetFullNameFirstWord(FullName)
            lblRegisteredEmail.Text = dt.Rows(0).Item("UserName").ToString
            Dim avatarName = GetFirstLetters(dt.Rows(0).Item("FullName").ToString)
            lblRegisteredAvatar1.Text = avatarName
            lblRegisteredAvatar2.Text = avatarName
        Catch ex As Exception
            pnlJoin.Visible = True
            pnlJoinMobile.Visible = True
            pnlWelcome.Visible = False
            lblRegisteredFirstName.Text = String.Empty
            'lblRegisteredFullName.Text = String.Empty
        End Try
    End Sub

    Function GetFirstLetters(input As String) As String
        Dim result As String = ""

        For Each word As String In input.Split(" "c)
            If word.Length > 0 Then
                result &= word(0)
            End If
        Next

        Return result
    End Function
#End Region

#Region "Logout"
    Protected Sub LogOut()
        If PublicFunctions.RemoveFontEndCookie Then
            Dim myCookies As String() = Request.Cookies.AllKeys
            For Each cookie As String In myCookies
                Response.Cookies(cookie).Expires = DateTime.Now.AddDays(-1)
            Next
            Response.Redirect(PublicFunctions.ServerURL & "/Home.aspx", False)
        End If
    End Sub
#End Region

#Region "Language"
    Protected Sub ChangeLanguage(sender As Object, e As EventArgs)
        Dim lang As String = sender.CommandArgument
        Try
            If CreateLangCookie(lang) Then
                setLangText(lang)
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
        clsLang.LangRedirect(lang)
    End Sub
    Private Function CreateLangCookie(ByRef Lang As String) As Boolean
        Try
            Dim userCookie As HttpCookie = New HttpCookie("KianLang")
            userCookie("Lang") = Lang
            userCookie.Expires = Today.AddDays(30)
            Response.Cookies.Add(userCookie)
            Return True
        Catch ex As Exception
            Return False
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Function
    Sub setLangText(ByVal lang As String)
        Try
            Select Case lang
                Case "ar-EG"
                    lbEnLang.Visible = True
                    lbEnLangMobile.Visible = True
                    lbArLang.Visible = False
                    lbArLangMobile.Visible = False

                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "LangMain1", "ChangeLang('" + lang + "');", True)
                Case "en-gb"
                    lbEnLang.Visible = False
                    lbEnLangMobile.Visible = False
                    lbArLang.Visible = True
                    lbArLangMobile.Visible = True

                    ' ScriptManager.RegisterStartupScript(Me, Me.GetType(), "LangMain1", "ChangeLang('" + lang + "');", True)
            End Select
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region
#Region "Search"
    Protected Sub Search(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ItemKey As String = txtSearch.Text.Trim

        Dim Qry As String = ""

        If ItemKey <> String.Empty Then
            Qry += "Search=" & ItemKey.Replace(" ", "-")
        End If
        If Qry <> String.Empty Then
            Response.Redirect(PublicFunctions.ServerURL & Qry)
        End If

    End Sub

#End Region

#Region "FillMenu"
    Sub FillCategories()

        Try
            Dim dtCat As DataTable = DBContext.Getdatatable("select distinct Category,CategoryName from vw_Items ")
            lvCategories.DataSource = dtCat
            lvCategories.DataBind()
            FillSubCategories()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub FillSubCategories()
        Try
            Dim dtSubCategories As DataTable = DBContext.Getdatatable("select distinct SubCategory,SubCategoryName,Category,CategoryName from vw_Items  ")
            Dim dvSubCat As New DataView(dtSubCategories)
            If dvSubCat.Count > 0 Then
                For Each item As ListViewItem In lvCategories.Items
                    Dim CategoryId As String = CType(item.FindControl("lblCategoryId"), Label).Text
                    Dim lvSubCategories As ListView = CType(item.FindControl("lvSubCategories"), ListView)
                    dvSubCat.RowFilter = "Category = " & CategoryId
                    dvSubCat.Sort = "SubCategoryName ASC"
                    Dim dtSubCat As DataTable = dvSubCat.ToTable(True, "SubCategoryName", "SubCategory", "CategoryName")

                    lvSubCategories.DataSource = dtSubCat
                    lvSubCategories.DataBind()
                Next
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

End Class

