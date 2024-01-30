<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Categories.aspx.vb" Inherits="Categories" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server"></asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <asp:Panel runat="server" ID="pnlCategories">
        <nav class="breadcrumbs-container hide-for-small-only hide-for-medium-only cat_2718" aria-label="You are here:" role="navigation">
            <div class="grid-container">
                <div class="grid-x">
                    <ul class="breadcrumbs cell small-12">
                        <li>
                            <a href="Home.aspx"><span><%=Resources.Resource.Home%></span></a>
                        </li>
                        <li>
                            <span class="current"><%=Resources.Resource.Categories%></span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="grid-container margin-top-3">
            <div class="grid-x grid-padding-x">
                <div class="small-12 cell">
                    <h4><%=Resources.Resource.Categories%></h4>
                    <asp:Label Text="" runat="server" ID="lblRes" />
                    <div class="category-a margin-top-3 margin-bottom-3">
                        <div id="boxesCatA2" class="grid-x grid-padding-x grid-margin-y small-margin-collapse large-up-4 medium-up-3 small-up-2 categoryA-tile">
                            <asp:ListView runat="server" ClientIDMode="AutoID" ID="rpCategory">
                                <ItemTemplate>
                                    <div class="cell">
                                        <figure class="product categories-new">
                                            <a href="Categories.aspx?Cat=<%# Eval("Id").ToString %>" title='<%# Eval("Value").ToString %>'>
                                                <div class="wrapper-img-placeholder">
                                                    <div class="img-placeholder" style="flex: 1 0 auto">
                                                        <picture>
                                                            <img src='<%# Eval("Icon").ToString.Replace("~", "") %>' width="760" height="1064"
                                                                alt='<%# Eval("Value").ToString %>' title='<%# Eval("Value").ToString %>' loading="eager">
                                                        </picture>
                                                    </div>
                                                </div>
                                                <figcaption>
                                                    <h2><%# Eval("Value").ToString %></h2>
                                                    <asp:Label Text='<%# Eval("Id").ToString %>' runat="server" ID="lblId" Visible="false" />
                                                </figcaption>
                                            </a>
                                        </figure>
                                        <ul categorieschildren="" class="hide-for-small-only">
                                            <asp:Repeater runat="server" ClientIDMode="AutoID" ID="rpSubCategory">
                                                <ItemTemplate>
                                                    <li><a href="#"><%# Eval("Value").ToString %></a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <li runat="server" id="liViewAll"><a href="Categories.aspx?Cat=<%# Eval("Id").ToString %>" title='<%# Eval("Value").ToString %>'
                                                style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                        </ul>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </asp:Panel>

    <%--Subcategory--%>
    <asp:Panel runat="server" ID="pnlSubCategories" Visible="false">

        <section class="grid-container margin-top-3">
            <div class="grid-x grid-padding-x">
                <div class="small-12 cell">
                    <h4>
                        <asp:Label Text="" ID="lblSubCategoryTitle" runat="server" /></h4>

                    <div class="margin-top-3 margin-bottom-3">
                        <div class="grid-x grid-padding-x grid-margin-y small-margin-collapse large-up-4 medium-up-2 small-up-2" data-third-level-cats="" data-gtm="{&quot;h&quot;:&quot;[data-third-level-cats]>.cell a&quot;,&quot;i-s&quot;:&quot;25&quot;,&quot;c-s&quot;:&quot;boxes-categoria-b&quot;,&quot;a-x&quot;:&quot;./@title&quot;,&quot;l-x&quot;:&quot;1+count(./../../preceding-sibling::div)&quot;}">
                            <asp:Repeater runat="server" ID="rpSubCategory">
                                <ItemTemplate>
                                    <div class="cell">
                                        <figure class="product categories-new padding-bottom-0">
                                            <a href="#" title='<%# Eval("Value").ToString %>'>
                                                <div class="cont-image">
                                                    <div class="img-placeholder small">
                                                        <picture>
                                                            <img src='<%# Eval("Icon").ToString.Replace("~/", "") %>' width="840" height="630"
                                                                alt='<%# Eval("Value").ToString %>' title='<%# Eval("Value").ToString %>'
                                                                style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                        </picture>
                                                    </div>
                                                </div>
                                            </a>
                                        </figure>
                                        <a href="#" title='<%# Eval("Value").ToString %>'>
                                            <h2><%# Eval("Value").ToString %></h2>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </asp:Panel>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server">
    
</asp:Content>
