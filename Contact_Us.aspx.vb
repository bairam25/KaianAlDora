
Imports System

Partial Class Contact_Us
    Inherits System.Web.UI.Page


    Protected Sub Send(sener As Object, e As EventArgs)
        Try
            Dim name = txtName.Text.Trim
            If String.IsNullOrEmpty(name) Then
                clsMessages.ShowInfoMessgage(lblRes, "Please Enter Your Name", Me)
                Exit Sub
            End If
            Dim Email = txtEmail.Text.Trim
            If String.IsNullOrEmpty(Email) Then
                clsMessages.ShowInfoMessgage(lblRes, "Please Enter Your Email", Me)
                Exit Sub
            End If
            Dim Title = txtSubject.Text.Trim
            If String.IsNullOrEmpty(Title) Then
                clsMessages.ShowInfoMessgage(lblRes, "Please Enter Subject", Me)
                Exit Sub
            End If
            Dim Msg = "<b>From : </b> " & Email & "</br> " & txtMessage.Text
            If String.IsNullOrEmpty(Msg) Then
                clsMessages.ShowInfoMessgage(lblRes, "Please Enter Your Message", Me)
                Exit Sub
            End If

            Dim isSent = clsEmails.SendEmail(Title, clsEmails.CompanyEmail, Msg, True)
            If isSent Then
                clsMessages.ShowSuccessMessgage(lblRes, "Thank Your for contact us!", Me)
                Clear()
                Exit Sub
            End If
            clsMessages.ShowErrorMessgage(lblRes, "Error Sending Your Message", Me)
        Catch ex As Exception
            clsMessages.ShowErrorMessgage(lblRes, "Error Sending Your Message", Me)
            Throw ex
        End Try
    End Sub


    Protected Sub Clear()
        txtName.Text = String.Empty
        txtEmail.Text = String.Empty
        txtSubject.Text = String.Empty
        txtMessage.Text = String.Empty
    End Sub
End Class
