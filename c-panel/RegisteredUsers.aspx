<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RegisteredUsers.aspx.vb" Inherits="RegisteredUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>المستخدمين</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="../images/favicons/favicon-32x32.png">
    <!-- Resource style -->
    <link rel="stylesheet" href="css/c-scroll.css" />
    <link rel="stylesheet" href="css/multifile-up.css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Poppins:300,400,500,600,700,800|Roboto:300,400,500,700,900" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="fontawsome-5.4.1/css/all.min.css" rel="stylesheet" />
    <link href="css/modal_chunk.css" rel="stylesheet" />
    <link href="css/chunk.css" rel="stylesheet" />

    <!-- Resource script -->
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/respond.js" type="text/javascript"></script>
    <script src="js/matchmedia.polyfill.js" type="text/javascript"></script>
    <script src="js/sidebar-nav.min.js" type="text/javascript"></script>
    <script src="JSCode/KeypressValidators.js"></script>
    <script src="JSCode/Popup.js"></script>
    <script src="JSCode/UploadPhotoSlider.js"></script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" autocomplete="off">
        <asp:ToolkitScriptManager ID="Toolkitscriptmanager1" runat="server" ScriptMode="Release">
            <Services>
                <asp:ServiceReference Path="~/WebService.asmx" />
            </Services>
        </asp:ToolkitScriptManager>

        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <!--============================ Page-header =============================-->
                <div class="page-header pb-2 mb-4">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="page-header-title">
                                    <h5 class="m-b-10">المستخدمين</h5>
                                </div>
                                <div class="d-flex">
                                    <ul class="breadcrumb flex-1 bg-unset p-0 m-0">
                                        <li class="breadcrumb-item"><a href="Items.aspx"><i class="fa fa-home"></i></a></li>
                                        <li class="breadcrumb-item">المستخدمين</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--============================ Page-content =============================-->
                <div class="page-load">
                    <asp:UpdateProgress ID="upg" runat="server" AssociatedUpdatePanelID="up">
                        <ProgressTemplate>
                            <div class="d-flex justify-content-center align-items-center h-100">
                                <div class="spinner-border text-success" role="status">
                                    <span class="sr-only">جاري التحميل...</span>
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>

                <div class="col-md-12 p-0">
                    <asp:Label ID="lblRes" runat="server" Visible="false"></asp:Label>
                </div>

                <div class="card m-0">
                    <asp:Panel ID="pnlOps" runat="server">
                        <div class="card-body pb-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Panel ID="pgPanel" CssClass="input-in" runat="server">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">النتائج لكل صفحة</span>
                                            </div>
                                            <asp:DropDownList runat="server" CssClass="form-control ltr" ID="ddlPager" AutoPostBack="true" OnSelectedIndexChanged="PageSize_Changed">
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="25">25</asp:ListItem>
                                                <asp:ListItem Value="50">50</asp:ListItem>
                                                <asp:ListItem Value="100">100</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </asp:Panel>
                                </div>

                                <div class="col-md-6 text-right">

                                    <div class="input-in col-md-6">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" type="text" placeholder="البحث حسب العنوان" AutoPostBack="true" OnTextChanged="FillGrid" onkeypress="return isString(event);" onkeyup="ValidateChars(this);ShowHideClearSearch(this.value);" ToolTip="البحث حسب العنوان"></asp:TextBox>

                                            <asp:LinkButton runat="server" ID="cmdClear" CssClass="clear-search" title="مسح" OnClientClick="$('#txtSearch').val('');">&times;</asp:LinkButton>
                                            <asp:Button ID="btnSearch" runat="server" Style="display: none" ClientIDMode="Static" OnClick="FillGrid" />
                                            <span class="input-group-append">
                                                <asp:LinkButton ID="cmdSearch" runat="server" CssClass="btn btn-primary" type="button" OnClick="FillGrid"><i class="fa-search fa"></i></asp:LinkButton>
                                            </span>
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlGV" runat="server">
                        <div class="card-body">
                            <div class="p-lr-3">
                                <div class="table-responsive">
                                    <asp:HiddenField ID="SortExpression" runat="server" />
                                    <asp:GridView ID="gvUsers" CssClass="table table-striped table-bordered table-hover"
                                        runat="server" AutoGenerateColumns="false" AllowSorting="true" OnPageIndexChanging="gvUsers_PageIndexChanging"
                                        AllowPaging="true" PageSize='<%# ddlPager.SelectedValue  %>' OnSorting="gv_Sorting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="الرقم">
                                                <ItemTemplate>
                                                     <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="الاسم" SortExpression="FullName" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Visible="false" Text='<%# Eval("Id")%>'></asp:Label>
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("FullName")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="اسم المستخدم" SortExpression="Username" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("Username")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="الهاتف" SortExpression="Mobile" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="تاريخ التعديل" SortExpression="ModifiedDate" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblModifiedDate" runat="server" Text='<%# Eval("ModifiedDate")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="نشط" SortExpression="Active" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <div class="checkbox">
                                                        <asp:CheckBox ID="chkActive" runat="server" Text=" " Checked='<%# PublicFunctions.BoolFormat(Eval("Active").ToString)%>' AutoPostBack="true" OnCheckedChanged="UpdateActive"></asp:CheckBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                        <EmptyDataTemplate>
                                            <div class="text-center">
                                                لا توجد بيانات
                                            </div>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>


                </div>


            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
