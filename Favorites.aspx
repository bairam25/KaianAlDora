<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Favorites.aspx.vb" Inherits="Favorites" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="HeaderCss" runat="Server">
    <link href="css/ar/myproject.min.css" rel="stylesheet" />
     <script src="jsCode/jsWishlist.js" defer="defer"></script>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <nav class="breadcrumbs-container hide-for-small-only hide-for-medium-only cat_2718" aria-label="You are here:" role="navigation">
        <div class="grid-container">
            <div class="grid-x">
                <ul class="breadcrumbs cell small-12">
                    <li>
                        <a href="Home.aspx"><span>الصفحة الرئيسية</span></a>
                    </li>
                    <li>
                        <span class="current">المفضلة</span>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="grid-container margin-top-3">
        <div class="grid-x grid-padding-x">
            <div class="small-12 cell">
                <h4>المفضلة</h4>
                    <asp:Button Text="" OnClick="FillWishList" ClientIDMode="Static" ID="btnFillWishList" runat="server" style="display:none;" />

                <div id="product-grid" class="grid-x grid-margin-x product-grid grid-x medium-up-3 large-up-5 margin-top-3">
                    <asp:Label Text="" ID="lblRes" runat="server" />
                    <asp:Repeater runat="server" ID="rpFavorit">
                        <ItemTemplate>
                            <div class="cell _search-item column-block single-element small-6" data-itemid='<%# Eval("Id").ToString %>'>
                                <figure class="product project-tile" data-itemid='<%# Eval("Id").ToString %>'>
                                    <div title="Delete from favorites" id="btnDeleteFav" class="manage-product-dot hide-for-small-only"
                                        data-itemid='<%# Eval("Id").ToString %>' onclick="WishList(this)">
                                        
                                        <svg class="icon icon-small">
                                            <use xlink:href="/images/sprite-icon.svg?v=20231122_4#icon-bin-outline"></use></svg>
                                    </div>
                                    <a href="javascript:void(0)" title='<%# Eval("Name").ToString %>' class="_search-item-anchor">
                                        <div class="cont-image">
                                            <div class="img-placeholder">
                                                <picture>
                                                    <img src='<%# Eval("Photo").ToString %>'></picture>
                                            </div>
                                        </div>
                                        <figcaption style="padding-bottom: 0px;">
                                            <div class="product-manufacturer"><%# Eval("CategoryName").ToString %></div>
                                            <h3 itemprop="name" class="product-title"><%# Eval("Name").ToString %></h3>
                                        </figcaption>
                                    </a>
                                    <div class="product-tile-content-variant">
                                        <ul class="product-tile-variant ">
                                            <li class="list-tile-variant">
                                                <div class="col-price">
                                                    <div class="price-group">                                                      
                                                        <span class="price" style="font-weight: 500; padding-left: 4px; color: rgb(255, 99, 99);">£ <%# Eval("Price").ToString %>
                                                        </span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </figure>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                   
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server"></asp:Content>
