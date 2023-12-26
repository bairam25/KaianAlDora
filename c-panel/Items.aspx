<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="Items.aspx.vb" Inherits="Items" %>

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
    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Resource style -->
    <link rel="stylesheet" href="css/c-scroll.css" />
    <link rel="stylesheet" href="css/cpcustom.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Poppins:300,400,500,600,700,800|Roboto:300,400,500,700,900" rel="stylesheet" />


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

        <!--============================ Page-header =============================-->
        <div class="container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-6 col-xs-5">
                        <h4>Items</h4>
                    </div>
                    <div class="col-sm-6 col-xs-7 text-right">
                        <ol class="breadcrumb">
                            <li><a href="Dashboards.aspx"><i class="ti-home"></i></a></li>
                            <li>Items</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <div id="page-wrapper" style="min-height: 684px;">
                    <div class="container-fluid">
                        <div class="uploader">
                            <asp:UpdateProgress ID="upg" runat="server" AssociatedUpdatePanelID="up">
                                <ProgressTemplate>
                                    <asp:Image ID="Image7" runat="server" ImageUrl="~/images/ajax-loader.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb10">
                                <asp:CompareValidator ValidationGroup="vgDate" ErrorMessage="Date From should be less than or equal Date To" CssClass="res-label-info" Style="display: inline;"
                                    ControlToValidate="txtDateTo" ControlToCompare="txtDateFrom" Display="Dynamic" Type="Date" Operator="GreaterThanEqual" runat="server" />
                            </div>

                            <asp:Panel ID="pnlOps" runat="server">
                                <div class="col-md-12">
                                    <div class="table-top-panel p-b-8">

                                        <div class="tbl-top-panel-left">
                                            <div class="row">
                                                <asp:Panel ID="pgPanel" CssClass="dis-inline vertical-bottom mb-6-" runat="server">
                                                    <asp:Panel ID="pnlRows" runat="server" CssClass="input-field input-170 input-in mb15">
                                                        <div class="input-group">
                                                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlRows" AutoPostBack="true" OnSelectedIndexChanged="FillGrid">
                                                                <asp:ListItem Value="top 10" Selected="True">10</asp:ListItem>
                                                                <asp:ListItem Value="top 50">50</asp:ListItem>
                                                                <asp:ListItem Value="top 100">100</asp:ListItem>
                                                                <asp:ListItem Value="top 200">200</asp:ListItem>
                                                                <asp:ListItem Value="top 500">500</asp:ListItem>
                                                                <asp:ListItem Value="top 1000">1000</asp:ListItem>
                                                                <asp:ListItem Value="">All</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <span class="input-group-addon" id="basic-addon2">Max Results</span>
                                                        </div>
                                                    </asp:Panel>
                                                    <div class="input-field input-170 input-in mb15">
                                                        <div class="input-group">
                                                            <asp:DropDownList runat="server" CssClass="form-control ltr" ID="ddlPager" OnSelectedIndexChanged="PageSize_Changed" AutoPostBack="true">
                                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                                <asp:ListItem Value="25">25</asp:ListItem>
                                                                <asp:ListItem Value="50">50</asp:ListItem>
                                                                <asp:ListItem Value="100">100</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <span class="input-group-addon" id="basic-addon1">Entries/page</span>
                                                        </div>
                                                    </div>

                                                </asp:Panel>
                                            </div>
                                            <div class="row">
                                                <asp:Panel ID="Panel2" CssClass="dis-inline" runat="server">
                                                    <div class="input-field input-150 input-in">
                                                        <label>Date From</label>
                                                        <div class="clear"></div>
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
                                                    <div class="input-field input-150 input-in">
                                                        <label>Date To</label>
                                                        <div class="clear"></div>
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
                                                    <div class="input-field input-150 input-in">
                                                        <label>Country</label>
                                                        <div class="clear"></div>
                                                        <asp:DropDownList runat="server" ID="ddlCountry" CssClass="ddl-filter" AutoPostBack="true" OnSelectedIndexChanged="FillGrid">
                                                        </asp:DropDownList>
                                                    </div>

                                                </asp:Panel>
                                                <asp:Panel ID="pnlReported" runat="server" CssClass="d-inl-block">
                                                    <div class="input-field input-in">
                                                        <label>Reported</label>
                                                        <div class="clear"></div>
                                                        <asp:RadioButtonList ID="rblReported" runat="server" RepeatDirection="Horizontal">
                                                            <asp:ListItem Value="-1" Selected="True">All</asp:ListItem>
                                                            <asp:ListItem Value="1">Reported</asp:ListItem>
                                                            <asp:ListItem Value="0">Not Reported</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </asp:Panel>
                                                <asp:LinkButton ID="lbFilter" SkinID="btn-new-filter" runat="server" OnClick="FillGrid" ToolTip="Filter" ValidationGroup="vgDate">Filter <i class="ti-search"></i></asp:LinkButton>
                                            </div>
                                        </div>

                                        <div class="tbl-top-panel-right" style="vertical-align: unset;">
                                            <div class="row">
                                                <div class="input-320 input-in searchContiner pull-right">
                                                    <asp:Panel ID="pnlSearch" runat="server">
                                                        <div class="input-group" id="search">
                                                            <asp:TextBox ID="txtSearch" ClientIDMode="Static" runat="server" class="form-control input-lg" placeholder="Search by Name, Brand, Salesman, City, Area" OnTextChanged="FillGrid" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>
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
                                                            <asp:LinkButton runat="server" ID="cmdClear" SkinID="clear-search" title="Clear" OnClientClick="$('#txtSearch').val('');">&times;</asp:LinkButton>
                                                            <span class="input-group-btn">
                                                                <asp:LinkButton ID="cmdSearch" SkinID="btn-search" runat="server" CausesValidation="False" OnClick="FillGrid"><i class="fa-search fa"></i></asp:LinkButton>
                                                            </span>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <asp:LinkButton ID="cmdNew" SkinID="btn-new" Style="margin-top: 0px !important;" runat="server" OnClick="Add" ToolTip="New">New <i class="ti-plus"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>



                            <div class="col-md-12">
                                <asp:Label ID="lblRes" runat="server" Visible="false"></asp:Label>
                                <a href="#" id="hfCustomer" runat="server" onclick="OpenPopUpFromGv('Customers.aspx?Mode=Add');">Create new Customer</a>
                            </div>

                            <asp:Panel ID="pnlGV" runat="server">
                                <div class="col-md-12">

                                    <div class="table-layer" style="box-shadow: 0px 1px 15px 1px rgba(69,65,78,0.08);">
                                        <div class="table-responsive mt5">
                                            <div class="results-table">
                                                <span><i class="fa-list fa"></i><strong>
                                                    <asp:Label ID="lblSelectedItemsCount" runat="server"></asp:Label></strong> Results found</span>
                                            </div>
                                            <asp:HiddenField ID="SortExpression" runat="server" />
                                            <asp:ListView ID="lvItems" runat="server" ClientIDMode="AutoID"
                                                OnPagePropertiesChanging="OnPagePropertiesChanging" OnSorting="lv_Sorting">
                                                <LayoutTemplate>
                                                    <div class="w-body-tbllayer">
                                                        <div class="table-responsive">
                                                            <table id="itemPlaceholderContainer" runat="server" border="0" class="table mt2 table-responsive table-condensed edit-width">
                                                                <tr>

                                                                    <th>No.</th>
                                                                    <th class="upnDownArrow" id="Name">
                                                                        <asp:LinkButton ID="lbName" CommandArgument="Name" CommandName="Sort" runat="server">Title</asp:LinkButton>
                                                                    </th>
                                                                    <th class="upnDownArrow" id="ListedByName">
                                                                        <asp:LinkButton ID="lbListedBy" CommandArgument="ListedByName" CommandName="Sort" runat="server">Listed By</asp:LinkButton>
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
                                                                    <th class="upnDownArrow" id="Salesman">
                                                                        <asp:LinkButton ID="lbSalesman" CommandArgument="Salesman" CommandName="Sort" runat="server">Salesman</asp:LinkButton>
                                                                    </th>
                                                                    <th class="upnDownArrow" id="Active">
                                                                        <asp:LinkButton ID="lbActive" CommandArgument="Active" CommandName="Sort" runat="server">Active</asp:LinkButton>
                                                                    </th>

                                                                    <th>Photos
                                                                    </th>
                                                                    <th>Reports
                                                                    </th>
                                                                    <th>Details
                                                                    </th>
                                                                    <th>Preview
                                                                    </th>
                                                                    <th id="EditHeader">Edit
                                                                    </th>
                                                                    <th id="DeleteHeader">Delete
                                                                    </th>

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
                                                            <asp:Label ID="lblSerialNo" Text='<%# Container.DataItemIndex + 1%>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblItemId" runat="server" Text='<%# Eval("Id")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblListedBy" runat="server" Text='<%# Eval("ListedByName")%>'></asp:Label>
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
                                                        <td>
                                                            <asp:Label ID="lblSalesman" runat="server" Text='<%# Eval("Salesman").ToString %>'></asp:Label>
                                                        </td>
                                                        <td id="Active" runat="server">
                                                            <asp:CheckBox ID="chkActive" runat="server" AutoPostBack="True" CssClass="c-check" Text=" " Checked='<%# PublicFunctions.BoolFormat(Eval("Active").ToString)%>' OnCheckedChanged="UpdateActive" />
                                                        </td>

                                                        <td>
                                                            <asp:Image ID="ImgbigPhoto" CssClass="td-img img-thumbnail" runat="server" ImageUrl='<%# IIf(Eval("Photo").ToString <> String.Empty, Eval("Photo"), "~/Images/noimage.jpg")%>' Visible="false" />
                                                            <asp:LinkButton ID="lbShowImages" runat="server" CommandArgument='<%# Eval("ID")%>' OnClick="ViewPhotos">
                                                                <asp:Image ID="imgPhoto" CssClass="td-img img-thumbnail" runat="server" ImageUrl='<%# IIf(Eval("PhotoThumb").ToString <> String.Empty, Eval("PhotoThumb"), "~/Images/noimage.jpg")%>' />
                                                            </asp:LinkButton>
                                                        </td>
                                                        <td id="Reported" runat="server">
                                                            <asp:Panel ID="pnlReported" runat="server" Visible='<%#IIf(PublicFunctions.GetUserType(PublicFunctions.GetUserId).ToLower = "admin", "True", "False") %>'>
                                                                <a href="#" class="btni-xxxs btn-blue brd-50" onclick='<%# String.Format("javascript:OpenPopUpFromGv(""ReportsFrm.aspx?ItemId={0}"");return false;", Eval("Id"))%>'><i class="fa-file fa"></i></a>
                                                            </asp:Panel>
                                                        </td>
                                                        <td>
                                                            <asp:Panel ID="pnlDetails" runat="server">
                                                                <asp:LinkButton ID="lbDetails" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="Details"
                                                                    ToolTip="Details"><i class="fa fa-copy btni-xxxs btn-info brd-50"></i> </asp:LinkButton>
                                                            </asp:Panel>
                                                        </td>
                                                        <td>
                                                            <asp:Panel ID="pnlPreview" runat="server">
                                                                <a href='<%# PublicFunctions.ServerURL + "Item/" + Eval("SKU") %>' target="_blank"><i class="fa fa-eye btni-xxxs btn-info brd-50"></i></a>
                                                            </asp:Panel>
                                                        </td>
                                                        <td id="Edit" runat="server">
                                                            <asp:Panel ID="pnlEdit" runat="server">
                                                                <asp:LinkButton ID="lbEdit" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="Edit"
                                                                    ToolTip="Edit"><i class="fa fa-edit btni-xxxs btn-info brd-50"></i> </asp:LinkButton>
                                                            </asp:Panel>
                                                        </td>
                                                        <td id="Delete" runat="server">
                                                            <asp:Panel ID="pnlDelete" runat="server">

                                                                <a href="#" id="hrefDelete" title="Delete"
                                                                    onclick="ShowConfirmPopup('<%# CType(Container, ListViewItem).FindControl("mpConfirmDelete").ClientID.ToString%>','<%# CType(Container, ListViewItem).FindControl("pnlConfirmExtenderDelete").ClientID.ToString%>');return false;">
                                                                    <i class="fa fa-trash btni-xxxs btn-red brd-50"></i>
                                                                </a>
                                                                <asp:HiddenField ID="hfDelete" runat="server" />
                                                                <asp:ModalPopupExtender ID="mpConfirmDelete" runat="server" PopupControlID="pnlConfirmExtenderDelete" TargetControlID="hfDelete"
                                                                    CancelControlID="lbNoDelete" BackgroundCssClass="modalBackground">
                                                                </asp:ModalPopupExtender>
                                                                <asp:Panel ID="pnlConfirmExtenderDelete" runat="server" CssClass="modal-n modalPopup" align="center" Style="display: none">
                                                                    <div class="header">
                                                                        Confirmation Message
                                                                    </div>
                                                                    <div class="body">
                                                                        <label>Do you want to delete this Item ?</label>
                                                                    </div>

                                                                    <div class="footer">
                                                                        <ul class="btn-uls mb0">
                                                                            <li class="btn-lis">
                                                                                <asp:LinkButton ID="lbYesDelete" runat="server" CssClass="btn-main btn-green" CommandArgument='<%# Eval("Id") %>' OnClick="Delete">Yes<i class="ti-check"></i></asp:LinkButton></li>
                                                                            <%--OnClick="Delete"--%>
                                                                            <li class="btn-lis">
                                                                                <asp:LinkButton ID="lbNoDelete" runat="server" CssClass="btn-main btn-red" OnClientClick="CloseConfirmPopup('mpConfirmDelete');return false;">No<i class="ti-close"></i></asp:LinkButton></li>
                                                                        </ul>
                                                                    </div>
                                                                </asp:Panel>
                                                            </asp:Panel>
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
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb10">
                                <asp:Panel ID="pnlConfirm" CssClass="col-md-12 p0" runat="server" Visible="false">
                                    <ul class="btn-uls pull-right">
                                        <li class="btn-lis" runat="server" id="liSave">

                                            <%--<asp:Button ID="cmdSave" runat="server" SkinID="btn-save" ValidationGroup="vProduct" OnClick="Save" UseSubmitBehavior="false" OnClientClick="SaveClick(this,'vProduct');" Text="Save" />--%>
                                            <asp:Panel runat="server" ID="pnlSave">
                                                <a href="#" title="Save" class="btn-main btn-green" data-toggle="modal" data-placement="bottom" data-original-title="Save"
                                                    onclick="ShowConfirmPopup('mpConfirmSave','pnlConfirmExtenderSave');return false;">Save<i class="ti-check"></i></a>
                                                <asp:HiddenField ID="hfSave" runat="server" />
                                                <asp:ModalPopupExtender ID="mpConfirmSave" ClientIDMode="Static" runat="server" PopupControlID="pnlConfirmExtenderSave" TargetControlID="hfSave"
                                                    CancelControlID="lbNoSave" BackgroundCssClass="modalBackground">
                                                </asp:ModalPopupExtender>

                                            </asp:Panel>
                                            <asp:Panel ID="pnlConfirmExtenderSave" runat="server" ClientIDMode="Static" CssClass="modal-n modalPopup" align="center" Style="display: none">
                                                <div class="header">
                                                    Confirmation Message
                                                </div>
                                                <div class="body">
                                                    <label>Are you sure you want to Save Item ?</label>
                                                </div>

                                                <div class="footer">
                                                    <ul class="btn-uls mb0">
                                                        <li class="btn-lis">
                                                            <span style="position: relative;">
                                                                <i class="fa-check fa icon-save"></i>
                                                                <asp:Button ID="cmdSave" runat="server" SkinID="btn-save" ValidationGroup="vProduct" OnClick="Save" UseSubmitBehavior="false" OnClientClick="SaveClick(this,'vProduct');" Text="Save" />
                                                            </span>
                                                            <li class="btn-lis">
                                                                <asp:LinkButton ID="lbNoSave" runat="server" SkinID="btn-red" OnClientClick="CloseConfirmPopup('mpConfirmSave');return false;">No<i class="ti-close"></i></asp:LinkButton></li>
                                                    </ul>
                                                </div>
                                            </asp:Panel>

                                        </li>
                                        <li class="btn-lis">
                                            <asp:Panel runat="server" ID="pnlCancel">
                                                <a href="#" title="Cancel" class="btn-main btn-red" data-toggle="modal" data-placement="bottom" data-original-title="Cancel"
                                                    onclick="ShowConfirmPopup('mpConfirmCancel','pnlConfirmExtenderCancel');return false;">Cancel<i class="ti-close"></i></a>
                                                <asp:HiddenField ID="hfCancel" runat="server" />
                                                <asp:ModalPopupExtender ID="mpConfirmCancel" ClientIDMode="Static" runat="server" PopupControlID="pnlConfirmExtenderCancel" TargetControlID="hfCancel"
                                                    CancelControlID="lbNoCancel" BackgroundCssClass="modalBackground">
                                                </asp:ModalPopupExtender>

                                            </asp:Panel>
                                            <asp:Panel ID="pnlConfirmExtenderCancel" runat="server" ClientIDMode="Static" CssClass="modal-n modalPopup" align="center" Style="display: none">
                                                <div class="header">
                                                    Confirmation Message
                                                </div>
                                                <div class="body">
                                                    <label>Are you sure you want to cancel ?</label>
                                                </div>

                                                <div class="footer">
                                                    <ul class="btn-uls mb0">
                                                        <li class="btn-lis">
                                                            <asp:LinkButton ID="lbYesCancel" runat="server" SkinID="btn-green" OnClick="Cancel" CausesValidation="false">Yes<i class="ti-check"></i></asp:LinkButton></li>
                                                        <li class="btn-lis">
                                                            <asp:LinkButton ID="lbNoCancel" runat="server" SkinID="btn-red" OnClientClick="CloseConfirmPopup('mpConfirmCancel');return false;">No<i class="ti-close"></i></asp:LinkButton></li>
                                                    </ul>
                                                </div>
                                            </asp:Panel>
                                        </li>
                                    </ul>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="pnlLastupdate">
                                </asp:Panel>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid">
                        <asp:HiddenField ID="Collapse1Status" runat="server" Value="collapse1"></asp:HiddenField>
                        <asp:HiddenField ID="Collapse2Status" runat="server" Value="collapse2"></asp:HiddenField>
                        <asp:HiddenField ID="Collapse3Status" runat="server" Value=""></asp:HiddenField>
                        <asp:HiddenField ID="Collapse4Status" runat="server" Value=""></asp:HiddenField>


                        <asp:ValidationSummary CssClass="dis-none" ID="ValidationSummary" DisplayMode="BulletList" ValidationGroup="vProduct" EnableClientScript="true" runat="server" Font-Size="Medium" ForeColor="#CC0000" />
                        <asp:Label ID="lblItemId" runat="server" Visible="false"></asp:Label>
                        <div class="mb0" id="accordion" role="tablist" aria-multiselectable="false">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Panel ID="pnlForm" runat="server" Visible="false">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="heading1">
                                                <h4 class="panel-title">
                                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" onclick="SetStatus('1')">Details</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:Panel ID="pnlCode" runat="server" Visible="false">
                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">SKU</label>
                                                                    <asp:TextBox runat="server" ID="txtSKUCode" MaxLength="30" AutoPostBack="true" OnTextChanged="CheckItemCode"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="txtSKUCode" ErrorMessage="Enter SKU Code"></asp:RequiredFieldValidator>
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="True"
                                                                        TargetControlID="txtSKUCode" ValidChars=" ,0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM()-">
                                                                    </asp:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-md-3 mb5" style="display: none">
                                                                    <label class="required">Item Code</label>
                                                                    <asp:TextBox runat="server" ID="txtItemCode" MaxLength="30" AutoPostBack="true" OnTextChanged="CheckItemCode"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="txtItemCode" ErrorMessage="Enter Item Code"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label>Item Barcode</label>
                                                                    <asp:Label ID="lblBarCode" runat="server" CssClass="lbl-barcode"></asp:Label>
                                                                </div>
                                                            </asp:Panel>

                                                            <div class="col-md-3 mb5">
                                                                <label>Item/Service</label>
                                                                <asp:RadioButtonList ID="rblIsService" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="3" AutoPostBack="true" OnSelectedIndexChanged="SelectIsService">
                                                                    <asp:ListItem Value="0" Selected="True">Item</asp:ListItem>
                                                                    <asp:ListItem Value="1">Service</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                            <div class="col-md-6 mb5">
                                                                <label class="required">Item Name</label>
                                                                <asp:TextBox runat="server" ID="txtItemName" MaxLength="300" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>

                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtItemName" ErrorMessage="Enter Item Name"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label class="required">Listed By</label>
                                                                <asp:HiddenField ID="CustomerId" runat="server" />
                                                                <asp:TextBox runat="server" ID="txtCustomer" MaxLength="100" placeholder="Type Name Or Mobile" AutoPostBack="true" OnTextChanged="SelectCustomer" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtCustomer" ErrorMessage="Enter Customer Name or Mobile No."></asp:RequiredFieldValidator>
                                                                <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" BehaviorID="aceCusetomer" FirstRowSelected="false"
                                                                    EnableCaching="false" Enabled="True" MinimumPrefixLength="0" CompletionListCssClass="acl"
                                                                    CompletionListItemCssClass="li" CompletionListHighlightedItemCssClass="li-hover"
                                                                    ServiceMethod="getCustomers" ServicePath="~/WebService.asmx" TargetControlID="txtCustomer"
                                                                    CompletionInterval="500">
                                                                </asp:AutoCompleteExtender>

                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label class="required">Mobile No.</label>
                                                                <asp:TextBox runat="server" ID="txtCustomerMobile" MaxLength="15" onkeypress="return isNumber(event);" AutoPostBack="true" OnTextChanged="SelectMobile"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtCustomerMobile" ErrorMessage="Enter Customer Mobile"></asp:RequiredFieldValidator>

                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label class="required">Category</label>
                                                                <asp:DropDownList runat="server" ID="ddlCategory" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="SelectCategory"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="ddlCategory" InitialValue="0" ErrorMessage="Select Category"></asp:RequiredFieldValidator>

                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label class="required">Sub Category</label>
                                                                <asp:DropDownList runat="server" ID="ddlSubCategory" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode" Enabled="false">
                                                                    <asp:ListItem Text="-- Select --" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="ddlSubCategory" InitialValue="0" ErrorMessage="Select Sub Category"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label id="lblBrandRequired" runat="server" class="required">Brand</label>
                                                                <asp:HiddenField ID="BrandId" runat="server" />
                                                                <%--<asp:DropDownList runat="server" ID="ddlBrand" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="SelectBrand"></asp:DropDownList>--%>
                                                                <asp:TextBox ID="txtBrand" runat="server" MaxLength="50" AutoPostBack="true" OnTextChanged="SelectBrand" placeholder="Select Brand" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>
                                                                <asp:AutoCompleteExtender ID="aclBrands" runat="server" BehaviorID="aceBrand" FirstRowSelected="false"
                                                                    EnableCaching="false" Enabled="True" MinimumPrefixLength="0" CompletionListCssClass="acl"
                                                                    CompletionListItemCssClass="li" CompletionListHighlightedItemCssClass="li-hover"
                                                                    ServiceMethod="GetBrands" ServicePath="~/WebService.asmx" TargetControlID="txtBrand"
                                                                    CompletionInterval="500">
                                                                </asp:AutoCompleteExtender>
                                                                <asp:RequiredFieldValidator ID="rfvBrand" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtBrand" ErrorMessage="Select Brand"></asp:RequiredFieldValidator>

                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label>Model</label>
                                                                <asp:HiddenField ID="ModelId" runat="server" />
                                                                <%-- <asp:DropDownList runat="server" ID="ddlModel" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode" Enabled="false" >
                                                                    <asp:ListItem Text="-- Select --" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>--%>
                                                                <asp:TextBox ID="txtModel" runat="server" MaxLength="50" AutoPostBack="true" OnTextChanged="SelectModel" placeholder="Select Model" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>
                                                                <asp:AutoCompleteExtender ID="aclModels" runat="server" BehaviorID="aceModel" FirstRowSelected="false"
                                                                    EnableCaching="false" Enabled="True" MinimumPrefixLength="0" CompletionListCssClass="acl"
                                                                    CompletionListItemCssClass="li" CompletionListHighlightedItemCssClass="li-hover" UseContextKey="true"
                                                                    ServiceMethod="GetModels" ServicePath="~/WebService.asmx" TargetControlID="txtModel"
                                                                    CompletionInterval="500">
                                                                </asp:AutoCompleteExtender>
                                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtModel" ErrorMessage="Select Model"></asp:RequiredFieldValidator>--%>
                                                            </div>





                                                            <div class="col-md-3 mb5">
                                                                <label class="required">Condition</label>
                                                                <asp:DropDownList runat="server" ID="ddlCondition" AppendDataBoundItems="true"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="ddlCondition" InitialValue="0" ErrorMessage="Select Collection"></asp:RequiredFieldValidator>

                                                            </div>
                                                            <asp:Panel ID="pnlItemStyle" runat="server" Visible="false">
                                                                <div class="col-md-3 mb5">
                                                                    <label class="mb10">Active</label>
                                                                    <asp:RadioButtonList ID="rblActive" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="2">
                                                                        <asp:ListItem Value="True">On</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">Off</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">Color</label>
                                                                    <asp:DropDownList runat="server" ID="ddlColors" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="ddlColors" InitialValue="0" ErrorMessage="Select Color"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">Size</label>
                                                                    <asp:DropDownList runat="server" ID="ddlSize" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="ddlSize" InitialValue="0" ErrorMessage="Select Size"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">Material</label>
                                                                    <asp:DropDownList runat="server" ID="ddlMaterial" AppendDataBoundItems="true"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="ddlMaterial" InitialValue="0" ErrorMessage="Select Collection"></asp:RequiredFieldValidator>

                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">Style</label>
                                                                    <asp:DropDownList runat="server" ID="ddlStyle" AppendDataBoundItems="true"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="ddlStyle" InitialValue="0" ErrorMessage="Select Collection"></asp:RequiredFieldValidator>

                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">Collection</label>
                                                                    <asp:DropDownList runat="server" ID="ddlCollection" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="GenerateSkuCode"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="ddlCollection" InitialValue="0" ErrorMessage="Select Collection"></asp:RequiredFieldValidator>

                                                                </div>

                                                                <div class="col-md-3 mb5">
                                                                    <label class="mb10">Returnable</label>
                                                                    <asp:RadioButtonList ID="rblReturnable" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="2">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>

                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">Quantity</label>
                                                                    <asp:TextBox runat="server" ID="txtQuantity" MaxLength="8" onkeypress="return isNumber(event);"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="txtQuantity" ErrorMessage="Enter Quantity"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label class="mb10">Hot</label>
                                                                    <asp:RadioButtonList ID="rblHot" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="2">
                                                                        <asp:ListItem Value="True">On</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">Off</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                                <div class="col-md-3 mb5">
                                                                    <label>Item Rating</label>
                                                                    <asp:TextBox runat="server" ID="txtRating" MaxLength="4" onkeyup="return isRating(this);" onkeypress="return isDecimal(event,this);" placeholder="enter value from 1 to 5"></asp:TextBox>
                                                                </div>
                                                            </asp:Panel>
                                                            <div class="col-md-3 mb5">
                                                                <label>Youtube URL</label>
                                                                <asp:TextBox runat="server" ID="txtYoutubeURL"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label>Type</label>
                                                                <asp:RadioButtonList ID="rblItemType" CssClass="radioList" runat="server" RepeatLayout="Table" RepeatColumns="3" AutoPostBack="true" OnSelectedIndexChanged="SelectType">
                                                                    <asp:ListItem Value="A" Selected="True">All</asp:ListItem>
                                                                    <asp:ListItem Value="S">Sales</asp:ListItem>
                                                                    <asp:ListItem Value="B">Barter</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                            <asp:Panel ID="pnlPrice" runat="server" Visible="false">
                                                                <div class="col-md-3 mb5">
                                                                    <label class="required">Price</label>
                                                                    <asp:TextBox runat="server" ID="txtPrice" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="displaynone"
                                                                        ValidationGroup="vProduct" ControlToValidate="txtPrice" ErrorMessage="Enter Price"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </asp:Panel>

                                                            <asp:Panel ID="pnlRelated" runat="server" Visible="false">
                                                                <div class="col-md-3 mb5">
                                                                    <label>Related Items Keywords</label>
                                                                    <asp:TextBox ID="txtKeywords" runat="server" TextMode="MultiLine" placeholder="Please enter keywords for related items"></asp:TextBox>
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
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="col-md-3 mb5">
                                                                        <label class="required">City</label>
                                                                        <asp:HiddenField ID="CityId" runat="server" />
                                                                        <asp:TextBox runat="server" ID="txtCity" MaxLength="100" placeholder="Select City" AutoPostBack="true" OnTextChanged="SelectCity"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ValidationGroup="vProduct" runat="server" ID="RequiredFieldValidator27" ControlToValidate="txtCity"
                                                                            ErrorMessage="Enter City!" SetFocusOnError="true" />
                                                                        <asp:AutoCompleteExtender ID="aceCity" runat="server" BehaviorID="aceCity" FirstRowSelected="false"
                                                                            EnableCaching="false" Enabled="True" MinimumPrefixLength="0" CompletionListCssClass="acl"
                                                                            CompletionListItemCssClass="li" CompletionListHighlightedItemCssClass="li-hover"
                                                                            ServiceMethod="getCity" ServicePath="~/WebService.asmx" TargetControlID="txtCity"
                                                                            CompletionInterval="500">
                                                                        </asp:AutoCompleteExtender>

                                                                    </div>
                                                                    <div class="col-md-3 mb5">
                                                                        <label class="required">Area</label>
                                                                        <asp:HiddenField ID="AreaId" runat="server" />
                                                                        <asp:TextBox runat="server" ID="txtArea" MaxLength="200" placeholder="Select Area" AutoPostBack="true" OnTextChanged="SelectArea"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ValidationGroup="vProduct" runat="server" ID="RequiredFieldValidator26" ControlToValidate="txtArea"
                                                                            ErrorMessage="Enter Area!" SetFocusOnError="true" />
                                                                        <asp:AutoCompleteExtender ID="aceArea" runat="server" BehaviorID="aceArea" FirstRowSelected="false"
                                                                            EnableCaching="false" Enabled="True" MinimumPrefixLength="0" CompletionListCssClass="acl"
                                                                            CompletionListItemCssClass="li" CompletionListHighlightedItemCssClass="li-hover"
                                                                            ServiceMethod="GetArea" ServicePath="~/WebService.asmx" TargetControlID="txtArea" UseContextKey="true"
                                                                            CompletionInterval="500">
                                                                        </asp:AutoCompleteExtender>

                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <label class="required">Latitude</label>
                                                                        <asp:TextBox runat="server" ID="txtLatitude" MaxLength="20" autocomplete="off" placeholder="Latitude" ToolTip="Latitude" ClientIDMode="Static"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ValidationGroup="vProduct" runat="server" ID="RequiredFieldValidator24" ControlToValidate="txtLatitude"
                                                                            ErrorMessage="Enter Latitude!" SetFocusOnError="true" />
                                                                        <asp:FilteredTextBoxExtender runat="server" TargetControlID="txtLatitude" ValidChars="-.0123456789" FilterMode="ValidChars"></asp:FilteredTextBoxExtender>
                                                                        <%--The latitude must be a number between -90 and 90 and the longitude between -180 and 180--%>
                                                                        <asp:RegularExpressionValidator CssClass="in-validate" ValidationGroup="vProduct" ID="RegularExpressionValidator1" runat="server" ValidationExpression="^(\+|-)?(?:90(?:(?:\.0{1,15})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,15})?))$" ControlToValidate="txtLatitude" ErrorMessage="Invalid Latitude"></asp:RegularExpressionValidator>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <label class="required">Longitude</label>
                                                                        <asp:TextBox runat="server" ID="txtLongitude" MaxLength="20" autocomplete="off" placeholder="Longitude" ToolTip="Longitude" ClientIDMode="Static"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ValidationGroup="vProduct" runat="server" ID="RequiredFieldValidator25" ControlToValidate="txtLongitude"
                                                                            ErrorMessage="Enter Longitude!" SetFocusOnError="true" />
                                                                        <asp:FilteredTextBoxExtender runat="server" TargetControlID="txtLongitude" ValidChars="-.0123456789" FilterMode="ValidChars"></asp:FilteredTextBoxExtender>
                                                                        <asp:RegularExpressionValidator CssClass="in-validate" ValidationGroup="vProduct" ID="RegularExpressionValidator3" runat="server" ValidationExpression="^(\+|-)?(?:180(?:(?:\.0{1,15})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,15})?))$" ControlToValidate="txtLongitude" ErrorMessage="Invalid Longitude"></asp:RegularExpressionValidator>
                                                                    </div>
                                                                    <label class="input-label dis-block">&nbsp;</label>
                                                                    <a type="button" class="btn-main btn-info btn-map" data-toggle="modal" data-target="#MapModal" onclick="ItemsMap('');">Find On Map <i class="fa fa-map-marker"></i></a>

                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 mb5">
                                                                <label class="required">Description</label>
                                                                <uc1:HTMLEditor ID="txtDescription" runat="server" />
                                                                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" CssClass="displaynone"
                                                        ValidationGroup="vProduct" ControlToValidate="txtDescription" ErrorMessage="Enter Description"></asp:RequiredFieldValidator>--%>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label>Source URL</label>
                                                                <asp:TextBox runat="server" ID="txtSourceURL"></asp:TextBox>
                                                            </div>
                                                        </div>



                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="panel panel-default" id="Prices" runat="server" visible="false">
                                            <div class="panel-heading" role="tab" id="heading3">
                                                <h4 class="panel-title">
                                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" onclick="SetStatus('2')">Prices</a>
                                                </h4>
                                            </div>

                                            <div id="collapse2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-md-3 mb5">
                                                                <label id="lblShippingCompany" class="required">Shipping Company</label>
                                                                <asp:DropDownList runat="server" ID="ddlShippingCompany" AppendDataBoundItems="true"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="ddlShippingCompany" InitialValue="0" ErrorMessage="Select Shipping Company"></asp:RequiredFieldValidator>
                                                            </div>


                                                            <div class="col-md-3 mb5">
                                                                <label class="required">Weight (gms)</label>
                                                                <asp:TextBox runat="server" ID="txtWeight" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtWeight" ErrorMessage="Enter Weight"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-md-3 mb5">
                                                                <label class="required">Cost</label>
                                                                <asp:TextBox runat="server" ID="txtSupplierPrice" onchange="CalCRPrice();CalCODPrice();CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtSupplierPrice" ErrorMessage="Enter Supplier Price"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-3 mb5" style="display: none">
                                                                <label>Total Cost</label>
                                                                <asp:TextBox runat="server" ID="txtTotalCost" ClientIDMode="Static" Enabled="false" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                            </div>

                                                            <div class="col-md-3 mb5">
                                                                <label class="required">CR Margin %</label>
                                                                <asp:TextBox runat="server" ID="txtCRMargin" onchange="CalCRPrice();CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtCRMargin" ErrorMessage="Enter CR Margin"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label>CR Price</label>
                                                                <asp:TextBox runat="server" ID="txtCRPrice" ClientIDMode="Static" Enabled="false" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label class="required">COD Margin %</label>
                                                                <asp:TextBox runat="server" ID="txtCODMargin" onchange="CalCODPrice();CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtCODMargin" ErrorMessage="Enter COD Margin"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-md-3 mb5">
                                                                <label>COD Price</label>
                                                                <asp:TextBox runat="server" ID="txtCODPrice" ClientIDMode="Static" Enabled="false" MaxLength="10" onkeypress="return isDecimal(event,this);"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label class="required">VAT Percent %</label>
                                                                <asp:TextBox runat="server" ID="txtVATPercent" onchange="CalVAT(this);" ClientIDMode="Static" MaxLength="10" onkeypress="return isDecimal(event,this);" Text="0"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtVATPercent" ErrorMessage="Enter VAT Percent"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-md-3 mb5">
                                                                <label class="required">VAT</label>
                                                                <asp:TextBox runat="server" ID="txtVAT" onchange="CalVAT(this);" ClientIDMode="Static" MaxLength="10" Enabled="false" onkeypress="return isDecimal(event,this);" Text="0"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" CssClass="displaynone"
                                                                    ValidationGroup="vProduct" ControlToValidate="txtVAT" ErrorMessage="Enter VAT"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default" id="Brochure" runat="server" visible="false">
                                            <div class="panel-heading" role="tab" id="heading2">
                                                <h4 class="panel-title">
                                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" onclick="SetStatus('3')">PDF Brochure</a>
                                                </h4>
                                            </div>

                                            <div id="collapse3" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <fieldset>
                                                                <asp:Panel ID="pnlBrochure" runat="server">
                                                                    <div class="photoPad">
                                                                        <div class="photo div-clear-photo">
                                                                            <asp:HyperLink ID="hlViewBrochure" runat="server" ClientIDMode="Static" Target="_blank">
                                                                                <asp:Image ID="imgBrochure" ClientIDMode="Static" runat="server" Width="192px" ImageUrl="~/images/noDoc.png" />
                                                                            </asp:HyperLink>
                                                                            <asp:TextBox ID="HiddenBrochure" runat="server" ClientIDMode="Static" Style="display: none"></asp:TextBox>
                                                                            <div class="update-progress-img">
                                                                                <asp:Image ID="imgLoader" runat="server" ClientIDMode="Static" ImageUrl="~/images/image-uploader.gif" Style="display: none; width: 20px" />
                                                                            </div>
                                                                            <asp:LinkButton ID="btnClear" CssClass="btn-clear-photo" runat="server" OnClick="ClearBrochure"><i class="ti-close"></i></asp:LinkButton>
                                                                        </div>
                                                                        <div class="clear">
                                                                        </div>
                                                                        <asp:Panel ID="pnlfuPhoto" runat="server" CssClass="photo-upload-box_inactive "></asp:Panel>
                                                                        <div class="photo-upload-box">
                                                                            <span>Upload Brochure</span>
                                                                            <asp:AsyncFileUpload ID="fuPhoto" CssClass="photo-upload-box-input inputfile-1" runat="server" OnUploadedComplete="BrochureUploaded"
                                                                                OnClientUploadComplete="UploadComplete" OnClientUploadError="UploadError" OnClientUploadStarted="UploadStarted"
                                                                                FailedValidation="False" />
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                    <asp:Panel ID="pnlPhotos" runat="server" ClientIDMode="Static" Style="display: none">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="heading4">
                                                <h4 class="panel-title">
                                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse4" onclick="SetStatus('4')">Photos</a>
                                                </h4>
                                            </div>

                                            <div id="collapse4" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:Panel ID="pnlUpload" runat="server" ClientIDMode="Static">
                                                                <asp:LinkButton SkinID="btn-green" ID="lbUpload" runat="server" OnClientClick="topFunction();">Upload Photos<i class="fa-plus fa"></i></asp:LinkButton>

                                                                <asp:ModalPopupExtender ID="mdu" runat="server" BackgroundCssClass="modalBackground" TargetControlID="lbUpload"
                                                                    PopupControlID="pnlFileUpload" ClientIDMode="AutoID" CancelControlID="lbClosePopUp" Enabled="True">
                                                                </asp:ModalPopupExtender>
                                                                <asp:Panel ID="pnlFileUpload" runat="server" CssClass="modalPopup-uploader">
                                                                    <div class="modal-header">
                                                                        <asp:LinkButton ID="lbClosePopUp" SkinID="btn-close" runat="server" CausesValidation="false"><i class="ti-close icon-close""></i></asp:LinkButton>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <asp:AjaxFileUpload ID="AjaxFileUpload1" ClientIDMode="static" runat="server" OnClientUploadComplete="uploadFileComplete"
                                                                            MaximumNumberOfFiles="10" AllowedFileTypes="jpeg,jpg,png,gif" />
                                                                        <asp:HiddenField ID="hfPhotoNames" ClientIDMode="Static" runat="server" />
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <div id="okDiv" runat="server">
                                                                            <div class="clear"></div>
                                                                            <div class="col-md-12 zero">
                                                                                <ul class="btn-uls mb0">
                                                                                    <li class="btn-lis mb0 mt2">
                                                                                        <asp:LinkButton ID="lbOK" runat="server" CausesValidation="false" OnClientClick="bindUploadedFilesLabel(); return false;" CssClass="btn-main btn-green">Ok<i class="ti-check"></i></asp:LinkButton>
                                                                                    </li>
                                                                                    <li id="divSubmit" class="btn-lis mb0 mt2" style="display: none">
                                                                                        <asp:LinkButton ID="lbSubmit" runat="server" CausesValidation="false" Text="Submit" OnClick="AddFiles"></asp:LinkButton>
                                                                                        <asp:HiddenField ID="lblUploadedFilesDetails" runat="server" ClientIDMode="Static" />
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>


                                                            </asp:Panel>
                                                            <div class="col-md-6 p0 mt20">
                                                                <div class="table-responsive">
                                                                    <asp:GridView ID="gvItemsImgs" CssClass="table uploader-table" runat="server" ClientIDMode="AutoID" AutoGenerateColumns="False" AllowSorting="true">
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
                                                                                    <asp:DropDownList ID="ddlImgType" runat="server">
                                                                                        <asp:ListItem Value="C">Current</asp:ListItem>
                                                                                        <asp:ListItem Value="O">Original</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Delete">
                                                                                <ItemTemplate>
                                                                                    <a href="#" class="btni-xxxs btn-red brd-50" id="hrefDeleteImg" title="Delete Img"
                                                                                        onclick="ShowConfirmPopup('<%# CType(Container, GridViewRow).FindControl("mpConfirmDeleteImg").ClientID.ToString%>','<%# CType(Container, GridViewRow).FindControl("pnlConfirmExtenderDeleteImg").ClientID.ToString%>');return false;"><i class="fa fa-trash"></i></a>
                                                                                    <asp:HiddenField ID="hfDeleteImg" runat="server" />
                                                                                    <asp:ModalPopupExtender ID="mpConfirmDeleteImg" runat="server" PopupControlID="pnlConfirmExtenderDeleteImg" TargetControlID="hfDeleteImg"
                                                                                        CancelControlID="lbNoDeleteImg" BackgroundCssClass="modalBackground">
                                                                                    </asp:ModalPopupExtender>
                                                                                    <asp:Panel ID="pnlConfirmExtenderDeleteImg" runat="server" CssClass="modal-n modalPopup" align="center" Style="display: none">
                                                                                        <div class="header">
                                                                                            Confirmation Message
                                                                                        </div>
                                                                                        <div class="body">
                                                                                            <label>Do you want to delete this Img ?</label>
                                                                                        </div>

                                                                                        <div class="footer">
                                                                                            <ul class="btn-uls mb0">
                                                                                                <li class="btn-lis">
                                                                                                    <asp:LinkButton ID="lbYesDeleteImg" runat="server" CssClass="btn-main btn-green" CommandArgument='<%# Eval("Id") %>' OnClick="DeleteImg">Yes<i class="ti-check"></i></asp:LinkButton></li>
                                                                                                <%--OnClick="Delete"--%>
                                                                                                <li class="btn-lis">
                                                                                                    <a id="lbNoDeleteImg" class="btn-main btn-red" onclick="CloseConfirmPopup('<%# CType(Container, GridViewRow).FindControl("mpConfirmDeleteImg").ClientID.ToString%>');return false;">No<i class="ti-close"></i></a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </asp:Panel>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>


                                                                        </Columns>
                                                                        <EmptyDataTemplate>
                                                                            <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp No Data Found
                                                                        </EmptyDataTemplate>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



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
