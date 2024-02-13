<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Items.aspx.vb" Inherits="Items" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="UserControls/HTMLEditor.ascx" TagPrefix="uc1" TagName="HTMLEditor" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-127036454-3"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-127036454-3');
    </script>

    <title>Items</title>
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="~/images/favicons/favicon-32x32.png" />
    <!-- Resource style -->
    <link rel="stylesheet" href="css/c-scroll.css" />
    <link rel="stylesheet" href="css/multifile-up.css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Poppins:300,400,500,600,700,800|Roboto:300,400,500,700,900" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="fontawsome-5.4.1/css/all.min.css" rel="stylesheet" />
    <link href="css/modal_chunk.css" rel="stylesheet" />
    <link href="css/chunk.css" rel="stylesheet" />

    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/respond.js" type="text/javascript"></script>
    <script src="js/matchmedia.polyfill.js" type="text/javascript"></script>
    <script src="js/sidebar-nav.min.js" type="text/javascript"></script>
    <script src="JSCode/KeypressValidators.js"></script>
    <script src="JSCode/Popup.js"></script>
    <script src="JSCode/jsMultiFileUpload.js"></script>
    <script src="JSCode/Calculate.js"></script>
    <script src="JSCode/UploadItemBrochure.js"></script>
</head>

<body>
    <form id="form1" runat="server" enctype="multipart/form-data" autocomplete="off">
        <asp:ToolkitScriptManager ID="Toolkitscriptmanager1" runat="server" ScriptMode="Release">
            <Services>
                <asp:ServiceReference Path="~/WebService.asmx" />
                <asp:ServiceReference Path="~/wsMultiFileUpload.asmx" />
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
                                    <h5 class="m-b-10">Items</h5>
                                </div>
                                <div class="d-flex">
                                    <ul class="breadcrumb flex-1 bg-unset p-0 m-0">
                                        <li class="breadcrumb-item"><a href="Main.aspx"><i class="fa fa-home"></i></a></li>
                                        <li class="breadcrumb-item">Items</li>
                                    </ul>
                                    <asp:Panel ID="pnlConfirm" runat="server" Visible="false">
                                        <div class="input-in" runat="server" id="liSave">

                                            <%--<asp:Button ID="cmdSave" runat="server" SkinID="btn-save" ValidationGroup="vProduct" OnClick="Save" UseSubmitBehavior="false" OnClientClick="SaveClick(this,'vProduct');" Text="Save" />--%>
                                            <asp:Panel runat="server" ID="pnlSave">
                                                <a href="#" title="Save" class="btn btn-success" data-toggle="modal" data-placement="bottom" data-original-title="Save"
                                                    onclick="ShowConfirmPopup('mpConfirmSave','pnlConfirmExtenderSave');return false;">Save<i class="fa fa-check"></i></a>
                                                <asp:HiddenField ID="hfSave" runat="server" />
                                                <asp:ModalPopupExtender ID="mpConfirmSave" ClientIDMode="Static" runat="server" PopupControlID="pnlConfirmExtenderSave" TargetControlID="hfSave"
                                                    CancelControlID="lbNoSave" BackgroundCssClass="modalBackground">
                                                </asp:ModalPopupExtender>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlConfirmExtenderSave" runat="server" ClientIDMode="Static" CssClass="rodal rodal-fade-enter" align="center" Style="display: none">
                                                <div class="rodal-mask"></div>
                                                <div class="rodal-dialog rodal-slideUp-enter" style="width: 350px;">
                                                    <div class="card">
                                                        <div class="card-header p-2">
                                                            <h5 class="card-title border-0 m-0 p-0">Confirmation Message</h5>
                                                        </div>
                                                        <div class="body p-2">
                                                            <label>Are you sure you want to Save Item ?</label>
                                                        </div>
                                                        <div class="footer">
                                                            <div class="input-in">
                                                                <span class="frame-btn">
                                                                    <asp:Button ID="cmdSave" runat="server" CssClass="btn btn-success" ValidationGroup="vProduct" OnClick="Save" UseSubmitBehavior="false" OnClientClick="SaveClick(this,'vProduct');" Text="Save" />
                                                                    <label class="fa fa-check" for="cmdSave"></label>
                                                                </span>
                                                            </div>
                                                            <div class="input-in">
                                                                <asp:LinkButton ID="lbNoSave" runat="server" CssClass="btn btn-danger" OnClientClick="CloseConfirmPopup('mpConfirmSave');return false;">No<i class="fa fa-times"></i></asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="input-in">
                                            <asp:Panel runat="server" ID="pnlCancel">
                                                <a href="#" title="Cancel" class="btn btn-danger" data-toggle="modal" data-placement="bottom" data-original-title="Cancel"
                                                    onclick="ShowConfirmPopup('mpConfirmCancel','pnlConfirmExtenderCancel');return false;">Cancel<i class="fa fa-times"></i></a>
                                                <asp:HiddenField ID="hfCancel" runat="server" />
                                                <asp:ModalPopupExtender ID="mpConfirmCancel" ClientIDMode="Static" runat="server" PopupControlID="pnlConfirmExtenderCancel" TargetControlID="hfCancel"
                                                    CancelControlID="lbNoCancel" BackgroundCssClass="modalBackground">
                                                </asp:ModalPopupExtender>

                                            </asp:Panel>
                                            <asp:Panel ID="pnlConfirmExtenderCancel" runat="server" ClientIDMode="Static" CssClass="rodal rodal-fade-enter" align="center" Style="display: none">
                                                <div class="rodal-mask"></div>
                                                <div class="rodal-dialog rodal-slideUp-enter" style="width: 300px;">
                                                    <div class="card">
                                                        <div class="card-header p-2">
                                                            <h5 class="card-title border-0 m-0 p-0">Confirmation Message</h5>
                                                        </div>
                                                        <div class="body p-2">
                                                            <label>Are you sure you want to cancel ?</label>
                                                        </div>

                                                        <div class="footer">
                                                            <div class="input-in">
                                                                <asp:LinkButton ID="lbYesCancel" runat="server" CssClass="btn btn-success" OnClick="Cancel" CausesValidation="false">Yes<i class="fa fa-check"></i></asp:LinkButton>
                                                            </div>
                                                            <div class="input-in">
                                                                <asp:LinkButton ID="lbNoCancel" runat="server" CssClass="btn btn-danger" OnClientClick="CloseConfirmPopup('mpConfirmCancel');return false;">No<i class="fa fa-times"></i></asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </asp:Panel>
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
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>

                <div class="col-md-12 p-0">
                    <asp:Label ID="lblRes" runat="server" Visible="false"></asp:Label>
                    <asp:CompareValidator ValidationGroup="vgDate" ErrorMessage="Date From should be less than or equal Date To" CssClass="res-label-info" Style="display: inline;"
                        ControlToValidate="txtDateTo" ControlToCompare="txtDateFrom" Display="Dynamic" Type="Date" Operator="GreaterThanEqual" runat="server" />
                    <a href="#" id="hfCustomer" runat="server" onclick="OpenPopUpFromGv('Customers.aspx?Mode=Add');">Create new Customer</a>
                </div>

                <div class="card m-0">
                    <asp:Panel ID="pnlOps" runat="server">
                        <div class="card-body pb-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Panel ID="pgPanel" runat="server">
                                        <asp:Panel ID="pnlRows" runat="server" CssClass="input-in">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Max Results</span>
                                                </div>
                                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlRows" AutoPostBack="true" OnSelectedIndexChanged="FillGrid">
                                                    <asp:ListItem Value="top 10" Selected="True">10</asp:ListItem>
                                                    <asp:ListItem Value="top 50">50</asp:ListItem>
                                                    <asp:ListItem Value="top 100">100</asp:ListItem>
                                                    <asp:ListItem Value="top 200">200</asp:ListItem>
                                                    <asp:ListItem Value="top 500">500</asp:ListItem>
                                                    <asp:ListItem Value="top 1000">1000</asp:ListItem>
                                                    <asp:ListItem Value="">All</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </asp:Panel>
                                        <div class="input-in">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Entries / Page</span>
                                                </div>
                                                <asp:DropDownList runat="server" CssClass="form-control ltr" ID="ddlPager" OnSelectedIndexChanged="PageSize_Changed" AutoPostBack="true">
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="25">25</asp:ListItem>
                                                    <asp:ListItem Value="50">50</asp:ListItem>
                                                    <asp:ListItem Value="100">100</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <div class="col-md-6 text-right">
                                    <div class="input-in">
                                        <asp:LinkButton ID="cmdNew" CssClass="btn btn-primary" runat="server" OnClick="Add" ToolTip="New">New<i class="feather icon-plus"></i></asp:LinkButton>
                                    </div>

                                    <asp:Panel ID="pnlSearch" runat="server" CssClass="input-in col-md-6">
                                        <div class="input-group" id="search">
                                            <asp:TextBox ID="txtSearch" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Search by Name, Brand" OnTextChanged="FillGrid" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>
                                            <%--  <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" Enabled="True"
                                                                TargetControlID="txtSearch" ValidChars=" 0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM()-,|.:+">
                                                            </asp:FilteredTextBoxExtender>--%>
                                            <%--<asp:AutoCompleteExtender ID="AutoCompleteExtender5" runat="server" BehaviorID="aceSearch" FirstRowSelected="false"
                                                                EnableCaching="false" Enabled="True" MinimumPrefixLength="1" CompletionListCssClass="acl"
                                                                CompletionListItemCssClass="li" CompletionListHighlightedItemCssClass="li-hover"
                                                                ServiceMethod="getItems" ServicePath="~/WebService.asmx" TargetControlID="txtSearch"
                                                                CompletionInterval="500">
                                                            </asp:AutoCompleteExtender>--%>
                                            <asp:Button ID="btnSearch" runat="server" Style="display: none" ClientIDMode="Static" OnClick="FillGrid" />
                                            <asp:LinkButton runat="server" ID="cmdClear" CssClass="clear-search" title="Clear" OnClientClick="$('#txtSearch').val('');">&times;</asp:LinkButton>
                                            <span class="input-group-append">
                                                <asp:LinkButton ID="cmdSearch" CssClass="btn btn-primary" runat="server" CausesValidation="False" OnClick="FillGrid"><i class="feather icon-search"></i></asp:LinkButton>
                                            </span>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="row border-top mt-3 pt-2 mx-0">
                                <div class="col-md-8 px-0">
                                    <asp:Panel ID="Panel2" runat="server" CssClass="d-inline-block">
                                        <div class="input-in">
                                            <label class="form-label">Date From</label>
                                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control" MaxLength="10" onkeypress="return isDate(event);" ClientIDMode="Static"></asp:TextBox>
                                            <asp:CalendarExtender CssClass="custom-calendar" ID="CalendarExtender1" runat="server"
                                                Enabled="True" TargetControlID="txtDateFrom" DaysModeTitleFormat="dd/MM/yyyy"
                                                TodaysDateFormat="dd/MM/yyyy" Format="dd/MM/yyyy">
                                            </asp:CalendarExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="vgDate" runat="server"
                                                ErrorMessage="Invalid Date" ControlToValidate="txtDateFrom" Display="Dynamic"
                                                ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"
                                                CssClass="req_validator" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="input-in">
                                            <label class="form-label">Date To</label>
                                            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control" MaxLength="10" onkeypress="return isDate(event);" ClientIDMode="Static"></asp:TextBox>
                                            <asp:CalendarExtender CssClass="custom-calendar" ID="CalendarExtender2" runat="server"
                                                Enabled="True" TargetControlID="txtDateTo" DaysModeTitleFormat="dd/MM/yyyy"
                                                TodaysDateFormat="dd/MM/yyyy" Format="dd/MM/yyyy">
                                            </asp:CalendarExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="vgDate" runat="server"
                                                ErrorMessage="Invalid Date" ControlToValidate="txtDateTo" Display="Dynamic"
                                                ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"
                                                CssClass="req_validator" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                        </div>
                                    </asp:Panel>
                                    <div class="input-in">
                                        <asp:LinkButton ID="lbFilter" CssClass="btn btn-primary" runat="server" OnClick="FillGrid" ToolTip="Filter" ValidationGroup="vgDate">Filter<i class="feather icon-search"></i></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="col-md-4 text-right px-0">
                                    <div class="input-in">
                                        <label class="form-label d-block">&nbsp;</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="feather icon-list mr-2"></i>Results found</span>
                                            </div>
                                            <div class="form-control">
                                                <asp:Label ID="lblSelectedItemsCount" runat="server"></asp:Label>
                                            </div>
                                        </div>
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
                                    <asp:ListView ID="lvItems" runat="server" ClientIDMode="AutoID"
                                        OnPagePropertiesChanging="OnPagePropertiesChanging" OnSorting="lv_Sorting">
                                        <LayoutTemplate>
                                            <table id="itemPlaceholderContainer" runat="server" border="0" class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>No.</th>
                                                    <th class="upnDownArrow" id="Name">
                                                        <asp:LinkButton ID="lbName" CommandArgument="Name" CommandName="Sort" runat="server">Title</asp:LinkButton>
                                                    </th>
                                                    <th class="upnDownArrow" id="CategoryName">
                                                        <asp:LinkButton ID="lbCategory" CommandArgument="CategoryName" CommandName="Sort" runat="server">Category</asp:LinkButton>
                                                    </th>
                                                    <th class="upnDownArrow" id="SubCategoryName">
                                                        <asp:LinkButton ID="lbSubCategory" CommandArgument="SubCategoryName" CommandName="Sort" runat="server">Sub Category</asp:LinkButton>
                                                    </th>
                                                    <th class="upnDownArrow" id="BrandName">
                                                        <asp:LinkButton ID="lbBrand" CommandArgument="BrandName" CommandName="Sort" runat="server">Brand</asp:LinkButton>
                                                    </th>

                                                    <th class="upnDownArrow" id="CreatedDate">
                                                        <asp:LinkButton ID="lbCreatedDate" CommandArgument="CreatedDate" CommandName="Sort" runat="server">Listing Date</asp:LinkButton>
                                                    </th>
                                                    <th class="upnDownArrow" id="Active">
                                                        <asp:LinkButton ID="lbActive" CommandArgument="Active" CommandName="Sort" runat="server">Active</asp:LinkButton>
                                                    </th>

                                                    <th>Photos</th>
                                                    <th>Reports</th>
                                                    <th>Details</th>
                                                    <th>Preview</th>
                                                    <th id="EditHeader">Edit</th>
                                                    <th id="DeleteHeader">Delete</th>
                                                </tr>
                                                <tr id="itemPlaceholder">
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblSerialNo" Text='<%# Container.DataItemIndex + 1%>' runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblItemId" runat="server" Text='<%# Eval("Id")%>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryName")%>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubCategory" runat="server" Text='<%# Eval("SubCategoryName")%>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblBrand" runat="server" Text='<%# Eval("BrandName")%>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Eval("CreatedDate").ToString %>'></asp:Label>
                                                </td>
                                                <td id="Active" runat="server">
                                                    <div class="checkbox">
                                                        <asp:CheckBox ID="chkActive" runat="server" AutoPostBack="True" Text=" " Checked='<%# PublicFunctions.BoolFormat(Eval("Active").ToString)%>' OnCheckedChanged="UpdateActive" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:Image ID="ImgbigPhoto" CssClass="td-img img-thumbnail" Width="50px" Height="40px" runat="server" ImageUrl='<%# IIf(Eval("Photo").ToString <> String.Empty, Eval("Photo"), "~/Images/noimage.jpg")%>' Visible="false" />
                                                    <asp:LinkButton ID="lbShowImages" runat="server" CommandArgument='<%# Eval("ID")%>' OnClick="ViewPhotos">
                                                        <asp:Image ID="imgPhoto" CssClass="td-img img-thumbnail" Width="50px" Height="40px" runat="server" ImageUrl='<%# IIf(Eval("PhotoThumb").ToString <> String.Empty, Eval("PhotoThumb"), "~/Images/noimage.jpg")%>' />
                                                    </asp:LinkButton>
                                                </td>
                                                <td id="Reported" runat="server">
                                                    <asp:Panel ID="pnlReported" runat="server" Visible='<%#IIf(PublicFunctions.GetUserType(PublicFunctions.GetUserId).ToLower = "admin", "True", "False") %>'>
                                                        <a href="#" class="btn btn-primary" onclick='<%# String.Format("javascript:OpenPopUpFromGv(""ReportsFrm.aspx?ItemId={0}"");return false;", Eval("Id"))%>'><i class="feather icon-file"></i></a>
                                                    </asp:Panel>
                                                </td>
                                                <td>
                                                    <asp:Panel ID="pnlDetails" runat="server">
                                                        <asp:LinkButton ID="lbDetails" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>' OnClick="Details"
                                                            ToolTip="Details"><i class="feather icon-copy"></i> </asp:LinkButton>
                                                    </asp:Panel>
                                                </td>
                                                <td>
                                                    <asp:Panel ID="pnlPreview" runat="server">
                                                        <a class="btn btn-primary" href='<%# PublicFunctions.ServerURL + "Item/" + Eval("SKU") %>' target="_blank"><i class="feather icon-eye"></i></a>
                                                    </asp:Panel>
                                                </td>
                                                <td id="Edit" runat="server">
                                                    <asp:Panel ID="pnlEdit" runat="server">
                                                        <asp:LinkButton ID="lbEdit" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>' OnClick="Edit"
                                                            ToolTip="Edit"><i class="feather icon-edit"></i> </asp:LinkButton>
                                                    </asp:Panel>
                                                </td>
                                                <td id="Delete" runat="server">
                                                    <asp:Panel ID="pnlDelete" runat="server">
                                                        <a href="#" id="hrefDelete" title="Delete" class="btn btn-danger"
                                                            onclick="ShowConfirmPopup('<%# CType(Container, ListViewItem).FindControl("mpConfirmDelete").ClientID.ToString%>','<%# CType(Container, ListViewItem).FindControl("pnlConfirmExtenderDelete").ClientID.ToString%>');return false;">
                                                            <i class="feather icon-trash-2"></i>
                                                        </a>
                                                        <asp:HiddenField ID="hfDelete" runat="server" />
                                                        <asp:ModalPopupExtender ID="mpConfirmDelete" runat="server" PopupControlID="pnlConfirmExtenderDelete" TargetControlID="hfDelete"
                                                            CancelControlID="lbNoDelete" BackgroundCssClass="modalBackground">
                                                        </asp:ModalPopupExtender>
                                                        <asp:Panel ID="pnlConfirmExtenderDelete" runat="server" CssClass="rodal rodal-fade-enter" align="center" Style="display: none">
                                                            <div class="rodal-mask"></div>
                                                            <div class="rodal-dialog rodal-slideUp-enter" style="width: 300px;">
                                                                <div class="card">
                                                                    <div class="card-header p-2">
                                                                        <h5 class="card-title m-0">Confirmation Message</h5>
                                                                    </div>
                                                                    <div class="body p-2">
                                                                        <label>Are you sure you want to delete this record ?</label>
                                                                    </div>


                                                                    <div class="footer">
                                                                        <div class="input-in">
                                                                            <asp:LinkButton ID="lbYesDelete" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("Id") %>' OnClick="Delete">Yes<i class="ti-check"></i></asp:LinkButton>
                                                                            <%--OnClick="Delete"--%>
                                                                        </div>
                                                                        <div class="input-in">
                                                                            <asp:LinkButton ID="lbNoDelete" runat="server" CssClass="btn btn-danger" OnClientClick="CloseConfirmPopup('mpConfirmDelete');return false;">No<i class="ti-close"></i></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <table class="table table-striped table-bordered">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="text-center">
                                                                <span class="fa fa-exclamation"></span>&nbsp No Data Found
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                                    <div class="PagerStyle mt5 mb5 pagination-pg">
                                        <asp:DataPager ID="dpLvItems" runat="server" PagedControlID="lvItems" PageSize='<%# ddlPager.SelectedValue %>'>
                                            <Fields>
                                                <asp:NumericPagerField ButtonType="Button" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnlLastupdate"></asp:Panel>
                </div>

                <asp:HiddenField ID="Collapse1Status" runat="server" Value="collapse1"></asp:HiddenField>
                <asp:HiddenField ID="Collapse2Status" runat="server" Value="collapse2"></asp:HiddenField>
                <asp:HiddenField ID="Collapse3Status" runat="server" Value=""></asp:HiddenField>
                <asp:HiddenField ID="Collapse4Status" runat="server" Value=""></asp:HiddenField>
                <asp:Label ID="lblItemId" runat="server" Visible="false"></asp:Label>

                <asp:Panel ID="pnlForm" runat="server" Visible="false" CssClass="col-md-12 p-0">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="card m-0 h-100">
                                <div class="card-header">
                                    <h5 class="card-title">Details</h5>
                                </div>
                                <div class="card-body">
                                    <asp:ValidationSummary CssClass="validation-message" ID="ValidationSummary" DisplayMode="BulletList" ValidationGroup="vProduct" EnableClientScript="true" runat="server" Font-Size="Medium" ForeColor="#CC0000" />

                                    <div class="col-md-12">
                                        <div class="row">
                                            <asp:Panel ID="pnlCode" runat="server" CssClass="form-group col-md-3 input-in" Visible="false">
                                                <label class="form-label required">SKU</label>
                                                <asp:TextBox runat="server" ID="txtSKUCode" CssClass="form-control" MaxLength="30" AutoPostBack="true" OnTextChanged="CheckItemCode"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtSKUCode" ErrorMessage="Enter SKU Code"></asp:RequiredFieldValidator>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="True"
                                                    TargetControlID="txtSKUCode" ValidChars=" ,0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM()-">
                                                </asp:FilteredTextBoxExtender>
                                            </asp:Panel>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">Item Name</label>
                                                <asp:TextBox runat="server" ID="txtItemName" CssClass="form-control" MaxLength="300" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtItemName" ErrorMessage="Enter Item Name"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">Category</label>
                                                <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="SelectCategory"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="ddlCategory" InitialValue="0" ErrorMessage="Select Category"></asp:RequiredFieldValidator>

                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">Sub Category</label>
                                                <asp:DropDownList runat="server" ID="ddlSubCategory" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode" Enabled="false">
                                                    <asp:ListItem Text="-- Select --" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="ddlSubCategory" InitialValue="0" ErrorMessage="Select Sub Category"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">Brand</label>
                                                <asp:DropDownList runat="server" ID="ddlBrand" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="ddlBrand" InitialValue="0" ErrorMessage="Select Brand"></asp:RequiredFieldValidator>

                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label">Production Year</label>
                                                <asp:TextBox runat="server" ID="txtProdYear" CssClass="form-control" MaxLength="10" onkeypress="return isNumber(event);"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label">Designer</label>
                                                <asp:TextBox runat="server" ID="txtDesigner" CssClass="form-control" MaxLength="200"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label">Size</label>
                                                <asp:TextBox runat="server" ID="txtItemSize" CssClass="form-control" MaxLength="200"></asp:TextBox>
                                            </div>

                                            <asp:Panel ID="pnlItemStyle" runat="server" Visible="false">
                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label required">Color</label>
                                                    <asp:DropDownList runat="server" ID="ddlColors" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="valid-inp"
                                                        ValidationGroup="vProduct" ControlToValidate="ddlColors" InitialValue="0" ErrorMessage="Select Color"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label required">Material</label>
                                                    <asp:DropDownList runat="server" ID="ddlMaterial" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" CssClass="valid-inp"
                                                        ValidationGroup="vProduct" ControlToValidate="ddlMaterial" InitialValue="0" ErrorMessage="Select Collection"></asp:RequiredFieldValidator>

                                                </div>
                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label required">Style</label>
                                                    <asp:DropDownList runat="server" ID="ddlStyle" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" CssClass="valid-inp"
                                                        ValidationGroup="vProduct" ControlToValidate="ddlStyle" InitialValue="0" ErrorMessage="Select Collection"></asp:RequiredFieldValidator>

                                                </div>
                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label required">Collection</label>
                                                    <asp:DropDownList runat="server" ID="ddlCollection" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" CssClass="valid-inp"
                                                        ValidationGroup="vProduct" ControlToValidate="ddlCollection" InitialValue="0" ErrorMessage="Select Collection"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label">Returnable</label>
                                                    <asp:RadioButtonList ID="rblReturnable" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="2">
                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>

                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label required">Quantity</label>
                                                    <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" MaxLength="8" onkeypress="return isNumber(event);"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="valid-inp"
                                                        ValidationGroup="vProduct" ControlToValidate="txtQuantity" ErrorMessage="Enter Quantity"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label">Item Rating</label>
                                                    <asp:TextBox runat="server" ID="txtRating" CssClass="form-control" MaxLength="4" onkeyup="return isRating(this);" onkeypress="return isDecimal(event,this);" placeholder="enter value from 1 to 5"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-3 input-in" id="divYouTube" runat="server" visible="false">
                                                    <label class="form-label">Youtube URL</label>
                                                    <asp:TextBox runat="server" ID="txtYoutubeURL" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </asp:Panel>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label">Active</label>
                                                <asp:RadioButtonList ID="rblActive" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="2">
                                                    <asp:ListItem Value="True">On</asp:ListItem>
                                                    <asp:ListItem Value="False" Selected="True">Off</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label">Hot</label>
                                                <asp:RadioButtonList ID="rblHot" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="2">
                                                    <asp:ListItem Value="True">On</asp:ListItem>
                                                    <asp:ListItem Value="False" Selected="True">Off</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">Price</label>
                                                <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtPrice" ErrorMessage="Enter Price"></asp:RequiredFieldValidator>
                                            </div>

                                            <asp:Panel ID="pnlRelated" runat="server" Visible="false">
                                                <div class="form-group col-md-3 input-in">
                                                    <label class="form-label">Related Items Keywords</label>
                                                    <asp:TextBox ID="txtKeywords" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Please enter keywords for related items"></asp:TextBox>
                                                    <asp:Button ID="btnAutoFill" SkinID="btn-fill-keywords" runat="server" Text="Fill Keywords" OnClick="FillKeywords" />
                                                    <asp:Button ID="btnClearKeywords" SkinID="btn-clear-keywords" runat="server" Text="Clear Keywords" OnClientClick="$('#txtKeywords').val('')" />
                                                </div>
                                                <asp:Panel ID="pnlRelatedItems" runat="server" Visible="false">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:ListView ID="lvRelatedItems" runat="server" ClientIDMode="AutoID">
                                                                <LayoutTemplate>
                                                                    <div class="w-body-tbllayer">
                                                                        <div class="table-responsive">
                                                                            <table id="itemPlaceholderContainer" runat="server" border="0" class="table mt2 table-responsive table-condensed">
                                                                                <tr>
                                                                                    <th>SKU</th>
                                                                                    <th>Name</th>
                                                                                    <th>Color</th>
                                                                                    <th>Size</th>
                                                                                    <th>Quantity</th>
                                                                                    <th>Cost</th>
                                                                                    <th>Price</th>
                                                                                    <th>Created On</th>
                                                                                    <th>Active</th>
                                                                                    <th>Hot</th>
                                                                                    <th>Photos</th>
                                                                                </tr>
                                                                                <tr id="itemPlaceholder">
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </LayoutTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblItemId" runat="server" Text='<%# Eval("Id")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblItemCode" runat="server" Text='<%# Eval("SupplierCode")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblSKU" runat="server" Text='<%# Eval("Code")%>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblColor" runat="server" Text='<%# PublicFunctions.GetLockupValue(Eval("Color"))%>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblSize" runat="server" Text='<%# PublicFunctions.GetLockupValue(Eval("Size"))%>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblQunatity" runat="server" Text='<%# PublicFunctions.IntFormat(Eval("Quantity").ToString)%>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblSupplierPrice" runat="server" Text='<%# PublicFunctions.DecimalFormat(Eval("SupplierPrice").ToString)%>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblCreditPrice" runat="server" Text='<%# PublicFunctions.DecimalFormat(Eval("CreditPrice").ToString)%>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Eval("CreatedDate").ToString %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:CheckBox ID="chkActive" runat="server" Enabled="false" CssClass="c-check" Text=" " Checked='<%# PublicFunctions.BoolFormat(Eval("Active").ToString)%>' />
                                                                        </td>
                                                                        <td>
                                                                            <asp:CheckBox ID="chkHot" runat="server" Enabled="false" CssClass="c-check" Text=" " Checked='<%# PublicFunctions.BoolFormat(Eval("Hot").ToString)%>' />
                                                                        </td>
                                                                        <td>
                                                                            <asp:Image ID="ImgbigPhoto" CssClass="td-img img-thumbnail" runat="server" ImageUrl='<%# IIf(Eval("Photo").ToString <> String.Empty, Eval("Photo"), "~/Images/noimage.jpg")%>' Visible="false" />
                                                                            <asp:LinkButton ID="lbShowImages" runat="server" CommandArgument='<%# Eval("ID")%>' OnClick="ViewPhotos">
                                                                                <asp:Image ID="imgPhoto" CssClass="td-img img-thumbnail" runat="server" ImageUrl='<%# IIf(Eval("Photo").ToString <> String.Empty, Eval("Photo"), "~/Images/noimage.jpg")%>' />
                                                                            </asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>

                                                                <EmptyDataTemplate>
                                                                    <table style="width: 100%;">
                                                                        <tr class="EmptyRowStyle">
                                                                            <td>
                                                                                <div>No Data Found.</div>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </EmptyDataTemplate>
                                                            </asp:ListView>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </asp:Panel>

                                            <div class="form-group col-md-12 input-in">
                                                <label class="form-label required">Description</label>
                                                <uc1:HTMLEditor ID="txtDescription" runat="server" />
                                                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" CssClass="displaynone"
                                                        ValidationGroup="vProduct" ControlToValidate="txtDescription" ErrorMessage="Enter Description"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="form-group col-md-3 input-in" id="divSourceURL" runat="server" visible="false">
                                                <label class="form-label">Source URL</label>
                                                <asp:TextBox runat="server" ID="txtSourceURL" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 pl-2" id="Brochure" runat="server">
                            <div class="card m-0 h-100">
                                <div class="card-header">
                                    <h5 class="card-title">Brochure</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Panel ID="pnlBrochure" runat="server" CssClass="custom-file-container position-relative">
                                                <asp:HyperLink ID="hlViewBrochure" runat="server" CssClass="logo_photo" ClientIDMode="Static" Target="_blank">
                                                    <asp:Image ID="imgBrochure" ClientIDMode="Static" runat="server" Style="max-height: 100%; max-width: 100%" ImageUrl="images/noDoc.png" />
                                                </asp:HyperLink>
                                                <asp:TextBox ID="HiddenBrochure" runat="server" ClientIDMode="Static" Style="display: none"></asp:TextBox>

                                                <asp:LinkButton ID="btnClear" CssClass="btn-clear-photo" runat="server" OnClick="ClearBrochure"><i class="ti-close"></i></asp:LinkButton>
                                                <asp:Panel ID="pnlfuPhoto" runat="server" CssClass="photo-upload-box">
                                                    <span>Upload Brochure <i class="fa fa-camera ml-1"></i></span>
                                                    <asp:AsyncFileUpload ID="fuPhoto" CssClass="photo-upload-box-input" runat="server" OnUploadedComplete="BrochureUploaded"
                                                        OnClientUploadComplete="UploadComplete" OnClientUploadError="UploadError" OnClientUploadStarted="UploadStarted"
                                                        FailedValidation="False" />
                                                </asp:Panel>
                                                <div class="update-progress-img">
                                                    <asp:Image ID="imgLoader" runat="server" ClientIDMode="Static" ImageUrl="~/images/image-uploader.gif" Style="display: none;" />
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 mt-3" id="Prices" runat="server" visible="false">
                            <div class="card m-0 h-100">
                                <div class="card-header">
                                    <h5 class="card-title">Prices</h5>
                                </div>
                                <div class="card-body">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">Weight (gms)</label>
                                                <asp:TextBox runat="server" ID="txtWeight" MaxLength="10" CssClass="form-control" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtWeight" ErrorMessage="Enter Weight"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">Cost</label>
                                                <asp:TextBox runat="server" ID="txtSupplierPrice" CssClass="form-control" onchange="CalCRPrice();CalCODPrice();CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtSupplierPrice" ErrorMessage="Enter Supplier Price"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-3 input-in" style="display: none">
                                                <label class="form-label">Total Cost</label>
                                                <asp:TextBox runat="server" ID="txtTotalCost" CssClass="form-control" ClientIDMode="Static" Enabled="false" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                            </div>

                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">CR Margin %</label>
                                                <asp:TextBox runat="server" ID="txtCRMargin" CssClass="form-control" onchange="CalCRPrice();CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtCRMargin" ErrorMessage="Enter CR Margin"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label">CR Price</label>
                                                <asp:TextBox runat="server" ID="txtCRPrice" CssClass="form-control" ClientIDMode="Static" Enabled="false" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">COD Margin %</label>
                                                <asp:TextBox runat="server" ID="txtCODMargin" CssClass="form-control" onchange="CalCODPrice();CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtCODMargin" ErrorMessage="Enter COD Margin"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label">COD Price</label>
                                                <asp:TextBox runat="server" ID="txtCODPrice" CssClass="form-control" ClientIDMode="Static" Enabled="false" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">VAT Percent %</label>
                                                <asp:TextBox runat="server" ID="txtVATPercent" CssClass="form-control" onchange="CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);" Text="0"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtVATPercent" ErrorMessage="Enter VAT Percent"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-3 input-in">
                                                <label class="form-label required">VAT</label>
                                                <asp:TextBox runat="server" ID="txtVAT" CssClass="form-control" onchange="CalVAT(this);" ClientIDMode="Static" MaxLength="10" Enabled="false" onkeypress="return isDecimal(event,this);" Text="0"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vProduct" ControlToValidate="txtVAT" ErrorMessage="Enter VAT"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlPhotos" runat="server" CssClass="row" ClientIDMode="Static" Style="display: none">
                    <div class="col-md-12 mt-3">
                        <div class="card m-0 h-100">
                            <div class="card-header">
                                <h5 class="card-title">Photos</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <asp:Panel ID="pnlUpload" runat="server" CssClass="col-md-12 mb-3" ClientIDMode="Static">
                                        <asp:LinkButton CssClass="btn btn-primary" ID="lbUpload" runat="server" OnClientClick="topFunction();">Upload Photos<i class="feather icon-plus"></i></asp:LinkButton>

                                        <asp:ModalPopupExtender ID="mdu" runat="server" BackgroundCssClass="modalBackground" TargetControlID="lbUpload"
                                            PopupControlID="pnlFileUpload" ClientIDMode="AutoID" CancelControlID="lbClosePopUp" Enabled="True">
                                        </asp:ModalPopupExtender>
                                        <asp:Panel ID="pnlFileUpload" runat="server" CssClass="modalPopup-uploader">
                                            <div class="modal-header px-3">
                                                <asp:LinkButton ID="lbClosePopUp" runat="server" CausesValidation="false"><i class="fa fa-times text-danger"></i></asp:LinkButton>
                                            </div>
                                            <div class="modal-body">
                                                <asp:AjaxFileUpload ID="AjaxFileUpload1" ClientIDMode="static" runat="server" OnClientUploadComplete="uploadFileComplete"
                                                    MaximumNumberOfFiles="10" AllowedFileTypes="jpeg,jpg,png,gif" />
                                                <asp:HiddenField ID="hfPhotoNames" ClientIDMode="Static" runat="server" />
                                            </div>
                                            <div class="modal-footer">
                                                <div id="okDiv" runat="server" class="w-100 mx-0">
                                                    <div class="col-md-12 text-right px-0">
                                                        <div class="d-inline-block">
                                                            <asp:LinkButton ID="lbOK" runat="server" CausesValidation="false" OnClientClick="bindUploadedFilesLabel(); return false;" CssClass="btn btn-success">Ok<i class="feather icon-check"></i></asp:LinkButton>
                                                        </div>
                                                        <div id="divSubmit" class="input-in" style="display: none">
                                                            <asp:LinkButton ID="lbSubmit" runat="server" CausesValidation="false" Text="Submit" OnClick="AddFiles"></asp:LinkButton>
                                                            <asp:HiddenField ID="lblUploadedFilesDetails" runat="server" ClientIDMode="Static" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </asp:Panel>
                                    <div class="col-md-6">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvItemsImgs" CssClass="table table-striped table-bordered table-hover" runat="server" ClientIDMode="AutoID" AutoGenerateColumns="False" AllowSorting="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Main">
                                                        <ItemTemplate>
                                                            <asp:RadioButton ID="rblSelect" runat="server" Text=' ' Checked='<%# Eval("Main")%>' OnCheckedChanged="SelectRBL" AutoPostBack="true" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Photo">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblId" runat="server" Visible="false" Text='<%# Eval("Id")%>' />
                                                            <asp:Image ID="lblImg" CssClass="td-img img-thumbnail" runat="server" ImageUrl='<%# Eval("Photo")%>' Width="50px" onclick="ImagePreview(this.src,this.alt)" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblImgType" runat="server" Visible="false" Text='<%# Eval("Type")%>' />
                                                            <asp:DropDownList ID="ddlImgType" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="C">Current</asp:ListItem>
                                                                <asp:ListItem Value="O">Original</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <a href="#" class="btn btn-danger" id="hrefDeleteImg" title="Delete Img"
                                                                onclick="ShowConfirmPopup('<%# CType(Container, GridViewRow).FindControl("mpConfirmDeleteImg").ClientID.ToString%>','<%# CType(Container, GridViewRow).FindControl("pnlConfirmExtenderDeleteImg").ClientID.ToString%>');return false;"><i class="feather icon-trash-2"></i></a>
                                                            <asp:HiddenField ID="hfDeleteImg" runat="server" />
                                                            <asp:ModalPopupExtender ID="mpConfirmDeleteImg" runat="server" PopupControlID="pnlConfirmExtenderDeleteImg" TargetControlID="hfDeleteImg"
                                                                CancelControlID="lbNoDeleteImg" BackgroundCssClass="modalBackground">
                                                            </asp:ModalPopupExtender>
                                                            <asp:Panel ID="pnlConfirmExtenderDeleteImg" runat="server" CssClass="rodal rodal-fade-enter" align="center" Style="display: none">
                                                                <div class="rodal-mask"></div>
                                                                <div class="rodal-dialog rodal-slideUp-enter" style="width: 300px;">
                                                                    <div class="card">
                                                                        <div class="card-header p-2">
                                                                            <h5 class="card-title m-0">Confirmation Message</h5>
                                                                        </div>
                                                                        <div class="body p-2">
                                                                            <label>Are you sure you want to delete this Img ?</label>
                                                                        </div>
                                                                        <div class="footer">
                                                                            <div class="input-in">
                                                                                <asp:LinkButton ID="lbYesDeleteImg" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("Id") %>' OnClick="DeleteImg">Yes<i class="fa fa-check"></i></asp:LinkButton>
                                                                                <%--OnClick="Delete"--%>
                                                                            </div>
                                                                            <div class="input-in">
                                                                                <a id="lbNoDeleteImg" class="btn btn-danger" onclick="CloseConfirmPopup('<%# CType(Container, GridViewRow).FindControl("mpConfirmDeleteImg").ClientID.ToString%>');return false;">No<i class="fa fa-times"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <div class="text-center">
                                                        <span class="fa fa-exclamation"></span>&nbsp No Data Found
                                                    </div>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <div class="col-md-12">
                    <div id="myModal" class="modal fade bs-example-modal-lg" role="dialog">
                        <div class="modal-dialog modal-lg" style="width: 90%;">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div>
                                    <button type="button" class="close" data-dismiss="modal" onclick="UnloadForm();">&times;</button>
                                    <h4 class="modal-title" id="formName"></h4>
                                </div>
                                <div class="modal-body">

                                    <iframe style="width: 100%; height: 500px; border: 0" id="frmFrame" innerframe="true" runat="server"></iframe>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" runat="server" id="btnclosemodal" onclick="UnloadForm();">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Panel ID="pnlItemImages" runat="server">
                    <asp:HiddenField ID="hfShowImages" runat="server" />
                    <asp:ModalPopupExtender ID="mpPopupImgs" runat="server" ClientIDMode="Static" PopupControlID="pnlPopupImgs" TargetControlID="hfShowImages"
                        CancelControlID="lbClosePopupImages" BackgroundCssClass="modalBackground">
                    </asp:ModalPopupExtender>
                    <asp:Panel ID="pnlPopupImgs" runat="server" ClientIDMode="Static" CssClass="modal-dialog modal-lg top5" align="center" Style="display: none; margin: 30px auto!important;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="dis-inline">Photos</h4>
                                <asp:LinkButton SkinID="btn-close" runat="server" CausesValidation="false" OnClientClick="CloseConfirmPopup('mpPopupImgs');return false;"><i class="ti-close icon-close""></i></asp:LinkButton>
                            </div>
                            <div class="modal-body">
                                <div class="img-thumbnail main-img-slider">
                                    <asp:Image ID="imgMain" onclick="ImagePreview(this.src,this.alt)" runat="server" />
                                </div>
                                <ul class="slider-switch">
                                    <asp:ListView ID="lvImages" runat="server" ClientIDMode="AutoID">
                                        <ItemTemplate>
                                            <a class="img-thumbnail" href='#' onclick="SetMainImage('<%# Eval("Photo").ToString.Replace("~/", "../")%>');return false;">
                                                <asp:Image ID="imgNews" runat="server" ImageUrl='<%# Eval("PhotoThumb")%>' />
                                            </a>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ul>

                            </div>
                            <div class="modal-footer">
                                <ul class="btn-uls mb0">

                                    <li class="btn-lis">
                                        <asp:LinkButton ID="lbClosePopupImages" runat="server" CssClass="btn-main btn-red" OnClientClick="CloseConfirmPopup('mpPopupImgs');return false;">Close<i class="ti-close"></i></asp:LinkButton></li>
                                </ul>
                            </div>
                        </div>
                    </asp:Panel>
                    <!-- The Modal -->
                    <div id="previewImage" class="previewImage">

                        <!-- The Close Button -->
                        <a class="Myclose" onclick='closeImgPopup();'>&times;</a>

                        <!-- Modal Content (The Image) -->
                        <img class="previewImage-content" id="img01" style="max-height: 515px;">
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Panel ID="pnlMap" runat="server" CssClass="col-md-4">


            <!-- Map Modal -->
            <div id="MapModal" class="modal fade" role="dialog">

                <div class="modal-dialog modal-lg mt0">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">

                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Map</h4>
                        </div>
                        <div class="modal-body">

                            <div id="locationField" class="pnl-search-map">
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <a id="lbCollapse" class="btn btn-search-map" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-bars"></i></a>
                                    </span>
                                    <input id="search_address" class="form-control" placeholder="Enter your address" onfocus="geolocate()" type="text" autocomplete="off" />
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="lbSearchIcon" OnClientClick="return false;" runat="server" CssClass="search-bt btn btn-default" type="button"> <i class="fa-search fa"></i> </asp:LinkButton>
                                    </span>
                                </div>

                                <div class="collapse in" id="collapseExample">
                                    <div id="address" class="col-md-12 p0">
                                        <asp:Panel ID="pnlMapAddress" runat="server" Style="display: none;">
                                            <div class="col-md-12 input-in">
                                                <label class="active">Street address</label>
                                                <input class="form-control" id="street_number" disabled="true" />
                                            </div>
                                            <div class="col-md-12 input-in">
                                                <label class="active">&nbsp;</label>
                                                <input class="form-control" id="route" disabled="true" />
                                            </div>
                                            <div class="col-md-12 input-in">
                                                <label class="active">State</label>
                                                <input class="form-control" id="locality" disabled="true" />
                                            </div>
                                            <div class="col-md-12 input-in">
                                                <label class="active">Zip code</label>
                                                <input class="form-control" id="postal_code" disabled="true" />
                                            </div>
                                        </asp:Panel>

                                        <div class="col-md-12 input-in">
                                            <label class="active">City</label>
                                            <input class="form-control" id="administrative_area_level_1" disabled="true" />
                                        </div>

                                        <div class="col-md-12 input-in">
                                            <label class="active">Country</label>
                                            <input class="form-control" id="country" disabled="true" />
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- Note: The address components in this sample are typical. You might need to adjust them for
               the locations relevant to your app. For more information, see
         https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform
    -->

                            <div id="googleMap" style="width: 100%; height: 400px;"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </asp:Panel>
        <script src="JSCode/Items.js"></script>
        <script src="JSCode/jsGoogleMap.js"></script>

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBV4EeUhE4ZQ_L-WPvmVBuNnkEKuXU7XII&libraries=places&callback=initAutocomplete"></script>
        <%--AIzaSyAsUO5F3TK85dMEdldKHne0nulD-6YsY-g--%>
        <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBugdOXyJ8qFHe6eFsXqQtFWpBm5RRS1gw"></script>--%>
    </form>
</body>
</html>
