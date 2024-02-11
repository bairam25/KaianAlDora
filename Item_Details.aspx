<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Item_Details.aspx.vb" Inherits="Item_Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server">
    <link href="<%= ".." + Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/carousel.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <nav class="breadcrumbs-container hide-for-small-only hide-for-medium-only cat_2718" aria-label="You are here:" role="navigation">
        <div class="grid-container">
            <div class="grid-x">
                <ul class="breadcrumbs cell small-12">
                    <li>
                        <a href="Home"><span><%=Resources.Resource.Home%></span></a>
                    </li>
                    <li>
                        <a href="Items"><span><%=Resources.Resource.Items%></span></a>
                    </li>
                    <li>
                        <asp:HyperLink runat="server" ID="lbCategory"></asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink runat="server" ID="lbSubcategory"></asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <asp:Label ID="lblRes" runat="server" Visible="false"></asp:Label>

    <asp:Label ID="lblItemId" runat="server" Style="display: none;" ClientIDMode="Static"></asp:Label>
    <asp:Label ID="lblBrand" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblCatCode" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSubCatCode" runat="server" Visible="false"></asp:Label>

    <asp:ListView ID="lvDetails" runat="server" ClientIDMode="AutoID">
        <ItemTemplate>
            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id")%>' Visible="false"></asp:Label>
            <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("Name")%>' Visible="false"></asp:Label>
            <section class="multi-product-image">
                <div class="product-page ">
                    <div class="grid-container">
                        <div class="productsheet">
                            <div class="productsheet__overview">
                                <div class="productsheet__overview__gallery">
                                    <div class="image-container">
                                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <img class="d-block w-100" alt="First slide [800x400]" src="../images/product-thumbs/b_Gruppo-Geromin_AVIGO_FvwjndJ4R.jpeg">
                                                </div>
                                                <div class="carousel-item">
                                                    <img class="d-block w-100" alt="Second slide [800x400]" src="../images/product-thumbs/b_Gruppo-Geromin_AVIGO_eak48HjxDl.jpeg">
                                                </div>

                                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                                    <svg class="flickity-button-icon" viewBox="0 0 100 100">
                                                        <path d="M 71.292969 0.238281 C 75.695312 0.304688 79.242188 3.851562 79.289062 8.242188 C 79.289062 8.242188 79.289062 8.253906 79.289062 8.253906 C 79.289062 10.445312 78.386719 12.433594 76.945312 13.871094 L 40.207031 50.261719 L 76.984375 86.355469 C 78.261719 87.773438 79.042969 89.65625 79.042969 91.722656 C 79.042969 96.164062 75.425781 99.761719 70.964844 99.761719 C 68.902344 99.761719 67.019531 98.992188 65.597656 97.726562 L 65.605469 97.738281 L 23.101562 55.96875 C 21.652344 54.492188 20.746094 52.484375 20.714844 50.261719 L 20.714844 50.257812 C 20.71875 48.023438 21.648438 45.996094 23.136719 44.550781 L 23.140625 44.546875 L 65.648438 2.570312 C 67.0625 1.15625 69.007812 0.269531 71.164062 0.238281 Z M 71.292969 0.238281" class="arrow"></path></svg>
                                                </a>
                                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                                    <svg class="flickity-button-icon" viewBox="0 0 100 100">
                                                        <path d="M 71.292969 0.238281 C 75.695312 0.304688 79.242188 3.851562 79.289062 8.242188 C 79.289062 8.242188 79.289062 8.253906 79.289062 8.253906 C 79.289062 10.445312 78.386719 12.433594 76.945312 13.871094 L 40.207031 50.261719 L 76.984375 86.355469 C 78.261719 87.773438 79.042969 89.65625 79.042969 91.722656 C 79.042969 96.164062 75.425781 99.761719 70.964844 99.761719 C 68.902344 99.761719 67.019531 98.992188 65.597656 97.726562 L 65.605469 97.738281 L 23.101562 55.96875 C 21.652344 54.492188 20.746094 52.484375 20.714844 50.261719 L 20.714844 50.257812 C 20.71875 48.023438 21.648438 45.996094 23.136719 44.550781 L 23.140625 44.546875 L 65.648438 2.570312 C 67.0625 1.15625 69.007812 0.269531 71.164062 0.238281 Z M 71.292969 0.238281" class="arrow" transform="translate(100, 100) rotate(180) "></path></svg>
                                                </a>
                                            </div>

                                            <ol class="carousel-indicators">
                                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">
                                                    <img class="d-block w-100" alt="First slide [800x400]" src="../images/product-thumbs/g_Gruppo-Geromin_AVIGO_FvwjndJ4R.jpeg">
                                                </li>
                                                <li data-target="#carouselExampleIndicators" data-slide-to="1" class="">
                                                    <img class="d-block w-100" alt="First slide [800x400]" src="../images/product-thumbs/g_Gruppo-Geromin_AVIGO_eak48HjxDl.jpeg">
                                                </li>
                                            </ol>
                                        </div>

                                        <%--<div class="carousel-wrapper" id="product-image" data-mobile-dots-reducer="true">
                                            <div class="main-carousel carousel flickity-enabled is-draggable" tabindex="0">
                                                <div class="flickity-viewport" style="height: 615px; touch-action: pan-y;">
                                                    <div class="flickity-slider" style="left: 0px; transform: translateX(0%);">
                                                        <div class="carousel-cell is-selected" style="position: absolute; left: 0%;">
                                                            <figure>
                                                                <img src="images/product-thumbs/b_Gruppo-Geromin_AVIGO_FvwjndJ4R.jpeg" alt="بانيو AVIGO by Gruppo Geromin" title="بانيو AVIGO by Gruppo Geromin" id="imgCarousel" class="carousel-cell-image" style="opacity: 1; object-fit: contain">
                                                            </figure>
                                                        </div>
                                                        <div class="carousel-cell" aria-hidden="true" style="position: absolute; left: 103.18%;">
                                                            <figure>
                                                                <img src="images/product-thumbs/b_Gruppo-Geromin_AVIGO_eak48HjxDl.jpeg" id="imgCarousel" class="carousel-cell-image flickity-lazyloaded" alt="بانيو AVIGO by Gruppo Geromin_2" title="بانيو AVIGO by Gruppo Geromin_2">
                                                            </figure>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="flickity-button flickity-prev-next-button previous" type="button" disabled="" aria-label="Previous">
                                                    <svg class="flickity-button-icon" viewBox="0 0 100 100">
                                                        <path d="M 71.292969 0.238281 C 75.695312 0.304688 79.242188 3.851562 79.289062 8.242188 C 79.289062 8.242188 79.289062 8.253906 79.289062 8.253906 C 79.289062 10.445312 78.386719 12.433594 76.945312 13.871094 L 40.207031 50.261719 L 76.984375 86.355469 C 78.261719 87.773438 79.042969 89.65625 79.042969 91.722656 C 79.042969 96.164062 75.425781 99.761719 70.964844 99.761719 C 68.902344 99.761719 67.019531 98.992188 65.597656 97.726562 L 65.605469 97.738281 L 23.101562 55.96875 C 21.652344 54.492188 20.746094 52.484375 20.714844 50.261719 L 20.714844 50.257812 C 20.71875 48.023438 21.648438 45.996094 23.136719 44.550781 L 23.140625 44.546875 L 65.648438 2.570312 C 67.0625 1.15625 69.007812 0.269531 71.164062 0.238281 Z M 71.292969 0.238281" class="arrow"></path></svg></button>
                                                <button class="flickity-button flickity-prev-next-button next" type="button" aria-label="Next">
                                                    <svg class="flickity-button-icon" viewBox="0 0 100 100">
                                                        <path d="M 71.292969 0.238281 C 75.695312 0.304688 79.242188 3.851562 79.289062 8.242188 C 79.289062 8.242188 79.289062 8.253906 79.289062 8.253906 C 79.289062 10.445312 78.386719 12.433594 76.945312 13.871094 L 40.207031 50.261719 L 76.984375 86.355469 C 78.261719 87.773438 79.042969 89.65625 79.042969 91.722656 C 79.042969 96.164062 75.425781 99.761719 70.964844 99.761719 C 68.902344 99.761719 67.019531 98.992188 65.597656 97.726562 L 65.605469 97.738281 L 23.101562 55.96875 C 21.652344 54.492188 20.746094 52.484375 20.714844 50.261719 L 20.714844 50.257812 C 20.71875 48.023438 21.648438 45.996094 23.136719 44.550781 L 23.140625 44.546875 L 65.648438 2.570312 C 67.0625 1.15625 69.007812 0.269531 71.164062 0.238281 Z M 71.292969 0.238281" class="arrow" transform="translate(100, 100) rotate(180) "></path></svg></button>
                                            </div>
                                            <button class="close-gallery close-button" type="button"><span aria-hidden="true">×</span></button>
                                            <div class="caption-recap caption-details">
                                                <p>AVIGO | Gruppo Geromin</p>
                                                <span class="container-partial">1</span>
                                                <span id="container-total">/2</span>
                                            </div>
                                        </div>
                                        <div class="mobile-dots hide-for-large">
                                            <div class="mobile-dots-container">
                                                <div id="thumb-counter" data-toggler=".hide" data-hide="2yych9-hide">
                                                    <div class="line-dots dots_0 active"></div>
                                                    <div class="line-dots dots_1"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="margin-top-1">
                                            <div class="nav-carousel show-for-large flickity-enabled" tabindex="0">
                                                <div class="flickity-viewport" style="height: 75.0417px; touch-action: pan-y;">
                                                    <div class="flickity-slider" style="left: 0px; transform: translateX(0%);">
                                                        <div class="nav-carousel-cell is-nav-selected is-selected" style="position: absolute; left: 0%;">
                                                            <img class="nav-carousel-image flickity-lazyloaded" src="images/product-thumbs/g_Gruppo-Geromin_AVIGO_FvwjndJ4R.jpeg" width="98" height="73" alt="بانيو AVIGO by Gruppo Geromin">
                                                        </div>
                                                        <div class="nav-carousel-cell is-selected" style="position: absolute; left: 14.02%;">
                                                            <img class="nav-carousel-image flickity-lazyloaded" src="images/product-thumbs/g_Gruppo-Geromin_AVIGO_eak48HjxDl.jpeg" width="98" height="73" alt="بانيو AVIGO by Gruppo Geromin_2">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                                
                                <div id="pnlFullScreen" class="carousel-wrapper fullscreen" style="display: none;">
                                    <figure onmousemove="" class="" style="background-position: 97.0025% 5.53977%;">
                                        <img src="../images/product-thumbs/b_Gruppo-Geromin_AVIGO_FvwjndJ4R.jpeg" id="imgCarousel" class="carousel-cell-image flickity-lazyloaded" sizes="(max-width: 1024px) 100vw, (max-width: 1280px) 66vw, 840px" width="840" height="630" alt="Mineraltek freestanding oval bathtub AVIGO by Gruppo Geromin_2" title="Mineraltek freestanding oval bathtub AVIGO by Gruppo Geromin_2">
                                    </figure>
                                    <button class="close-gallery close-button" type="button"><span aria-hidden="true">×</span></button>
                                    <div class="caption-recap caption-details">
                                        <p>AVIGO | Gruppo Geromin</p>
                                    </div>
                                </div>

                                <div class="productsheet__overview__cta">

                                    <div class="product-page-column">
                                        <div class="box-product-info">
                                            <div class="media-object show-for-large">
                                                <div class="media-object-section" style="padding: 0">
                                                    <a href='<%#PublicFunctions.ServerURL + "Brand=" + Eval("BrandName").ToString.Replace(" ", "-")  %>' title='<%# Eval("BrandName") %>' class="cont-logo">
                                                        <picture class="thumbnail logo-medium">
                                                            <img class="_logo" src='<%# Eval("BrandPhoto") %>' alt='<%# Eval("BrandName") %>' width="92" height="92">
                                                        </picture>
                                                    </a>
                                                </div>
                                            </div>
                                            <hgroup>
                                                <h1 class="title-product-page">
                                                    <span class="prd-manufacturer">
                                                        <a href='<%#PublicFunctions.ServerURL + "Brand=" + Eval("BrandName").ToString.Replace(" ", "-")  %>' title='<%# Eval("BrandName") %>'><%# Eval("BrandName") %>
                                                        </a>
                                                    </span>
                                                    <span class="prd-name"><%# Eval("Name") %></span>
                                                    <%--  <span class="description">بانيو</span>--%>
                                                </h1>
                                            </hgroup>
                                            <meta content='<%# Eval("Id").ToString  %>'>
                                            <meta content="Gruppo Geromin">
                                            <div class="show-for-large">
                                                <ul class="no-bullet list-product-column list-info mobile-padding column-top-extra-info column-top-product-info">
                                                    <li><%=Resources.Resource.DesignedBy%>:<b><%# Eval("Designer") %></b> </li>
                                                    <li><%=Resources.Resource.Collection%> :
                                                                <b><a href='<%#PublicFunctions.ServerURL + "Category=" + Eval("CategoryName").ToString.Replace(" ", "-")  %>' title='<%# Eval("CategoryName") %>'><%# Eval("CategoryName") %></a></b>,
                                                                <b><a href='<%#PublicFunctions.ServerURL + "Category=" + Eval("CategoryName").ToString.Replace(" ", "-") + "/SubCategory=" + Eval("SubCategoryName").ToString.Replace(" ", "-") %>' title='<%# Eval("SubCategoryName") %>'><%# Eval("SubCategoryName") %></a></b>
                                                    </li>
                                                    <li><%=Resources.Resource.ManufactureYear%> :<b><%# Eval("ProdYear").ToString  %></b> </li>
                                                </ul>
                                            </div>
                                            <div class="request-box contact-manufacturer-box">
                                                <button id="PriceRequestButton" class="button expanded brand-ap iconized" type="button">
                                                    <svg class="icon icon-medium">
                                                        <use xlink:href="/images/sprite-icon.svg?v=20231121_4#icon-heart-line"></use></svg><%=Resources.Resource.AddToFavorites%>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="mobile-wishlist-share hide-for-large">
                                            <div class="my-products">
                                                <div class="button alpha icon-label _addProductNotSellable" title="Share with...">
                                                    <svg class="icon">
                                                        <use xlink:href="/images/sprite-icon.svg?v=20231121_4#icon-heart-line"></use></svg>
                                                </div>
                                            </div>
                                            <div class="button alpha icon-label" title="Share with..." id="shareButton">
                                                <svg class="icon">
                                                    <use xlink:href="/images/sprite-icon.svg?v=20231121_4#icon-share"></use></svg>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="productsheet__info">
                                <div class="productsheet__details padding-bottom">
                                    <section class="accordion accordion-products margin-bottom-3" data-accordion="p10r40-accordion" data-multi-expand="true" data-allow-all-closed="true">
                                        <div class="general-info grid-margin-x">
                                            <span class="gi-title"><%=Resources.Resource.Informations%></span>
                                            <article class="gi-content">
                                                <h2 class="product-name"><%# Eval("Name").ToString  %></h2>
                                                <%-- <div class="product-additional-info">
                                                            <div class="grid-x">
                                                                <div class="cell small-12 medium-3">
                                                                    <b>مجموعة</b>
                                                                </div>
                                                                <div class="cell small-12 medium-9">
                                                                    <h2><a href="/ar/gruppo-geromin/المنتجات/جمع_avigo" style="text-decoration: underline">Avigo</a></h2>
                                                                </div>
                                                            </div>
                                                            <div class="grid-x">
                                                                <div class="cell small-12 medium-3">
                                                                    <b>الصنف</b>
                                                                </div>
                                                                <div class="cell small-12 medium-9">
                                                                    <h2>بانيو</h2>
                                                                </div>
                                                            </div>
                                                            <div class="grid-x">
                                                                <div class="cell small-12 medium-3">
                                                                    <b>سنة الإنتاج</b>
                                                                </div>
                                                                <div class="cell small-12 medium-9">
                                                                    <h2>2023</h2>
                                                                </div>
                                                            </div>
                                                            <div class="grid-x">
                                                                <div class="cell small-12 medium-3">
                                                                    <b>مصمم</b>
                                                                </div>
                                                                <div class="cell small-12 medium-9">
                                                                    <h2>
                                                                        <div class="designer-block">
                                                                            <img src="images/designers/thumb2_bde6143a-8870-46fa-9751-c103260ae5c8.jpg" loading="lazy" width="75" height="75" title="Antonio Bullo" alt="Antonio Bullo" class="hide-for-large">
                                                                            <a href="#" title="مصمم من طرف Antonio Bullo">
                                                                                <span>Antonio Bullo</span>
                                                                            </a>
                                                                        </div>
                                                                        <span class="show-for-large">,</span>
                                                                        <span class="custom-designer">Andrea Rosset</span>
                                                                    </h2>
                                                                </div>
                                                            </div>
                                                        </div>--%>
                                                <div class="product-desc-container">
                                                    <%# Eval("Description").ToString  %>
                                                </div>
                                                <span class="intro-description-toggler-button hide-for-large _show-desc"><%=Resources.Resource.ReadMore%>
                                                    <svg class="icon-small middle" style="margin-left: 6px;">
                                                        <use xlink:href="/images/sprite-icon.svg?v=20231121_4#icon-carret-down" style="fill: white"></use></svg></span>
                                            </article>
                                        </div>
                                        <div class="accordion-item grid-margin-x is-active">
                                            <a class="accordion-title" aria-controls="24p3fx-accordion" id="24p3fx-accordion-label" aria-expanded="true"><%=Resources.Resource.Dimensions%></a>
                                            <div class="accordion-content" data-tab-content="" style="display: block" role="region" aria-labelledby="24p3fx-accordion-label" aria-hidden="false" id="24p3fx-accordion">
                                                <p><%# Eval("Size").ToString  %></p>
                                                <div class="grid-x grid-padding-x margin-top-1 flex-dimensions">
                                                    <figure class="cell small-12">

                                                        <img src='<%# PublicFunctions.ServerURL & Eval("SketchPhoto") %>' loading="lazy" title="<%=Resources.Resource.Dimensions%>" alt="<%=Resources.Resource.Dimensions%>" width="624" height="423" style="width: auto" />
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </ItemTemplate>
    </asp:ListView>

</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server">
    <script src="../js/product-page.js"></script>
    <script src="../js/jquery-min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/carousel.js"></script>
</asp:Content>
