<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Contact_Us.aspx.vb" Inherits="Contact_Us" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server"></asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <nav class="breadcrumbs-container hide-for-small-only hide-for-medium-only cat_2718" aria-label="You are here:" role="navigation">
        <div class="grid-container">
            <div class="grid-x">
                <ul class="breadcrumbs cell small-12">
                    <li>
                        <a href="Home.aspx"><span>الصفحة الرئيسية</span></a>
                    </li>
                    <li>
                        <span class="current">اتصل بنا</span>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="grid-container margin-top-3">
        <asp:ValidationSummary CssClass="ValidationSummary" ID="vsUsers" DisplayMode="BulletList" ValidationGroup="vUser" EnableClientScript="true" runat="server" />
        <asp:Label Text="" ID="lblRes" runat="server" />
        <div class="grid-x grid-padding-x">
            <div class="small-12 large-5 cell">
                <h1>اتصل بنا</h1>
                <div class="row margin-top-3">
                    <div class="col-md-12">
                        <div class="info-media">
                            <div class="media-icon">
                                <i class="fa fa-map-location-dot"></i>
                            </div>
                            <div class="media-body">
                                <h4 class="info-title">عنوان المكتب:</h4>
                                <p class="info-text">25 شارع سيد درويش, القاهرة, مصر</p>
                            </div>
                        </div>
                        <div class="info-media">
                            <div class="media-icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="media-body">
                                <h4 class="info-title">للمساعدة اتصل بنا:</h4>
                                <p class="info-text">
                                    <a href="tel:+20123456789">+20 123 456 7890</a>
                                </p>
                                <p class="info-text">
                                    <a href="tel:+20123456789">+20 198 765 4321</a>
                                </p>
                            </div>
                        </div>
                        <div class="info-media">
                            <div class="media-icon">
                                <i class="fa-regular fa-envelope"></i>
                            </div>
                            <div class="media-body">
                                <h4 class="info-title">البريد الالكتروني:</h4>
                                <p class="info-text">
                                    <a href="mailto:info@info.com">info@info.com</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="small-12 large-7 cell static-pages">
                <h1>اترك رسالة</h1>
                <div class="grid-x margin-top-3">
                    <!---->
                    <div class="cell small-12 medium-12 margin-bottom-2">
                        <div class="textfield">
                            <asp:TextBox runat="server" ID="txtName" MaxLength="100" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="vUser" ControlToValidate="txtName"
                                ErrorMessage="Please Enter Your Name" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>

                            <label>الاسم او اللقب *</label>
                        </div>
                    </div>
                    <div class="cell small-12">
                        <div class="textfield">
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="100"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmail"
                                CssClass="valid-inp" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                Display="Dynamic" ErrorMessage="Invalid Email" ValidationGroup="vUser" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="vUser" ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter Your Email" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                            <label>البريد الالكتروني *</label>
                        </div>
                    </div>
                    <div class="cell small-12 input-textarea">
                        <asp:TextBox ID="txtSubject" runat="server" MaxLength="200"
                            placeholder="اكتب عنوان"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="vUser"
                            ControlToValidate="txtSubject"
                            ErrorMessage="Please Enter Subject" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="cell small-12 input-textarea">
                        <asp:TextBox ID="txtMessage" runat="server" MaxLength="500"
                            Rows="6" Style="margin-bottom: 0.625rem;"
                            placeholder="اكتب طلبك"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="vUser"
                            ControlToValidate="txtMessage"
                            ErrorMessage="Please Enter Message" CssClass="valid-inp" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%-- <textarea required="required" name="txtMessage" rows="6" runat="server"
                            placeholder="اكتب طلبك" class="" style="margin-bottom: 0.625rem;"></textarea>--%>
                    </div>
                    <div class="cell small-12 float-right" style="margin-bottom: 20px;">
                        <asp:Button ID="btnSend" runat="server" CssClass="button small shop expanded"
                            Text="ارسال" ValidationGroup="vUser"
                            OnClick="Send" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="button small shop expanded"
                            Text="الغاء" OnClick="Clear" />
                        <%--<input type="submit" id="submit" value="ارسال" class="button small shop expanded">--%>
                    </div>
                    <!---->
                </div>
            </div>

            <div class="small-12 large-12 cell margin-top-3 margin-bottom-3">
                <%--<img src="images/Google_Maps.png" class="thumbnail" />--%>
                <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d110546.80232436104!2d31.408727724833565!3d30.019996673511052!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1s25%20Sayed%20Darwish%2C%20New%20Cairo%201!5e0!3m2!1sen!2seg!4v1704221855701!5m2!1sen!2seg" 
                    width="100%"  class="thumbnail"height="450" style="border: 0;" allowfullscreen="" loading="lazy" 
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server"></asp:Content>
