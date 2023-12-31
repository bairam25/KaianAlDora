﻿
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports System.Data
Imports System.Data.SqlClient

Partial Class Master
    Inherits System.Web.UI.MasterPage
#Region "Variables"

    Dim UserId As String
    Dim _sqlconn As New SqlConnection(DBContext.GetConnectionString)
    Dim _sqltrans As SqlTransaction
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
                pnlWelcome.Visible = False
                lblRegisteredFirstName.Text = String.Empty
                'lblRegisteredFullName.Text = String.Empty
                Exit Sub
            End If
            Dim dt As DataTable = DBContext.Getdatatable("select FullName from tblUsers where isnull(isDeleted,0)=0 and Active=1 and ID=@Par1", UserId)
            If dt.Rows.Count = 0 Then
                pnlJoin.Visible = True
                pnlWelcome.Visible = False
                lblRegisteredFirstName.Text = String.Empty
                'lblRegisteredFullName.Text = String.Empty
                Exit Sub
            End If
            pnlJoin.Visible = False
            pnlWelcome.Visible = True
            Dim FirstName As String = dt.Rows(0).Item("FullName").ToString
            Dim FullName As String = dt.Rows(0).Item("FullName").ToString
            lblRegisteredFirstName.Text = PublicFunctions.GetFullNameFirstWord(FullName)
            'lblRegisteredFullName.Text = FullName


        Catch ex As Exception
            pnlJoin.Visible = True
            pnlWelcome.Visible = False
            lblRegisteredFirstName.Text = String.Empty
            'lblRegisteredFullName.Text = String.Empty
        End Try
    End Sub

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
End Class

