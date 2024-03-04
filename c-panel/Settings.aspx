<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Settings.aspx.vb" Inherits="Settings" %>

<%@ Register Src="UserControls/HTMLEditor.ascx" TagPrefix="uc1" TagName="HTMLEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>الإعدادات</title>
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

    <!-- Resource script -->
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/respond.js" type="text/javascript"></script>
    <script src="js/matchmedia.polyfill.js" type="text/javascript"></script>
    <script src="js/sidebar-nav.min.js" type="text/javascript"></script>
    <script src="JSCode/KeypressValidators.js" type="text/javascript"></script>
    <script src="JSCode/Popup.js" type="text/javascript"></script>
    <script src="JSCode/UploadIconImg.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" autocomplete="off">
        <asp:ToolkitScriptManager ID="TKSM" runat="server" ScriptMode="Release">
            <Services>
                <asp:ServiceReference Path="~/WebService.asmx" />
            </Services>
        </asp:ToolkitScriptManager>

        <asp:UpdatePanel ID="up2" runat="server">
            <ContentTemplate>
                <!--============================ Page-header =============================-->
                <div class="page-header pb-2 mb-4">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="page-header-title">
                                    <h5 class="m-b-10">
                                        <asp:Label ID="lblFormName" runat="server">الإعدادات</asp:Label>
                                    </h5>
                                </div>
                                <div class="d-flex">
                                    <ul class="breadcrumb flex-1 bg-unset p-0 m-0">
                                        <li class="breadcrumb-item"><a href="Items.aspx"><i class="fa fa-home"></i></a></li>
                                        <li class="breadcrumb-item">الإعدادات</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--============================ Page-content =============================-->
                <div class="page-load">
                    <asp:UpdateProgress ID="upg" runat="server" AssociatedUpdatePanelID="up2">
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
                    <div class="card-body pb-2" id="divPgPanel" runat="server">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Panel ID="pgPanel" CssClass="input-in" runat="server">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">النتائج لكل صفحة</span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control ltr" ID="ddlPager" OnSelectedIndexChanged="PageSize_Changed" AutoPostBack="true">
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
                                        <asp:TextBox ID="txtSearchAll" CssClass="form-control" AutoPostBack="true" placeholder="بحث" OnTextChanged="FillDataTypes" runat="server" ToolTip="بحث"></asp:TextBox>
                                        <asp:LinkButton runat="server" CssClass="clear-search" ID="cmdClear" title="Clear" OnClientClick="$('#txtSearchAll').val('');">&times;</asp:LinkButton>
                                        <asp:AutoCompleteExtender ID="acebasicSearch" BehaviorID="txtsaerchbasic" runat="server" FirstRowSelected="false"
                                            EnableCaching="false" Enabled="True" MinimumPrefixLength="1" CompletionListCssClass="acl"
                                            CompletionListItemCssClass="li" CompletionListHighlightedItemCssClass="li-hover"
                                            ServiceMethod="GetLookupDataTypes" ServicePath="~/WebService.asmx" TargetControlID="txtSearchAll"
                                            CompletionInterval="500">
                                        </asp:AutoCompleteExtender>

                                        <asp:Button ID="btnSearch" runat="server" Style="display: none" ClientIDMode="Static" OnClick="FillDataTypes" />
                                        <span class="input-group-append">
                                            <asp:LinkButton ID="lbSearchIcon" runat="server" CssClass="btn btn-primary" type="button" OnClick="FillDataTypes"><i class="feather icon-search"></i></asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body pt-2">
                        <div class="p-lr-3" id="divGvPanel" runat="server">
                            <div class="table-responsive">
                                <asp:GridView ID="gvDataTypes" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" AllowSorting="true" OnSorting="gvDataTypes_Sorting" AllowPaging="true"
                                    PageSize='<%# ddlPager.SelectedValue  %>' OnPageIndexChanging="gvDataTypes_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="النوع" SortExpression="Type" HeaderStyle-CssClass="upnDownArrow" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="الوصف" SortExpression="description" HeaderStyle-CssClass="upnDownArrow">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldescription" runat="server" Text='<%# Eval("description")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="عرض">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbShow" CssClass="btn btn-primary" runat="server" CommandArgument='<%# Eval("Id")%>' OnClick="ShowValues" ToolTip="عرض">
                                                   <i class="feather icon-eye"></i> 
                                                </asp:LinkButton>
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

                        <asp:Panel runat="server" ID="pnlTypeValues" Visible="false">
                            <div class="col-md-12">
                                <div class="row border-bottom pb-2 mb-2">
                                    <div class="col-md-6 p-0">
                                        <div class="input-in">
                                            <asp:LinkButton ID="lbBack" runat="server" OnClick="Back" CssClass="btn btn-primary" ToolTip="Back">عودة<i class="fa fa-reply"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-md-6 p-0 text-right">
                                        <div class="input-in">
                                            <asp:LinkButton ID="lbNewValue" runat="server" OnClick="NewValue" CssClass="btn btn-primary" ToolTip="اضافة جديد">اضافة جديد<i class="feather icon-plus"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 p-lr-3">
                                        <h5>
                                            <asp:Label ID="lblTypesName" runat="server"></asp:Label>
                                        </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="p-lr-3">
                                <asp:Label ID="lblLookupId" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblType" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblLookupValueId" runat="server" Visible="false"></asp:Label>
                                <asp:ValidationSummary CssClass="validation-message" runat="server" ID="vgroup" ValidationGroup="vSettings" />
                            </div>

                            <asp:Panel ID="pnlGvValues" runat="server" Visible="False">
                                <asp:HiddenField ID="DataTypesSortExp" runat="server" />
                                <asp:HiddenField ID="ValuesSortExp" runat="server" />
                                <div class="p-lr-3">
                                    <div class="table-responsive">
                                        <asp:GridView ID="gvValues" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"
                                            AllowSorting="true" OnSorting="gvValues_Sorting" AllowPaging="true" PageSize="10" OnPageIndexChanging="GVValues_PageIndexChanging">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Color" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color")%>' Visible="false"></asp:Label>
                                                        <asp:Panel ID="pnlColor" runat="server" Height="12" Width="30">
                                                        </asp:Panel>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Code" SortExpression="Code" HeaderStyle-CssClass="upnDownArrow" Visible ="false" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCode" runat="server" Text='<%# Eval("Code")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="القيمة" SortExpression="Value" HeaderStyle-CssClass="upnDownArrow">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblValue" runat="server" Text='<%# Eval("Value")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="الصورة">
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgICON" Width="50px" Height="50px" ImageUrl='<%# Eval("Icon")%>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="النوع الأساسي">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParentType" runat="server" Text='<%# Eval("ParentType")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="تعديل">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbUpdate" CssClass="btn btn-primary" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="Edit" ToolTip="تعديل">
                                                            <i class="feather icon-edit"></i>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="حذف">
                                                    <ItemTemplate>
                                                        <a href="#" id="hrefDelete" class="btn btn-danger" title="حذف"
                                                            onclick="ShowConfirmPopup('<%# CType(Container, GridViewRow).FindControl("mpConfirmDelete").ClientID.ToString%>','<%# CType(Container, GridViewRow).FindControl("pnlConfirmExtenderDelete").ClientID.ToString%>');return false;"><i class="feather icon-trash-2"></i></a>
                                                        <asp:HiddenField ID="hfDelete" runat="server" />
                                                        <asp:ModalPopupExtender ID="mpConfirmDelete" runat="server" PopupControlID="pnlConfirmExtenderDelete" TargetControlID="hfDelete"
                                                            CancelControlID="lbNoDelete" BackgroundCssClass="modalBackground">
                                                        </asp:ModalPopupExtender>
                                                        <asp:Panel ID="pnlConfirmExtenderDelete" runat="server" CssClass="rodal rodal-fade-enter" align="center" Style="display: none">
                                                            <div class="rodal-mask"></div>
                                                            <div class="rodal-dialog rodal-slideUp-enter" style="width: 300px;">
                                                                <div class="card">
                                                                    <div class="card-header p-2">
                                                                        <h5 class="card-title m-0">رسالة تأكيد</h5>
                                                                    </div>
                                                                    <div class="body p-2">
                                                                        <label>هل أنت متأكد أنك تريد حذف هذا السجل ؟</label>
                                                                    </div>
                                                                    <div class="footer">
                                                                        <div class="input-in">
                                                                            <asp:LinkButton ID="lbYesDelete" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("Id") %>' OnClick="Delete">نعم<i class="fa fa-check"></i></asp:LinkButton>
                                                                        </div>
                                                                        <div class="input-in">
                                                                            <a id="lbNoDelete" class="btn btn-danger" onclick="CloseConfirmPopup('<%# CType(Container, GridViewRow).FindControl("mpConfirmDelete").ClientID.ToString%>');return false;">لا<i class="fa fa-times"></i></a>
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
                                                    لا توجد بيانات
                                                </div>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlNewValue" runat="server" CssClass="p-lr-3" Visible="False">
                                <div class="row mb-4">
                                    <div class="col-md-9">
                                        <div class="card m-0 h-100">
                                            <div class="card-header">
                                                <h5 class="card-title">التفاصيل</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="form-group col-md-4 input-in">
                                                            <label class="form-label required">القيمة</label>
                                                            <asp:TextBox ID="txtValue" runat="server" CssClass="form-control" MaxLength="200" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="valid-inp"
                                                                ControlToValidate="txtValue" ErrorMessage="ادخل القيمة" ValidationGroup="vSettings"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form-group col-md-4 input-in" id="divCode" runat="server" visible="false">
                                                            <label class="form-label">Code</label>
                                                            <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" MaxLength="10" onkeypress="return isString(event);" onkeyup="ValidateChars(this);"></asp:TextBox>

                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                                    ControlToValidate="txtCode" ErrorMessage="Enter Code" ValidationGroup="vSettings"></asp:RequiredFieldValidator>--%>
                                                        </div>
                                                        <div class="form-group col-md-4 input-in">
                                                            <asp:Panel ID="pnlRType" runat="server" CssClass="col-md-12 col-sm-12">
                                                                <label class="form-label">النوع الأساسي</label>
                                                                <asp:DropDownList ID="ddlRType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                            </asp:Panel>
                                                            <div class="col-md-12" style="padding: 0" id="divColor" runat="server" visible="false">
                                                                <label for="txtColor">Color</label>
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtColor" SkinID="txt-color" runat="server" MaxLength="20" onkeydown="return false;" />
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-paint-brush icon-color"></i>
                                                                        <asp:TextBox ID="txtColorSample" SkinID="sample-color" ReadOnly="true" runat="server" />
                                                                    </span>
                                                                    <asp:ColorPickerExtender
                                                                        ID="txtCardColor_ColorPickerExtender" TargetControlID="txtColor" SampleControlID="txtColorSample" Enabled="True" runat="server">
                                                                    </asp:ColorPickerExtender>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-md-12 input-in">
                                                            <label class="form-label">الوصف</label>
                                                            <%--<asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine"></asp:TextBox>--%>
                                                            <uc1:HTMLEditor ID="txtDescription" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 text-right p-0">
                                                    <div class="input-in">
                                                        <span class="frame-btn">
                                                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" ValidationGroup="vSettings" OnClick="Save" UseSubmitBehavior="false" OnClientClick="SaveClick(this,'vSettings');" Text="حفظ" />
                                                            <label class="fa fa-check" for="btnSave"></label>
                                                        </span>
                                                    </div>
                                                    <div class="input-in">
                                                        <asp:Panel runat="server" ID="pnlCancel">
                                                            <a href="#" title="Cancel" class="btn btn-danger" data-toggle="modal" data-placement="bottom" data-original-title="إلغاء"
                                                                onclick="ShowConfirmPopup('mpConfirmCancel','pnlConfirmExtenderCancel');return false;">إلغاء<i class="fa fa-times"></i></a>
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
                                                                        <h5 class="card-title border-0 m-0 p-0">رسالة تأكيد</h5>
                                                                    </div>
                                                                    <div class="body p-2">
                                                                        <label>تأكيد الإلغاء</label>
                                                                    </div>
                                                                    <div class="footer">
                                                                        <div class="input-in">
                                                                            <asp:LinkButton ID="lbYesCancel" runat="server" CssClass="btn btn-success" OnClick="Cancel" CausesValidation="false">نعم<i class="fa fa-check"></i></asp:LinkButton>
                                                                        </div>
                                                                        <div class="input-in">
                                                                            <asp:LinkButton ID="lbNoCancel" runat="server" CssClass="btn btn-danger" OnClientClick="CloseConfirmPopup('mpConfirmCancel');return false;">لا<i class="fa fa-times"></i></asp:LinkButton>
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

                                    <div class="col-md-3 pl-2">
                                        <div class="card m-0 h-100">
                                            <div class="card-header">
                                                <h5 class="card-title">الشعار</h5>
                                            </div>
                                            <div class="card-body">
                                                <div id="divPic" runat="server">
                                                    <div class="custom-file-container position-relative" data-upload-id="myFirstImage">
                                                        <div class="logo_photo" title="Logo" runat="server" id="previewDiv">
                                                            <asp:Image ID="imgIcon" ClientIDMode="Static" Style="max-height: 100%; max-width: 100%" runat="server" ImageUrl="~/images/noimage.jpg" />
                                                        </div>

                                                        <asp:TextBox ID="txtHiddenPassword" runat="server" ClientIDMode="Static" Style="display: none;"></asp:TextBox>
                                                        <asp:TextBox ID="HiddenIcon" runat="server" ClientIDMode="Static" Style="display: none"></asp:TextBox>
                                                        <asp:Panel ID="pnlfuLogo" runat="server" CssClass="photo-upload-box">
                                                            <span>اضافة شعار <i class="fa fa-camera ml-1"></i></span>
                                                            <asp:AsyncFileUpload ID="fuPhoto" ClientIDMode="Static" runat="server" CssClass="photo-upload-box-input" OnUploadedComplete="PhotoUploaded"
                                                                OnClientUploadComplete="UploadPhotoCompleted" OnClientUploadError="UploadError" OnClientUploadStarted="UploadStarted" FailedValidation="False" />

                                                            <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
                                                        </asp:Panel>
                                                        <div class="update-progress-img">
                                                            <asp:Image ID="imgIconLoader" runat="server" ClientIDMode="Static" ImageUrl="~/images/image-uploader.gif" Style="display: none; width: 100%" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </asp:Panel>
                        </asp:Panel>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
