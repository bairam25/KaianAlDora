
Imports System.Data
Imports System.Data.SqlClient
Imports AjaxControlToolkit.HTMLEditor.ToolbarButton
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports Microsoft.VisualBasic.ApplicationServices

Partial Class Register
    Inherits clsLang
#Region "Variables"

    Dim UserId As String

#End Region

#Region "Page Load"
    ''' <summary>
    ''' Handle page load event
    ''' </summary>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            lblRes.Visible = False
            UserId = PublicFunctions.GetRegisteredUserId()
            If Not Page.IsPostBack Then
                FillProfile()
            Else
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "AddScriptsPostback", "AddScriptsPostback();", True)
            End If
            txtPassword.Attributes("value") = txtPassword.Text
            txtConfirmPassword.Attributes("value") = txtConfirmPassword.Text
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

#Region "Validation"
    Private Function isUniqueEmail(ByVal email As String) As Boolean
        Try
            If String.IsNullOrEmpty(email) Then
                ShowInfoMessgage(lblRes, "Enter Email!", Me)
                Return False
            End If
            Dim daTable As New TblUsersFactory
            Dim isUnique = daTable.GetAllByCustom("ID <> " & UserId & " and UserName='" & email & "' and Active=1 and ISNULL(ISDELETED,0)=0").Count = 0
            If Not isUnique Then
                ShowInfoMessgage(lblRes, "Email Already Exist!", Me)
                Return False
            End If
            Return isUnique
        Catch ex As Exception
            ShowMessage(lblRes, MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function


    Private Function isUniqueMobile(ByVal mobile As String) As Boolean
        Try
            If String.IsNullOrEmpty(mobile) Then
                Return True
            End If
            Dim daTable As New TblUsersFactory
            Dim isUnique = daTable.GetAllByCustom("ID <> " & UserId & " and Mobile='" & mobile & "' and Active=1 and ISNULL(ISDELETED,0)=0").Count = 0
            If Not isUnique Then
                ShowInfoMessgage(lblRes, "Mobile Number Already Exist!", Me)
            End If
            Return isUnique
        Catch ex As Exception
            ShowMessage(lblRes, MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function
    Private Function isValidAccount() As Boolean
        Try

            If Not isUniqueMobile(txtMobile.Text) Then
                Return False
            End If

            If Not isUniqueEmail(txtEmail.Text) Then
                Return False
            End If
            If txtPassword.Text.Trim.Length < 6 Then
                ShowInfoMessgage(lblRes, "Enter Password with minimum 6 digits", Me)
                Return False
            End If
            If Not String.Equals(txtPassword.Text.Trim, txtConfirmPassword.Text.Trim) Then
                clsMessages.ShowInfoMessgage(lblRes, "Password not matched", Me)
                Return False
            End If
            Return True
        Catch ex As Exception
            ShowMessage(lblRes, MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function


#End Region

#Region "Register"
    Protected Sub FillProfile()
        Try
            Dim isRegisteredUser = PublicFunctions.isUserLogged
            If isRegisteredUser Then
                btnRegister.CommandArgument = "Edit"
                lblTitle.Text = "تعديل حساب"
                btnRegister.Text = "تعديل"
                pnlLogin.Visible = False
                Dim dt As DataTable = DBContext.Getdatatable("select * from tblUsers where isnull(isDeleted,0)=0 and Active=1 and ID=@Par1", UserId)
                If dt.Rows.Count = 0 Then
                    If PublicFunctions.RemoveFontEndCookie Then
                        Dim myCookies As String() = Request.Cookies.AllKeys
                        For Each cookie As String In myCookies
                            Response.Cookies(cookie).Expires = DateTime.Now.AddDays(-1)
                        Next
                        Response.Redirect(PublicFunctions.ServerURL & "/Home.aspx", False)
                    End If
                    Exit Sub
                End If


                txtName.Text = dt.Rows(0).Item("FullName").ToString
                txtEmail.Text = dt.Rows(0).Item("UserName").ToString
                txtMobile.Text = dt.Rows(0).Item("Mobile").ToString
                txtPassword.Text = PublicFunctions.Decrypt(dt.Rows(0).Item("Password").ToString)
                txtConfirmPassword.Text = PublicFunctions.Decrypt(dt.Rows(0).Item("Password").ToString)

            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub



    Protected Sub Register(sender As Object, e As EventArgs)
        Try
            Dim Name = txtName.Text.Trim
            Dim Email = txtEmail.Text.Trim
            Dim Mobile = txtMobile.Text.Trim
            Dim Password = txtPassword.Text
            'validation
            If Not isValidAccount() Then
                Exit Sub
            End If

            Dim daUsers As New TblUsersFactory
            Dim dtUser As TblUsers = daUsers.GetAllBy(TblUsers.TblUsersFields.ID, UserId).FirstOrDefault
            If dtUser Is Nothing Then
                dtUser = New TblUsers
            End If

            dtUser.FullName = Name
            dtUser.Username = Email
            dtUser.Password = PublicFunctions.Encrypt(Password)
            dtUser.Active = 1
            dtUser.Mobile = Mobile
            dtUser.ModifiedDate = DateAndTime.Now
            Dim rnd As New Random
            dtUser.EmailVerificationCode = rnd.Next(1000, 10000000).ToString
            If btnRegister.CommandArgument = "Add" Then
                dtUser.CreatedBy = 1
                dtUser.CreatedDate = DateAndTime.Now
                dtUser.ClientId = 1
                daUsers.Insert(dtUser)
            Else
                daUsers.Update(dtUser)
            End If
            If Not clsEmails.SendConfirmationEmail(dtUser) Then
                clsMessages.ShowInfoMessgage(lblRes, "Can`t send email verification! , please check your email", Page)
                Exit Sub
            End If
            clsMessages.ShowSuccessMessgage(lblRes, "Thanks!.. We'll send an email to you. Open it up to activate your account.", Me.Page)
            Response.Redirect("Home.aspx", False)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
#End Region

End Class
