Imports System.Threading
Imports System.Globalization

Public Class clsLang
    Inherits System.Web.UI.Page
    Protected Overrides Sub InitializeCulture()
        SelectUserLang()
    End Sub
    Public Shared Sub SelectUserLang()
        Dim language As String = "ar-EG"
        '   Session("Lang") = language
        'Detect User's Language.
        If GetLang() <> String.Empty Then
            'Set the Language.
            language = GetLang()
        End If


        'Set the Culture.
        Dim culture As New System.Globalization.CultureInfo(language) ' Egyptian Arabic" ar-EG"
        System.Threading.Thread.CurrentThread.CurrentCulture = culture
        System.Threading.Thread.CurrentThread.CurrentUICulture = culture
    End Sub

    Public Shared Function GetLang() As String
        Try
            If HttpContext.Current.Request.Cookies.Get("KianLang") IsNot Nothing Then
                Dim Lang As String = HttpContext.Current.Request.Cookies("KianLang")("Lang")
                Return Lang
            End If
            Return "ar-EG"
        Catch ex As Exception
            If HttpContext.Current.Request.Cookies.Get("KianLang") IsNot Nothing Then
                If HttpContext.Current.Request.Cookies.Get("KianLang").Value IsNot Nothing Then
                    Dim RememberMeCookies As New HttpCookie("KianLang")
                    RememberMeCookies.Expires = DateTime.Now.AddDays(-1D)
                    HttpContext.Current.Response.Cookies.Add(RememberMeCookies)
                End If
            End If
            Return "ar-EG"
        End Try
    End Function

    Public Shared Sub LangRedirect(ByVal lang As String)
        Dim PageURL As String = HttpContext.Current.Request.Url.ToString
        HttpContext.Current.Response.Redirect(PageURL)

    End Sub
End Class
