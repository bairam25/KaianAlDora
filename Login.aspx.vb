
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports System.Data

Partial Class Login
    Inherits clsLang
#Region "Page Load"
    ''' <summary>
    ''' Handle page_load event
    ''' </summary>
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            lblRes.Visible = False
            If Not Page.IsPostBack Then
                If PublicFunctions.isUserLogged Then
                    Response.Redirect("Home.aspx")
                End If
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region
#Region "Swich View"
    Protected Sub switchview(sender As LinkButton, e As System.EventArgs)
        Try
            Dim ctrl As String = sender.ID.ToLower
            Select Case ctrl
                Case "lbforgetpassword"
                    mv.SetActiveView(vwForgetPassword)
                    If txtUsername.Text <> String.Empty Then
                        txtForgetEmail.Text = txtUsername.Text
                        txtForgetEmail.CssClass = "not-empty"
                    End If
                Case "lbcancel"
                    mv.SetActiveView(vwLogin)
                    txtForgetEmail.Text = String.Empty
                    txtUsername.Text = String.Empty
            End Select
        Catch ex As Exception

        End Try
    End Sub
#End Region

#Region "Login"
    ''' <summary>
    ''' Check if user with entered username and password is exist or not.
    ''' </summary>
    Protected Sub Login(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim Username As String = txtUsername.Text.Trim
            Dim Password As String = txtPassword.Text.Trim
            Dim RememberMe As Boolean = chkKeepMeLoggedIn.Checked
            If Username = String.Empty And Password = String.Empty Then
                clsMessages.ShowMessage(lblRes, MessageTypesEnum.CUSTOMInfo, Me, Nothing, "Enter Username and Password")
                Exit Sub
            End If
            If Username = String.Empty Then
                clsMessages.ShowMessage(lblRes, MessageTypesEnum.CUSTOMInfo, Me, Nothing, "Enter Your Email")
                Exit Sub
            End If
            If Password = String.Empty Then
                clsMessages.ShowMessage(lblRes, MessageTypesEnum.CUSTOMInfo, Me, Nothing, "Enter Your Password")
                Exit Sub
            End If
            Dim daUser As New TblUsersFactory
            Dim dt As DataTable = DBContext.Getdatatable("select ID,Password from tblUsers where isnull(isDeleted,0)=0 and Active=1 and UserName=@Par1 ", Username)
            If dt.Rows.Count = 0 Then
                clsMessages.ShowMessage(lblRes, MessageTypesEnum.CUSTOMInfo, Me, Nothing, "Email is not exist!")
                Exit Sub
            End If
            Dim ID As String = dt.Rows(0).Item("ID").ToString
            Dim UserPassword As String = PublicFunctions.Decrypt(dt.Rows(0).Item("Password").ToString)
            If Password <> UserPassword Then
                clsMessages.ShowMessage(lblRes, MessageTypesEnum.CUSTOMInfo, Me, Nothing, "Password is incorrect")
                Exit Sub
            End If
            Dim User = daUser.GetAllBy(TblUsers.TblUsersFields.ID, ID).FirstOrDefault
            If PublicFunctions.CreateFrontEndCookie(User, RememberMe) Then
                Response.Redirect("Home.aspx", False)
            Else
                clsMessages.ShowMessage(lblRes, MessageTypesEnum.CustomErr, Me, Nothing, "Error...")
                Exit Sub
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region

#Region "Forget Password"
    ''' <summary>
    ''' Handles Reset Passowrd , Generate New Password and Send Email with it
    ''' </summary>
    Protected Sub ResetPassword()
        Try
            Dim ForgetEmail = txtForgetEmail.Text.Trim
            If ForgetEmail = String.Empty Then
                Exit Sub
            End If
            'Check if email is already registered 
            Dim dt As DataTable = DBContext.Getdatatable("Select ID,FullName from tblUsers where UserName='" & ForgetEmail & "' and isnull(isdeleted,0)=0  and Active=1 ")
            If dt.Rows.Count = 0 Then
                clsMessages.ShowInfoMessgage(lblRes, "Email is not exist", Me)
                txtForgetEmail.Text = String.Empty
            End If
            Dim ID As String = dt.Rows(0).Item("ID").ToString
            Dim FullName As String = dt.Rows(0).Item("FullName").ToString
            Dim rnd As New Random
            Dim NewlyRandomPassword = PublicFunctions.Encrypt(rnd.Next(9999999, 1000000000).ToString)
            DBContext.ExcuteQuery("Update tblUsers set Password='" & NewlyRandomPassword & "' where ID='" & ID & "' ")
            '2) Generate New Passwords and Send it to customer mail
            Dim sb As String
            sb = " <table> <tr>" &
"                                                                                                <td align=""left"" height=""30"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" style=""font-family: HelveticaNeue-Light, Helvetica Neue Light, Helvetica,  Arial, sans-serif; font-weight: 300; font-size: 14px; color: #333333; line-height: 22px;"" valign=""top"">" &
"                                                                                                    <strong>Dear " & FullName & ",</strong>" &
"                                                                                                </td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" height=""25"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" style=""font-family: HelveticaNeue-Light, Helvetica Neue Light, Helvetica,  Arial, sans-serif; font-weight: 300; font-size: 14px; color: #333333; line-height: 22px;"" valign=""top"">" &
"                                                                                                    Please use the following password to access your account: <b>" & PublicFunctions.Decrypt(NewlyRandomPassword) & "</b>" &
"                                                                                                </td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" height=""25"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" style=""font-family: HelveticaNeue-Light, Helvetica Neue Light, Helvetica,  Arial, sans-serif; font-weight: 300; font-size: 14px; color: #333333; line-height: 22px;"" valign=""top"">" &
"                                                                                                    You can sign in and change your password" &
"                                                                                                </td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" height=""25"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" height=""30"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr></table>"


            clsEmails.SendEmail("Reset Password", ForgetEmail, sb, True)
            clsMessages.ShowSuccessMessgage(lblRes, "Email with new password sent to you", Me)
            txtForgetEmail.Text = String.Empty
            mv.SetActiveView(vwLogin)
        Catch ex As Exception
            txtForgetEmail.Text = String.Empty
        End Try
    End Sub
#End Region
End Class
