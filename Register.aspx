<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>كـيـان الــدره</title>
    <link rel="icon" type="image/png" href="images/favicons/favicon-32x32.png" />
    <link href="fontawesome-6.1.0/css/all.min.css" rel="stylesheet" />
    <link href="css/ar/above.min.css" rel="stylesheet" />
    <link href="css/ar/bottom.min.css" rel="stylesheet" />
    <link href="css/ar/arabo.min.css" rel="stylesheet" />
    <link href="css/ar/login-css.css" rel="stylesheet" />
</head>
<body>
    <form id="mainFRM" runat="server" autocomplete="off" enctype="multipart/form-data">
        <asp:ToolkitScriptManager ID="TKSM" runat="server" ScriptMode="Release">
            <Services>
                <asp:ServiceReference Path="~/WebService.asmx" />
            </Services>
        </asp:ToolkitScriptManager>
        <section class="main-container-form" style="display: flex; background-image: url(images/Cover.jpg); background-size: cover; min-height: 100vh;">
            <div class="grid-container justify-content-center align-items-center">
                <div class="grid-x grid-padding-x justify-content-center align-items-center">
                    <asp:UpdatePanel runat="server" ID="UP" ClientIDMode="AutoID">
                        <ContentTemplate>
                            <asp:UpdateProgress ID="upg" runat="server" AssociatedUpdatePanelID="up">
                                <ProgressTemplate>
                                    <div class="preloader loader">
                                        <div class="preloader_image"></div>
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>

                            <div class="login-form">
                                <asp:Label Text="" ID="lblRes" runat="server" />
                                <div class="form-title margin-bottom-3">
                                    <div class="top-bar margin-bottom-1">
                                        <a href="Home.aspx">
                                            <h1 class="logo-header logo-large margin-0">كـيـان الــدره</h1>
                                            <%--<img src="/images/logo-archiproducts.png" srcset="/images/logo-archiproducts@2x.png" alt="Archiproducts Logo" width="200" height="35" class="logo">--%>
                                        </a>
                                    </div>
                                    <h2>إنشاء حساب جديد</h2>
                                    <asp:ValidationSummary CssClass="ValidationSummary" ID="vsUsers" DisplayMode="BulletList" ValidationGroup="vUser" EnableClientScript="true" runat="server" />
                                    <asp:UpdateProgress ID="upgg" runat="server" AssociatedUpdatePanelID="UP">
                                        <ProgressTemplate>
                                            <div class="spinner">
                                                <div class="spinner-border text-primary" role="status">
                                                    <span class="sr-only">Loading...</span>
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                                <div class="mt-3">
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtName" runat="server" MaxLength="100"></asp:TextBox>
                                        <label>الاسم او اللقب *</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="vUser" ControlToValidate="txtName"
                                            ErrorMessage="Please Enter Your txtName" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtUsername" runat="server" MaxLength="100"></asp:TextBox>
                                        <label>البريد الالكتروني *</label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtUsername"
                                            CssClass="valid-inp" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                            Display="Dynamic" ErrorMessage="Invalid Email" ValidationGroup="vUser" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="vUser" ControlToValidate="txtUsername"
                                            ErrorMessage="Please Enter Your Email" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                                        <label>كلمة المرور *</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="vUser" ControlToValidate="txtPassword"
                                            ErrorMessage="Please Enter Your Password" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ControlToCompare="txtPassword" Display="Dynamic"
                                            ValidationGroup="vUser" ControlToValidate="txtConfirmPassword"
                                            CssClass="valid-inp" runat="server" ErrorMessage="Passwords Not Matched!"></asp:CompareValidator>
                                    </div>
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                                        <label>تأكيد كلمة المرور *</label>
                                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" ValidationGroup="vUser" Text="Confirm Password" ControlToValidate="txtConfirmPassword"
                                            runat="server" ErrorMessage="Confirm Password" Display="Dynamic" CssClass="valid-inp"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-12 col-xs-12 col-sm-12 p-0 margin-bottom-1">
                                        <asp:Button ID="btnLogin" runat="server" CssClass="button small success expanded" Text="إنشاء حساب جديد" ValidationGroup="vUser"
                                            UseSubmitBehavior="false" />
                                    </div>
                                    <div class="form-group">
                                        <p class="or-seperator">هل لديك حساب ؟<a href="Login.aspx"> تسجيل الدخول</a></p>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </section>
    </form>
</body>
<script src="js/jquery-min.js"></script>
<script src="jsCode/Main.js"></script>
</html>
