<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="About_Us.aspx.vb" Inherits="About_Us" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server"></asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <nav class="breadcrumbs-container hide-for-small-only hide-for-medium-only cat_2718" aria-label="You are here:" role="navigation">
        <div class="grid-container">
            <div class="grid-x">
                <ul class="breadcrumbs cell small-12">
                    <li>
                        <a href="<%= PublicFunctions.ServerURL & "Home"%>"><span><%=Resources.Resource.Home%></span></a>
                    </li>
                    <li>
                        <span class="current"><%=Resources.Resource.AboutUs%></span>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="grid-container margin-top-3 no-bg">
        <asp:Label Text="" ID="lblRes" runat="server" />
        <div class="grid-x grid-padding-x justify-content-center">
            <div class="small-12 large-8 cell text-center">
                <h1><%=Resources.Resource.ABriefOverviewOfTheCompany%></h1>
                <div class="row margin-top-1 margin-bottom-3">
                    <div class="col-md-12">
                        <ul class="list-text">
                            <li><%=Resources.Resource.AboutKayanAlDorra1%></li>
                            <li><%=Resources.Resource.AboutKayanAlDorra2%></li>
                        </ul>
                    </div>
                </div>

                <h1><%=Resources.Resource.OurVision%></h1>
                <div class="row margin-top-1 margin-bottom-3">
                    <div class="col-md-12">
                        <ul class="list-text">
                            <li><%=Resources.Resource.OurVision1%></li>
                            <li><%=Resources.Resource.OurVision2%></li>
                            <li><%=Resources.Resource.OurVision3%></li>
                            <li><%=Resources.Resource.OurVision4%></li>
                        </ul>
                    </div>
                </div>

                <img class="margin-bottom-2" src="../images/other/Warranty.jpg" style="width: 250px;" />

                <ul class="list-text">
                    <li><%=Resources.Resource.Warning1%></li>
                    <li><%=Resources.Resource.Warning2%></li>
                </ul>

                <div class="about-img-container margin-top-3 margin-bottom-3">
                    <img src="../images/other/ISO.png" />
                    <img src="../images/other/EOS.png" />
                    <img src="../images/other/TCL.png" />
                    <img src="../images/other/JASANZ.png" />
                    <img src="../images/other/HBRC.png" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server"></asp:Content>
