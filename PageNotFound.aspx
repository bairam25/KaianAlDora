<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="PageNotFound.aspx.vb" Inherits="PageNotFound" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server">
    <link href="<%= Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/error.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <div class="grid-container">
        <div class="grid-x grid-padding-x">
            <div class="cell small-12 content-text-error">
                <div class="container-error-text">
                    <h1>404</h1>
                    <h2><%=Resources.Resource.MessageTheRequestedPageHasNotBeenFound%></h2>
                    <p>
                        <%=Resources.Resource.MessageAttentionKaianAlDoraPageYouSearchedForDoesNotExist%>
                        <br>
                        <%=Resources.Resource.MessageThePageYouAreLookingForMightHaveBeenMovedOrMayNoLongerExist%>
                    </p>
                    <p>
                        <a href="<%= PublicFunctions.ServerURL & "Home"%>"><%=Resources.Resource.GoToTheHomepage%></a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server"></asp:Content>
