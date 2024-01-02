
#Region "Imports"

Imports Microsoft.VisualBasic
Imports BusinessLayer.BusinessLayer
Imports System.Net.Mail
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Net

#End Region

Public Class clsEmails

#Region "Class Attributes"

    Private Shared CompanyName As String = "Kayan ElDora"
    Public Shared CompanyEmail As String = "kayaneldora@gmail.com"
    Private Shared EmailPassword As String = "Kayan@2020"
    Private Shared CompanyPassword As String = "plbiypjayknsghvw"

#End Region

#Region "Class Methods"


    ''' <summary>
    ''' Send Notification Email
    ''' </summary>
    Shared Function SendEmail(ByVal MailSubject As String, ByVal MailTo As String, ByVal MailBody As String, ByVal MailHTMLBody As Boolean, Optional BccMail As String = "") As Boolean
        Try
            'Return True

            Dim strFrom = CompanyEmail
            Dim MailMsg As New MailMessage(New MailAddress(CompanyEmail), New MailAddress(MailTo))
            MailMsg.BodyEncoding = Encoding.Default
            MailMsg.Subject = MailSubject
            MailMsg.Body = MailBody
            MailMsg.Priority = MailPriority.High
            MailMsg.IsBodyHtml = MailHTMLBody
            'Smtpclient to send the mail message 

            Dim SmtpMail As New SmtpClient
            Dim basicAuthenticationInfo As New System.Net.NetworkCredential(CompanyEmail, CompanyPassword)

            SmtpMail.Host = "smtp.gmail.com"
            SmtpMail.UseDefaultCredentials = False
            SmtpMail.Credentials = basicAuthenticationInfo
            SmtpMail.Port = 587 '    //alternative port number Is 8889
            SmtpMail.EnableSsl = True

            SmtpMail.Send(MailMsg)
            Return True
        Catch ex As Exception

            Return False
        End Try
    End Function



    Shared Function GetBody(ByVal CustomContent As String, ByVal CustomTitle As String) As String
        Try
            Dim sb As String
            sb = "<!DOCTYPE html>" &
"<html>" &
"<head>" &
"    <meta charset=""utf-8"" />" &
"    <title></title>" &
"    <link rel=""icon"" href=""" + PublicFunctions.ServerURL + "img/favicon-light.ico"">" &
"    <style>" &
"        .mobile-only," &
"        .mobile-table {" &
"            display: none;" &
"            visibility: hidden;" &
"        }" &
"        .desktop-only {" &
"            display: block;" &
"            visibility: visible;" &
"        }" &
"        .desktop-table {" &
"            display: table;" &
"            visibility: visible;" &
"        }" &
"    </style>" &
"</head>" &
"<body>" &
"    <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""min-width: 100%; "" class=""stylingblock-content-wrapper"">" &
"        <tbody>" &
"            <tr>" &
"                <td class=""stylingblock-content-wrapper camarker-inner"">" &
"                    <div data-marker=""wrapper"" style="""" class=""stylingblock-content-wrapper"">" &
"                        <!-- Email Header : BEGIN -->" &
"                        <table aria-hidden=""true"" role=""presentation"" style=""max-width: 842px;"" align=""center"" width=""100%"" cellspacing=""0"" cellpadding=""0"" border=""0"" bgcolor=""#ffffff"">" &
"                            <tbody>" &
"                                <tr>" &
"                                    <td>" &
"                                        <!--[if mso]>       <table role=""presentation"" aria-hidden=""true"" cellspacing=""0"" cellpadding=""0"" border=""0"" width=""642"" align=""center"">       <tr>       <td>       <![endif]-->" &
"                                        <table aria-hidden=""true"" role=""presentation"" style=""margin: 0 auto;border: 1px solid #323031;border-bottom: 0;"" align=""center"" width=""100%"" cellspacing=""0"" cellpadding=""0"" border=""0"" bgcolor=""#fff"">" &
"                                            <tbody>" &
"                                                <tr>" &
"                                                    <td style=""height: 60px;"">" &
"                                                        <table aria-hidden=""true"" role=""presimgentation"" align=""center"" width=""100%"" cellspacing=""0"" cellpadding=""0"" border=""0"">" &
"                                                            <tbody>" &
"                                                                <tr>" &
"                                                                    <td style=""text-align: left; vertical-align: middle; font-size: 20px; font-family: HelveticaNeue-Light, Helvetica Neue Light, Helvetica, Arial, sans-serif; font-weight: 300; color: #ffffff; height: 60px;"">" &
"                                                                        <a href=""#"" style=""color: #ffffff;"" target=""_blank"">" &
"                                                                            <img src=""" + PublicFunctions.ServerURL + "img/logo-dark-01.png"" style=""display: block; height: 100px; width: auto; border: medium none; outline: medium none currentcolor; font-size: 20px; font-family: HelveticaNeue-Light, Helvetica Neue Light, Helvetica, Arial, sans-serif; font-weight: 300; text-align: center;"" title=""Emirates"" width=""auto"" height=""60"">" &
"                                                                        </a>" &
"                                                                    </td>" &
"                                                                    <td style=""padding: 0 20px 0 0; text-align: right; vertical-align: middle; font-size: 12px; font-family: HelveticaNeue-Light, Helvetica Neue Light, Helvetica, Arial, sans-serif; color: #ffffff; height: 60px;"" valign=""middle""></td>" &
"                                                                </tr>" &
"                                                            </tbody>" &
"                                                        </table>" &
"                                                    </td>" &
"                                                </tr>" &
"                                            </tbody>" &
"                                        </table><!--[if mso]>       </td>       </tr>       </table>       <![endif]-->" &
"                                    </td>" &
"                                </tr>" &
"                            </tbody>" &
"                        </table><!-- Email Header : END -->" &
"                    </div>" &
"                    <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""min-width: 100%; "" class=""stylingblock-content-wrapper"">" &
"                        <tbody>" &
"                            <tr>" &
"                                <td class=""stylingblock-content-wrapper camarker-inner"">" &
"                                    <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""min-width: 100%; "" class=""stylingblock-content-wrapper"">" &
"                                        <tbody>" &
"                                            <tr>" &
"                                                <td class=""stylingblock-content-wrapper camarker-inner"">" &
"                                                    <table align=""center"" aria-hidden=""true"" bgcolor=""#ffffff"" border=""0"" cellpadding=""0"" cellspacing=""0"" role=""presentation"" style=""max-width: 842px;"" width=""100%"">" &
"                                                        <tbody>" &
"                                                            <tr>" &
"                                                                <td align=""center"" style=""background-color: #ffffff;"" valign=""top"">" &
"                                                                    <table align=""center"" aria-hidden=""true"" border=""0"" cellpadding=""0"" cellspacing=""0"" role=""presentation"" style=""max-width: 842px;border: 1px solid #323031;border-bottom: 0;border-top: 0;"" width=""100%"">" &
"                                                                        <tbody>" &
"                                                                            <tr>" &
"                                                                                <td align=""center"" style=""padding-left: 10px; padding-right: 10px;"" valign=""top"">" &
"                                                                                    <!--[if mso]>           <table role=""presentation"" aria-hidden=""true"" cellspacing=""0"" cellpadding=""0"" border=""0"" width=""602"" align=""center"">          <tr>           <td>           <![endif]--><table align=""center"" aria-hidden=""true"" border=""0"" cellpadding=""0"" cellspacing=""0"" role=""presentation"" style=""max-width: 750px; margin: 0 auto;"" width=""100%"">" &
"                                                                                        <tbody>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" height=""20"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" height=""10"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""center"" style=""font-family: HelveticaNeue-Light, Helvetica Neue Light, Helvetica, Arial, sans-serif; font-weight: 300; font-size: 36px; line-height: 40px; color: #333333; text-align: center;"" valign=""top"">" &
"                                                                                                    " & CustomTitle & "" &
"                                                                                                </td>" &
"                                                                                            </tr>" &
"                                                                                            <tr>" &
"                                                                                                <td align=""left"" height=""30"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr><tr><td>" & CustomContent & "</td></tr>                                                                                            <tr>" &
"                                                                                                <tr><td align=""left"" height=""30"" style=""font-size:0%; line-height:100%;"" valign=""top""></td>" &
"                                                                                            </tr>" &
"                                                                                        </tbody>" &
"                                                                                    </table><!--[if mso]>           </td>           </tr>           </table>           <![endif]-->" &
"                                                                                </td>" &
"                                                                            </tr>" &
"                                                                        </tbody>" &
"                                                                    </table><!--[if gte mso 9]>        </v:textbox>        </v:rect>       <![endif]-->" &
"                                                                </td>" &
"                                                            </tr>" &
"                                                        </tbody>" &
"                                                    </table>" &
"                                                </td>" &
"                                            </tr>" &
"                                        </tbody>" &
"                                    </table>" &
"                                </td>" &
"                            </tr>" &
"                        </tbody>" &
"                    </table>" &
"                    <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""min-width: 100%; "" class=""stylingblock-content-wrapper"">" &
"                        <tbody>" &
"                            <tr>" &
"                                <td class=""stylingblock-content-wrapper camarker-inner"">" &
"                                    <!--/* RUNNING THE ENCRYPTION*/-->" &
"                                    " &
"                                    <!--End of Encryption-->" &
"                                    <div data-marker=""wrapper"" style="""" class=""stylingblock-content-wrapper"">" &
"                                        <!-- Email Footer : BEGIN -->" &
"                                        <table aria-hidden=""true"" role=""presentation"" style=""max-width: 842px; margin: 0 auto;border-top: 6px solid #a76359;"" width=""100%"" cellspacing=""0"" cellpadding=""0"" border=""0"" bgcolor=""#323031"" align=""center"">" &
"                                            <tbody>" &
"                                                <tr>" &
"                                                    <td align=""center"" width=""280px"" style=""font-family: HelveticaNeue-Bold, Helvetica Neue Bold, Helvetica, Arial, sans-serif; font-size: 12px; color: #ffffff; padding: 0 10px; height: 110px; vertical-align: middle;"">" &
"                                                        <strong style=""font-weight:700;padding-bottom:10px;"">Contact : </strong>" &
"                                                        +971 4 353 5761 EXT.113" &
"                                                    </td>" &
"                                                    <td align=""center"" width=""280px"" style=""font-family: HelveticaNeue-Bold, Helvetica Neue Bold, Helvetica, Arial, sans-serif; font-size: 12px; color: #ffffff; padding: 0 10px; height: 110px; vertical-align: middle;"">" &
"                                                        <strong style=""font-weight:700;padding-bottom:10px;"">Email To : </strong>" &
"                                                        Info@WeSynape.ae" &
"                                                    </td>" &
"                                                    <td align=""center"" width=""280px"" style=""font-family: HelveticaNeue-Bold, Helvetica Neue Bold, Helvetica, Arial, sans-serif; font-size: 12px; color: #ffffff; padding: 0 10px; height: 110px; vertical-align: middle;"">" &
"                                                        <strong style=""font-weight:700;padding-bottom:10px;"">Website : </strong>" &
"                                                        www.WeSynape.ae" &
"                                                    </td>" &
"                                                </tr>" &
"                                            </tbody>" &
"                                        </table>" &
"                                        <table aria-hidden=""true"" role=""presentation"" style=""max-width: 842px; margin: 0 auto;border-top: 1px solid #ffffff33;"" width=""100%"" cellspacing=""0"" cellpadding=""0"" border=""0"" bgcolor=""#323031"" align=""center"">" &
"                                            <tbody>" &
"                                                <tr>" &
"                                                    <td class=""copyright"" style=""font-family: HelveticaNeue-Bold, Helvetica Neue Bold, Helvetica, Arial, sans-serif; font-size: 12px; color: #ffffff; padding: 0 10px; height: 30px; vertical-align: middle;text-align:center;"" valign=""middle"" height=""30"">" &
"                                                        <span style=""display: block; min-width: 160px;"">" &
"                                                            Copyrights © 2019&nbsp; WeSynape. <br class=""mobile-only"">" &
"                                                            All rights reserved." &
"                                                        </span>" &
"                                                    </td>" &
"                                                </tr>" &
"                                            </tbody>" &
"                                        </table><!--[if mso]>       </td>       </tr>       </table>       <![endif]-->" &
"                                    </div>" &
"                                </td>" &
"                            </tr>" &
"                        </tbody>" &
"                    </table><!-- Email Footer : END -->" &
"                    </div>" &
"                </td>" &
"            </tr>" &
"        </tbody>" &
"    </table>" &
"    </td>" &
"    </tr>" &
"    </tbody>" &
"    </table>" &
"</body>" &
"</html>"
            Return sb
        Catch ex As Exception
            Return String.Empty
        End Try
    End Function

#End Region

#Region "Register and Profile"
    ''' <summary>
    ''' Send Registration Confirm Email to Verify the Email Address
    ''' </summary>
    Shared Function SendConfirmationEmail(dtUser As TblUsers) As Boolean
        Try
            Return True
            Dim sb As String = "<a href='" & PublicFunctions.ServerURL() & "EmailConfirmation.aspx?Email=" & PublicFunctions.Encrypt(dtUser.Username.ToString) & "&VerificationCode=" & PublicFunctions.Encrypt(dtUser.EmailVerificationCode.ToString) & "' target='_blank' title='Confirm Your Email'>Confirm Your Email</a>"


            Return clsEmails.SendEmail("Kayan Registration", dtUser.Username, sb, True, "ahmed_dl_90@yahoo.com")

        Catch ex As Exception
            Throw ex
            Return False
        End Try
    End Function
#End Region


End Class