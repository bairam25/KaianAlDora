
Partial Class Login
    Inherits System.Web.UI.Page
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
End Class
