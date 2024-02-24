<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%=Resources.Resource.KayanAlDorra%></title>
    <link rel="icon" type="image/png" href="images/favicons/favicon-32x32.png" />
    <link href="fontawesome-6.1.0/css/all.min.css" rel="stylesheet" />
    <link href="<%= Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/above.min.css") %>" rel="stylesheet" />
    <link href="<%= Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/bottom.min.css") %>" rel="stylesheet" />
    <link href="<%= Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/custom.min.css") %>" rel="stylesheet" />
    <link href="<%= Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/login-css.css") %>" rel="stylesheet" />
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
                                <div class="form-title margin-bottom-2">
                                    <div class="top-bar margin-bottom-1">
                                        <a href="Home.aspx" style="outline: unset;">
                                            <h1 class="logo-header logo-large margin-0"><%=Resources.Resource.KayanAlDorra%></h1>
                                            <%--<img src="/images/logo-archiproducts.png" srcset="/images/logo-archiproducts@2x.png" alt="Archiproducts Logo" width="200" height="35" class="logo">--%>
                                        </a>
                                    </div>
                                    <h2>
                                        <asp:Label ID="lblTitle" Text="<%$Resources:Resource, SignUp %>" runat="server" />
                                    </h2>
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
                                        <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                                        <label><%=Resources.Resource.NameOrTitle%> *</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="vUser" ControlToValidate="txtName"
                                            ErrorMessage="Please Enter Your Name" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8"
                                            ControlToValidate="txtName" runat="server" CssClass="valid-inp"
                                            ErrorMessage="Invalid Name" ValidationGroup="vUser" Display="Dynamic"
                                            ValidationExpression="^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_ ]*$" />
                                        <%--<asp:FilteredTextBoxExtender TargetControlID="txtName"
                                            runat="server"  FilterType="Custom"  ValidChars="[a-zA-Zا-ي\s]+"></asp:FilteredTextBoxExtender>--%>
                                    </div>
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="100"></asp:TextBox>
                                        <label><%=Resources.Resource.Email%> *</label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmail"
                                            CssClass="valid-inp" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                            Display="Dynamic" ErrorMessage="Invalid Email" ValidationGroup="vUser" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="vUser" ControlToValidate="txtEmail"
                                            ErrorMessage="Please Enter Your Email" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="50"></asp:TextBox>
                                        <label><%=Resources.Resource.Mobile%> *</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vUser"
                                            Text="أدخل رقم الموبايل" ControlToValidate="txtMobile"
                                            runat="server" ErrorMessage="أدخل رقم الموبايل" Display="Dynamic"
                                            CssClass="valid-inp"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender runat="server" ID="fmobile" TargetControlID="txtMobile"
                                            FilterType="Numbers">
                                        </asp:FilteredTextBoxExtender>
                                    </div>
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                                        <label><%=Resources.Resource.Password%> *</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="vUser" ControlToValidate="txtPassword"
                                            ErrorMessage="Please Enter Your Password" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ControlToCompare="txtPassword" Display="Dynamic"
                                            ValidationGroup="vUser" ControlToValidate="txtConfirmPassword"
                                            CssClass="valid-inp" runat="server" ErrorMessage="Passwords Not Matched!"></asp:CompareValidator>
                                    </div>
                                    <div class="textfield margin-bottom-2">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                                        <label><%=Resources.Resource.ConfirmPassword%> *</label>
                                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" ValidationGroup="vUser" Text="Confirm Password" ControlToValidate="txtConfirmPassword"
                                            runat="server" ErrorMessage="Confirm Password" Display="Dynamic" CssClass="valid-inp"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-12 col-xs-12 col-sm-12 p-0 margin-bottom-1">
                                        <asp:Button ID="btnRegister" runat="server" CssClass="button small success expanded margin-bottom-1"
                                            Text="<%$Resources:Resource, SignUp %>" ValidationGroup="vUser" CommandArgument="Add"
                                            UseSubmitBehavior="false" OnClick="Register" />
                                        <a href="Home.aspx" class="button small shop expanded"><%=Resources.Resource.Cancel%></a>
                                        
                                    </div>
                                    <div class="form-group" runat="server" id="pnlLogin">
                                        <p class="or-seperator"><%=Resources.Resource.DoYouHaveAnAccount%><a href="Login.aspx"> <%=Resources.Resource.SignIn%></a></p>
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
