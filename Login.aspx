<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

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
                                <asp:MultiView ID="mv" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="vwLogin" runat="server">
                                        <div class="form-title margin-bottom-3">
                                            <div class="top-bar margin-bottom-2">
                                                <a href="Home.aspx">
                                                    <h1 class="logo-header logo-large margin-0">كـيـان الــدره</h1>
                                                    <%--<img src="/images/logo-archiproducts.png" srcset="/images/logo-archiproducts@2x.png" alt="Archiproducts Logo" width="200" height="35" class="logo">--%>
                                                </a>
                                            </div>
                                            <h2>تسجيل الدخول</h2>
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
                                            </div>
                                            <div class="col-md-12 col-xs-12 col-sm-12 p-0 margin-bottom-1">
                                                <asp:Button ID="btnLogin" runat="server" CssClass="button small success expanded" Text="تسجيل الدخول" ValidationGroup="vUser"
                                                    UseSubmitBehavior="false" />
                                            </div>
                                            <div class="checkbox-custom margin-bottom-2">
                                                <asp:CheckBox ID="chkKeepMeLoggedIn" runat="server" Text="البقاء متصلاً على هذا الجهاز" />
                                            </div>
                                            <div class="form-group">
                                                <asp:LinkButton ID="lbForgetPassword" runat="server" OnClick="switchview">هل نسيت كلمة المرور ؟</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="small-12  fb-permission ">
                                            <p class="login-with-fb"><i></i></p>
                                            <p class="or-seperator"><a href="Register.aspx">إنشاء حساب جديد ؟</a></p>
                                        </div>
                                    </asp:View>
                                    <asp:View ID="vwForgetPassword" runat="server">
                                        <div class="form-title margin-bottom-3">
                                            <div class="top-bar margin-bottom-2">
                                                <a href="Home.aspx">
                                                    <h1 class="logo-header logo-large margin-0">كـيـان الــدره</h1>
                                                    <%--<img src="/images/logo-archiproducts.png" srcset="/images/logo-archiproducts@2x.png" alt="Archiproducts Logo" width="200" height="35" class="logo">--%>
                                                </a>
                                            </div>

                                            <h3>إعادة ضبط كلمة المرور</h3>

                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="ForgetPassword" CssClass="ValidationSummary" />
                                        </div>
                                        <div class="mt-3">
                                            <div class="textfield margin-bottom-2">
                                                <asp:TextBox runat="server" ID="txtForgetEmail" spellcheck="false" ValidationGroup="ForgetPassword" AutoComplete="off" MaxLength="100" />
                                                <label>البريد الالكتروني *</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Text="*" ValidationGroup="ForgetPassword" ControlToValidate="txtForgetEmail" runat="server" ErrorMessage="Enter Email Address" Display="Dynamic" CssClass="valid-inp"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ValidationGroup="ForgetPassword" ID="RegularExpressionValidator1" runat="server" CssClass="valid-inp" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtForgetEmail" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="row">
                                                    <div class="col-md-6 pl-0 margin-bottom-1">
                                                        <asp:Button ID="lbSend" runat="server" ValidationGroup="ForgetPassword"
                                                            Text="ارسال" UseSubmitBehavior="false" OnClientClick="SaveClick(this,'ForgetPassword');"
                                                            CssClass="button small success expanded"></asp:Button>

                                                    </div>
                                                    <div class="col-md-6 pr-0" id="liCancel" runat="server">
                                                        <asp:LinkButton ID="lbCancel" runat="server" CssClass="button small shop expanded" OnClick="switchview"><span>عودة الى تسجيل الدخول</span></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:View>
                                </asp:MultiView>
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
