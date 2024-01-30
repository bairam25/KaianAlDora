<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server">
    <link href="<%= Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/slick.min.css") %>" rel="stylesheet" />
    <link href="<%= Page.ResolveUrl("css/" & Resources.Resource.LangReference & "/Slider.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <asp:Label Text="" ID="lblRes" runat="server" />
    <!--======== Slider Section ========-->
    <section class="vs-hero-wrapper hero-3 position-relative">
        <div class="hero-slider3 vs-carousel" data-slide-show="1" data-md-slide-show="1" data-arrows="true" data-fade="true">
            <asp:Repeater runat="server" ClientIDMode="AutoID" ID="lvSlider">
                <ItemTemplate>
                    <div class="vs-hero-inner">
                        <div class="vs-hero-bg" data-bg-src="images/Cover.jpg">
                            <img src='<%# Eval("MediaURL").ToString.Replace("~/", "") %>' alt="overlay">
                        </div>
                        <div class="hero-content3">
                            <span class="h4 hero-subtitle style-3" data-ani="slideinup" data-ani-delay="0s"><%# Eval("Description").ToString %></span>
                            <h2 class="hero-title style-2" data-ani="slideinup" data-ani-delay="0.2s"><%# Eval("Title").ToString %></h2>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <%-- <!-- Single Slide -->
            <div class="vs-hero-inner">
                <div class="vs-hero-bg" data-bg-src="images/Cover.jpg">
                    <img src="images/Cover.jpg" alt="overlay">
                </div>
                <div class="hero-content3">
                    <span class="h4 hero-subtitle style-3" data-ani="slideinup" data-ani-delay="0s">أفضل المصممين</span>
                    <h2 class="hero-title style-2" data-ani="slideinup" data-ani-delay="0.2s">أفضل جودة وأفضل تصميمات بأفضل الأسعار</h2>
                </div>
            </div>
            <!-- Single Slide -->
            <div class="vs-hero-inner">
                <div class="vs-hero-bg" data-bg-src="images/Cover-2.jpg">
                    <img src="images/Cover-2.jpg" alt="overlay">
                </div>
                <div class="hero-content3">
                    <span class="h4 hero-subtitle style-3" data-ani="slideinup" data-ani-delay="0s">أفضل المصممين</span>
                    <h2 class="hero-title style-2" data-ani="slideinup" data-ani-delay="0.2s">نحن نقدم المثالية</h2>
                </div>
            </div>
            <!-- Single Slide -->
            <div class="vs-hero-inner">
                <div class="vs-hero-bg" data-bg-src="images/Cover-3.jpg">
                    <img src="images/Cover-3.jpg" alt="overlay">
                </div>
                <div class="hero-content3">
                    <span class="h4 hero-subtitle style-3" data-ani="slideinup" data-ani-delay="0s">أفضل المصممين</span>
                    <h2 class="hero-title style-2" data-ani="slideinup" data-ani-delay="0.2s">حمامات فاخرة</h2>
                </div>
            </div>--%>
        </div>
        <!-- / Slider end -->
    </section>
    <!--======== / Slider Section ========-->

    <section class="grid-container margin-top-3">
        <div class="grid-x grid-padding-x">
            <div class="large-12 cell mt-xlarge">
                <h1 class="text-center margin-top-3 margin-bottom-4"><%=Resources.Resource.NewerBathtubs%></h1>
                <div class="grid-x grid-padding-x grid-margin-y large-up-5 medium-up-2 small-up-2" id="productGrid">
                    <div class="cell _search-item" data-id="665064">
                        <figure class="product">
                            <a class="_search-item-anchor" href="Item_Details.aspx" title="Gruppo Geromin - AVIGO">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_Gruppo-Geromin_AVIGO_FvwjndJ4R.jpeg" alt="AVIGO - بانيو" class="image-product"
                                                width="300" height="225" loading="eager">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Gruppo Geromin
                                    </div>
                                    <h3 class="product-title">AVIGO - بانيو</h3>
                                    <span class="hideprice">43,500</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="636346" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Antoniolupi - CUBA">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_CUBA-Antonio-Lupi-Design-636346-reld970b2e1.jpg" alt="CUBA - بانيو"
                                                class="image-product" width="300" height="225" loading="eager">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Antoniolupi
                                    </div>
                                    <h3 class="product-title">CUBA - بانيو</h3>
                                    <span class="hideprice">30,100</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="627842" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Ceramica Cielo - OTTAVIA">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_ottavia-ceramica-cielo-627842-relf2290b2f.jpg" alt="OTTAVIA - بانيو"
                                                class="image-product" width="300" height="225" loading="eager">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Ceramica Cielo
                                    </div>
                                    <h3 class="product-title">OTTAVIA - بانيو</h3>
                                    <span class="hideprice">62,223</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="444254" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Salvatori - ANIMA - بانيو">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_anima-bathtub-salvatori-444254-rel31d65598.jpg" alt="ANIMA - بانيو"
                                                class="image-product" width="300" height="225" loading="eager">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Salvatori
                                    </div>
                                    <h3 class="product-title">ANIMA - بانيو</h3>
                                    <div class="price-group">
                                        <span class="price">64,475.12</span>
                                    </div>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="610425" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="DISENIA - ELLISSE">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_seven-disenia-srl-by-ideagroup-610425-relc2eea125.jpg" alt="ELLISSE - بانيو"
                                                class="image-product" width="300" height="225" loading="eager">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        DISENIA
                                    </div>
                                    <h3 class="product-title">ELLISSE - بانيو</h3>
                                    <span class="hideprice">40,550</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="grid-container margin-top-3 margin-bottom-3">
        <div class="grid-x grid-padding-x">
            <div class="large-12 cell mt-xlarge">
                <h1 class="text-center margin-top-3 margin-bottom-4"><%=Resources.Resource.Brands%></h1>
                <div class="grid-x grid-padding-x grid-margin-y large-up-8 medium-up-4 small-up-2">
                    <asp:Repeater runat="server" ID="rpBrands">
                        <ItemTemplate>
                            <div class="cell _search-item" data-id='<%# Eval("Id").ToString  %>' data-tile-type="default">
                                <figure class="product no-overlay padding-horizontal-2 padding-vertical-2">
                                    <a class="_search-item-anchor" href="Brands.aspx">
                                        <div class="cont-image no-bg">
                                            <div class="img-placeholder">
                                                <picture>
                                                    <img src='<%# Eval("Icon").ToString.Replace("~/", "") %>' alt='<%# Eval("Value").ToString  %>'
                                                        class="image-product" width="300" height="225" loading="eager">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server">
    <script src="js/slick.min.js"></script>
    <script src="js/vscustom-carousel.min.js"></script>
</asp:Content>
