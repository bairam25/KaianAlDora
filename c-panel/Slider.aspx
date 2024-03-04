<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Slider.aspx.vb" Inherits="Slider" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>شريط التمرير</title>
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
                                    <h5 class="m-b-10">شريط التمرير</h5>
                                </div>
                                <div class="d-flex">
                                    <ul class="breadcrumb flex-1 bg-unset p-0 m-0">
                                        <li class="breadcrumb-item"><a href="Items.aspx"><i class="fa fa-home"></i></a></li>
                                        <li class="breadcrumb-item">شريط التمرير</li>
                                    </ul>
                                    <asp:Panel ID="pnlConfirm" runat="server" Visible="false">
                                        <div class="input-in">
                                            <span class="frame-btn">
                                                <asp:Button ID="cmdSave" CssClass="btn btn-success" ValidationGroup="vSlider" OnClick="Save" runat="server" UseSubmitBehavior="false" OnClientClick="SaveClick(this,'vSlider');" Text="حفظ" ToolTip="حفظ" />
                                                <label class="fa fa-check" for="cmdSave"></label>
                                            </span>
                                        </div>
                                        <div class="input-in">
                                            <asp:Panel runat="server" ID="pnlCancel">
                                                <a id="cmdCancel" href="#" title="Cancel" class="btn btn-danger" data-toggle="modal" data-placement="bottom" data-original-title="إلغاء"
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
                                                            <label>هل أنت متأكد أنك تريد إلغاء ؟</label>
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
                                    <div class="input-in">
                                        <asp:LinkButton ID="cmdNew" runat="server" CssClass="btn btn-primary" OnClick="Add" ToolTip="اضافة جديد">اضافة جديد<i class="feather icon-plus"></i></asp:LinkButton>
                                    </div>
                                    <div class="input-in col-md-6">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" type="text" placeholder="البحث حسب العنوان" AutoPostBack="true" OnTextChanged="FillGrid" onkeypress="return isString(event);" onkeyup="ValidateChars(this);ShowHideClearSearch(this.value);" ToolTip="البحث حسب العنوان"></asp:TextBox>

                                            <asp:LinkButton runat="server" ID="cmdClear" CssClass="clear-search" title="مسح" OnClientClick="$('#txtSearch').val('');">&times;</asp:LinkButton>
                                            <asp:Button ID="btnSearch" runat="server" Style="display: none" ClientIDMode="Static" OnClick="FillGrid" />
                                            <span class="input-group-append">
                                                <asp:LinkButton ID="cmdSearch" runat="server" CssClass="btn btn-primary" type="button" OnClick="FillGrid"><i class="feather icon-search"></i></asp:LinkButton>
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
                                    <asp:GridView ID="gvSlider" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="false" AllowSorting="true" OnPageIndexChanging="gvSlider_PageIndexChanging"
                                        AllowPaging="true" PageSize='<%# ddlPager.SelectedValue  %>' OnSorting="gv_Sorting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="العنوان" SortExpression="Title" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Visible="false" Text='<%# Eval("Id")%>'></asp:Label>
                                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="الوصف" SortExpression="Description" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCaption" runat="server" Text='<%# Eval("Description")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="URL" SortExpression="URL" Visible="false" HeaderStyle-CssClass="upnDownArrow">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblURL" runat="server" Text='<%# Eval("MediaURL")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="الصورة" SortExpression="Photo">
                                                <ItemTemplate>
                                                    <a href='<%# IIf(Eval("MediaURL").ToString.ToLower.Contains(".mp4"), "Images/video.png", Eval("MediaURL").ToString.Replace("~/", "../"))%>' onclick="ImagePreview(this.href);return false;">
                                                        <asp:Image ID="imgPhoto" CssClass="td-img img-thumbnail" runat="server" ImageUrl='<%# IIf(Eval("MediaURL").ToString.ToLower.Contains(".mp4"), "Images/video.png", Eval("MediaURL"))%>' Width="50px" Height="40px" /></a>
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
                                            <asp:TemplateField HeaderText="تعديل">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CssClass="btn btn-primary" runat="server" CommandArgument='<%# Eval("ID")%>' OnClick="Edit"><i class="feather icon-edit"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="حذف" Visible="false">
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
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnlLastupdate">
                    </asp:Panel>
                </div>

                <asp:Panel ID="pnlForm" runat="server" Visible="false" CssClass="col-md-12 p-0">
                    <div class="row mb-4">
                        <div class="col-md-9">
                            <div class="card m-0 h-100">
                                <div class="card-header">
                                    <h5 class="card-title">التفاصيل</h5>
                                </div>
                                <div class="card-body">
                                    <div class="p-lr-3">
                                        <asp:ValidationSummary ID="ValidationSummary" CssClass="validation-message" DisplayMode="BulletList" ValidationGroup="vSlider" EnableClientScript="true" runat="server" />
                                        <asp:Label ID="lblPhotoSlider" runat="server" Visible="false"></asp:Label>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="form-group col-md-4 input-in">
                                                <label class="form-label required">الترتيب</label>
                                                <asp:TextBox runat="server" ID="txtOrderNo" CssClass="form-control" MaxLength="2" onkeypress="return isNumber(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="valid-inp"
                                                    ValidationGroup="vSlider" ControlToValidate="txtOrderNo" ErrorMessage="Enter display order" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group col-md-4 input-in">
                                                <label class="form-label">العنوان</label>
                                                <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" MaxLength="400"></asp:TextBox>
                                            </div>

                                            <div class="form-group col-md-4 input-in" runat="server" visible="false">
                                                <label class="form-label">URL</label>
                                                <asp:TextBox runat="server" ID="txtURL" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-12 input-in">
                                                <label class="form-label">الوصف</label>
                                                <asp:TextBox runat="server" ID="txtCaption" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 pl-2">
                            <div class="card m-0 h-100">
                                <div class="card-header">
                                    <h5 class="card-title">الصورة</h5>
                                </div>
                                <div class="card-body">
                                    <asp:Panel ID="pnlTLCopy" runat="server" CssClass="custom-file-container position-relative">
                                        <asp:HyperLink ID="hlViewSlider" CssClass="logo_photo" runat="server" ClientIDMode="Static" Target="_blank">
                                            <asp:Image ID="imgSlider" ClientIDMode="Static" runat="server" Style="max-height: 100%; max-width: 100%" ImageUrl="~/images/noDoc.png" />
                                        </asp:HyperLink>

                                        <asp:TextBox ID="HiddenSliderImg" runat="server" ClientIDMode="Static" Style="display: none"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="valid-inp"
                                            ValidationGroup="vSlider" ControlToValidate="HiddenSliderImg" ErrorMessage="Upload Photo" Display="Dynamic"></asp:RequiredFieldValidator>

                                        <asp:Panel ID="pnlfuPhoto" runat="server" CssClass="photo-upload-box">
                                            <span>اضافة صورة <i class="fa fa-camera ml-1"></i></span>
                                            <asp:AsyncFileUpload ID="fuPhoto" CssClass="photo-upload-box-input" runat="server" OnUploadedComplete="SliderPhotoUploaded"
                                                OnClientUploadComplete="UploadComplete" OnClientUploadError="UploadError" OnClientUploadStarted="UploadStarted"
                                                FailedValidation="False" />

                                            <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
                                        </asp:Panel>
                                        <div class="update-progress-img">
                                            <asp:Image ID="imgLoader" runat="server" ClientIDMode="Static" ImageUrl="~/images/image-uploader.gif" Style="display: none;" />
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <!-- The Modal -->
                <div id="previewImage" class="previewImage">

                    <!-- The Close Button -->
                    <a class="Myclose" onclick='closeImgPopup();'>&times;</a>

                    <!-- Modal Content (The Image) -->
                    <img class="previewImage-content" id="img01" style="max-height: 515px;" />
                </div>
                <script src="JSCode/imgPreview.js"></script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
