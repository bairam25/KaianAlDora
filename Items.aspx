<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Items.aspx.vb" Inherits="Items" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server"></asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
     <asp:UpdatePanel ID="up" runat="server" ClientIDMode="AutoID">
        <ContentTemplate>
    <asp:Label ID="lblRes" runat ="server" Visible ="false"></asp:Label>
    <asp:Label ID="lblCheckedControl" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSearch" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSearchType" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblPage" runat="server" Visible="false"></asp:Label>
    <section class="cat_2718">
        <div class="title-content-wrapper grid-container padding-top-1 padding-bottom-1">
            <div class="grid-x grid-padding-x">
                <div class="large-12 cell">
                    <h3 id="meta-content">بانيوهات</h3>
                </div>
            </div>
        </div>
    </section>
    <div class="grid-container">
        <div class="grid-x grid-padding-x">
            <div class="large-9 cell small-order-1 medium-order-2 mt-xlarge">
                <div class="grid-x bar-option show-for-large" style="justify-content: flex-start; align-items: baseline">
                    <div style="display: flex; align-items: center; font-size: 15px">
                        <span><strong>1,214 المنتجات</strong></span>
                        <div class="desktop-sortby d-flex">
                            <span>الترتيب بحسب:</span>
                            <ul class="dropdown menu float-right" data-dropdown-menu="5xiuen-dropdown-menu" role="menubar">
                                <li class="is-dropdown-submenu-parent opens-left">
                                    <a href="#" class="button light" style="padding-right: 1.5rem" role="menuitem" aria-haspopup="true">الجديد</a>
                                    <ul class="menu submenu is-dropdown-submenu first-sub vertical" role="menubar">
                                        <li class="is-submenu-item is-dropdown-submenu-item"><a href="#" role="menuitem">الجديد</a></li>
                                        <li class="is-submenu-item is-dropdown-submenu-item"><a href="#" role="menuitem">العلامات التجارية</a></li>
                                        <li class="is-submenu-item is-dropdown-submenu-item"><a href="#" role="menuitem">السعر - الأقل إلى الأعلى</a></li>
                                        <li class="is-submenu-item is-dropdown-submenu-item"><a href="#" role="menuitem">السعر - الأعلى إلى الأقل</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="grid-x grid-padding-x grid-margin-y large-up-3 medium-up-2 small-up-2" id="productGrid">
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
                    <div class="cell _search-item" data-id="544185" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Rexa - DIP">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_dip-rexa-design-544185-reldd8fa43e.jpg" alt="DIP - بانيو" class="image-product"
                                                width="300" height="225" loading="eager">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Rexa
                                    </div>
                                    <h3 class="product-title">DIP - بانيو</h3>
                                    <span class="hideprice">30,200</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="572769" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Devon&amp;Devon - AURORA BIJOUX WHITE">
                                <div class="cont-image">
                                    <div class="utils-top">
                                        <div class="new-product">NEW</div>
                                    </div>
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_aurora-bijoux-white-devon-devon-572769-rel11f9493a.jpg" alt="AURORA BIJOUX WHITE - بانيو"
                                                class="image-product" width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Devon &amp; Devon
                                    </div>
                                    <h3 class="product-title">AURORA BIJOUX WHITE - بانيو</h3>
                                    <div class="price-group">
                                        <span class="price">$15,171.41
                                        </span>
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
                    <div class="cell _search-item" data-id="440749" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Rapsel - OFURO">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_OFURO-Rapsel-440749-rel335483c8.jpg" alt="OFURO - بانيو" class="image-product"
                                                width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Rapsel
                                    </div>
                                    <h3 class="product-title">OFURO - بانيو</h3>
                                    <span class="hideprice">13,650</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="662636" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Acquabella - NEVIS">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_Acquabella_NEVIS_ifsmbpp83B.jpeg" alt="NEVIS - بانيو" class="image-product" width="300"
                                                height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Acquabella
                                    </div>
                                    <h3 class="product-title">NEVIS - بانيو</h3>
                                    <span class="hideprice">45,200</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="609030" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Agape - FACE &#xC0; FACE">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_Agape_Face-a-face_jgTIFGvyeJ.jpeg" alt="FACE À FACE - بانيو" class="image-product"
                                                width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Agape
                                    </div>
                                    <h3 class="product-title">FACE À FACE - بانيو</h3>
                                    <span class="hideprice">32,100</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="603719" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Copenhagen Bath - ROSENBORG">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_Copenhagen-Bath_Rosenborg_E9Pb3FJOIg.jpeg" alt="ROSENBORG - بانيو" class="image-product"
                                                width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Copenhagen Bath
                                    </div>
                                    <h3 class="product-title">ROSENBORG - بانيو</h3>
                                    <span class="hideprice">43,600</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="648550" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="HATRIA - BT 03">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_18671e9e-77bb-d146-0633-5bbe8f15221c.jpeg" alt="BT 03 - بانيو" class="image-product"
                                                width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        HATRIA
                                    </div>
                                    <h3 class="product-title">BT 03 - بانيو</h3>
                                    <span class="hideprice">60,200</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="651163" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="/ar/&#x627;&#x644;&#x645;&#x646;&#x62A;&#x62C;&#x627;&#x62A;/glass1989/&#x628;&#x627;&#x646;&#x64A;&#x648;-alchemy_651163" title="Glass1989 - ALCHEMY">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_Glass1989_ALCHEMY-_5649969221.jpeg" alt="ALCHEMY - بانيو" class="image-product"
                                                width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Glass1989
                                    </div>
                                    <h3 class="product-title">ALCHEMY - بانيو</h3>
                                    <span class="hideprice">33,450</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="576957" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="#" title="Ideal Standard - LINDA &#x2013; X - T4626">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_LINDA-X-T4626-Ideal-Standard-576957-rel9a7f3321.jpg" alt="LINDA – X - T4626 - بانيو"
                                                class="image-product" width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        Ideal Standard
                                    </div>
                                    <h3 class="product-title">LINDA – X - T4626 - بانيو</h3>
                                    <span class="hideprice">35,350</span>
                                </figcaption>
                            </a>
                            <div class="_addToListButton button button-save show-for-large">
                                <svg class="icon-xxmedium middle">
                                    <use href="/images/sprite-icon.svg?v=20231122_4#icon-heart-line"></use>
                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="cell _search-item" data-id="343570" data-tile-type="default">
                        <figure class="product">
                            <a class="_search-item-anchor" href="/ar/&#x627;&#x644;&#x645;&#x646;&#x62A;&#x62C;&#x627;&#x62A;/falper/&#x628;&#x627;&#x646;&#x64A;&#x648;-lancetta_343570" title="FALPER - LANCETTA">
                                <div class="cont-image">
                                    <div class="img-placeholder">
                                        <picture>
                                            <img src="images/product-thumbs/h_LANCETTA-FALPER-343570-relbe685267.jpg" alt="LANCETTA - بانيو" class="image-product"
                                                width="300" height="225" loading="lazy">
                                        </picture>
                                    </div>
                                </div>
                                <figcaption>
                                    <div class="product-manufacturer">
                                        FALPER
                                    </div>
                                    <h3 class="product-title">LANCETTA - بانيو</h3>
                                    <span class="hideprice">65,530</span>
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


                <div class="grid-x">
                    <div class="cell small-12 text-center">
                        <div class="pagination-container">
                            <ul aria-label="Pagination" class="pagination" role="navigation">
                                <li class="disabled pagination-previous"><a href="=#" rel="prev">Back</a></li>
                                <li class="current"><span>1</span></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">8</a></li>
                                <li><a href="#">9</a></li>
                                <li><a href="#">10</a></li>
                                <li class="pagination-next"><a href="#" rel="next">Next</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="large-3 cell hide filter-show-for-large small-order-2 medium-order-1" id="facet-column" data-toggler=".hide">
                <div class="hide-for-large filter-mobile-header filter-comeback">
                    <p>تصفية / ترتيب </p>
                    <button class="close-button _closeRevealBtn" data-toggle="facet-column" type="button">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="filter-mobile-header hide-for-large" style="border: 0">
                    <div class="select-like">
                        <p>الترتيب بحسب</p>
                        <ul>
                            <li><a href="#">الجديد</a></li>
                            <li><a href="#">العلامات التجارية</a></li>
                            <li><a href="#">الأكثر شعبية</a></li>
                            <li><a href="#">with 3D</a></li>
                            <li><a href="#">Price - Low to High</a></li>
                            <li><a href="#">Price - High to Low</a></li>
                        </ul>
                    </div>
                </div>
                <div class="hide-for-large filter-mobile-header">
                    <p>صنف حسب</p>
                </div>
                <div class="accordion filter" data-multi-expand="true" data-allow-all-closed="true">
                    <div class="hide-for-small-only">
                    </div>
                   <div class="panel-group">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" href="#collapseOne"><%=Resources.Resource.Category%>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse show" aria-expanded="true" style="">
                                            <div class="panel-body custom-scroll">
                                                <ul class="filterList">
                                                    <asp:ListView ID="lvCategories" runat="server" ClientIDMode="AutoID">
                                                        <ItemTemplate>
                                                            <li>
                                                                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category").ToString %>' Style="display: none"></asp:Label>
                                                                <asp:CheckBox ID="chkCategory" runat="server" Text='<%# Eval("CategoryName").ToString %>' CssClass="font-weight-bold" AutoPostBack="true" OnCheckedChanged="CheckCategory" />
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <asp:Panel ID="pnlSubCategory" runat="server" Visible="false">
                                    <div class="panel-group">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" href="#collapseSubCategory" aria-expanded="true"><%=Resources.Resource.SubCategory%>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapseSubCategory" class="panel-collapse collapse show">
                                                <div class="panel-body custom-scroll">
                                                    <ul class="filterList">
                                                        <asp:Label ID="lblSubCategories" runat="server" Visible="false"></asp:Label>
                                                        <asp:ListView ID="lvSubCategory" runat="server" ClientIDMode="AutoID">
                                                            <ItemTemplate>
                                                                <li>
                                                                    <asp:CheckBox ID="chkSubCategory" runat="server" Text='<%# Eval("SubCategoryName").ToString %>' AutoPostBack="true" OnCheckedChanged="FillItems" />
                                                                    <asp:Label ID="lblSubCategory" runat="server" Text='<%# Eval("SubCategory").ToString %>' Style="display: none"></asp:Label>
                                                                    <asp:Label ID="lblCatSubCategory" runat="server" Text='<%# Eval("CatSubCatName").ToString.Trim %>' Style="display: none"></asp:Label>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div class="clearfix"></div>
                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" href="#collapseBrand" aria-expanded="true"><%=Resources.Resource.Brand%>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapseBrand" class="panel-collapse collapse show">
                                            <div class="panel-body custom-scroll">
                                                <ul class="filterList">
                                                    <asp:ListView ID="lvBrand" runat="server" ClientIDMode="AutoID">
                                                        <ItemTemplate>
                                                            <li>
                                                                <asp:CheckBox ID="chkBrand" runat="server" CssClass="font-weight-bold" Text='<%# Eval("BrandName").ToString %>' AutoPostBack="true" OnCheckedChanged="CheckBrand" />
                                                                <asp:Label ID="lblBrand" runat="server" Text='<%# Eval("Brand").ToString %>' Style="display: none"></asp:Label>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                </div>
            </div>
        </div>
    </div>
            </ContentTemplate> 
         </asp:UpdatePanel> 
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server"></asp:Content>
