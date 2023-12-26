
Imports AjaxControlToolkit.HTMLEditor.ToolbarButton
Imports BusinessLayer.BusinessLayer
Imports clsMessages

Partial Class Register
    Inherits System.Web.UI.Page
#Region "Validation"
    Private Function isUniqueEmail(ByVal email As String) As Boolean
        Try
            If String.IsNullOrEmpty(email) Then
                ShowInfoMessgage(lblRes, "Enter Email!", Me)
                Return False
            End If
            Dim daTable As New TblUsersFactory
            Dim isUnique = daTable.GetAllByCustom("UserName='" & email & "' and Active=1 and ISNULL(ISDELETED,0)=0").Count = 0
            If Not isUnique Then
                ShowInfoMessgage(lblRes, "Email Already Exist!", Me)
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
                'ShowInfoMessgage(lblRes, "Enter Mobile Number!", Me)
                'Return False
            End If
            Dim daTable As New TblUsersFactory
            Dim isUnique = daTable.GetAllByCustom("Mobile='" & mobile & "' and Active=1 and ISNULL(ISDELETED,0)=0").Count = 0
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
            'If Not isUniqueUserName(txtCandidateUsername.Text) Then
            '    Return False
            'End If
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
            Dim dtUser As New TblUsers

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
            System.Threading.Thread.Sleep(5000)
            Response.Redirect("Home.aspx", False)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
End Class
