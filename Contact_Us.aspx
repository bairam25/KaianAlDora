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
                            <input required="required" type="text" name="name" class="">
                            <label>الاسم او اللقب *</label>
                        </div>
                    </div>
                    <div class="cell small-12">
                        <div class="textfield">
                            <input required="required" type="email" name="email" class="">
                            <label>البريد الالكتروني *</label>
                        </div>
                    </div>
                    <div class="cell small-12 input-textarea">
                        <textarea required="required" name="text" rows="6" placeholder="اكتب طلبك" class="" style="margin-bottom: 0.625rem;"></textarea>
                    </div>
                    <div class="cell small-12 float-right" style="margin-bottom: 20px;">
                        <input type="submit" id="submit" value="ارسال" class="button small shop expanded">
                    </div>
                    <!---->
                </div>
            </div>

            <div class="small-12 large-12 cell margin-top-3 margin-bottom-3">
                <img src="images/Google_Maps.png" class="thumbnail" />
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server"></asp:Content>
