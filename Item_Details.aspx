<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Item_Details.aspx.vb" Inherits="Item_Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server">
    <link href="css/ar/product-page.css" rel="stylesheet" />
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
                        <a href="#"><span>المنتجات</span></a>
                    </li>
                    <li>
                        <a href="Categories.aspx"><span>الاستحمام وأحواض الاستحمام</span></a>
                    </li>
                    <li>
                        <span class="current">بانيوهات</span>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="multi-product-image">
        <div class="product-page ">
            <div class="grid-container">
                <div class="productsheet">
                    <div class="productsheet__overview">
                        <div class="productsheet__overview__gallery">
                            <div class="image-container">
                                <div class="carousel-wrapper" id="product-image" data-mobile-dots-reducer="true">
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
                                </div>
                            </div>
                        </div>
                        <div class="productsheet__overview__cta">
                            <div class="product-page-column">
                                <div class="box-product-info">
                                    <div class="media-object show-for-large">
                                        <div class="media-object-section" style="padding: 0">
                                            <a href="#" title="Gruppo Geromin" class="cont-logo">
                                                <picture class="thumbnail logo-medium">
                                                    <img class="_logo" src="https://cdn.archilovers.com/people/thumb2_GRUPPO-GEROMIN-95ba3ce9-log1.gif" alt="Gruppo Geromin" width="92" height="92">
                                                </picture>
                                            </a>
                                        </div>
                                    </div>
                                    <hgroup>
                                        <h1 class="title-product-page">
                                            <span class="prd-manufacturer">
                                                <a href="#" title="Gruppo Geromin">Gruppo Geromin
                                                </a>
                                            </span>
                                            <span class="prd-name">AVIGO</span>
                                            <span class="description">بانيو</span>
                                        </h1>
                                    </hgroup>
                                    <meta content="665064">
                                    <meta content="Gruppo Geromin">
                                    <div class="show-for-large">
                                        <ul class="no-bullet list-product-column list-info mobile-padding column-top-extra-info column-top-product-info">
                                            <li>مصمم من طرف
                                                <b><a href="/ar/مصمم/antonio-bullo" title="مصمم من طرف Antonio Bullo"><span>Antonio Bullo</span></a></b>, <b><span>Andrea Rosset</span></b> </li>
                                            <li>مجموعة <b><a href="/ar/gruppo-geromin/المنتجات/جمع_avigo" title="مجموعة Avigo">Avigo</a></b></li>
                                        </ul>
                                    </div>
                                    <div class="request-box contact-manufacturer-box">
                                        <button id="PriceRequestButton" class="button expanded brand-ap iconized" type="button">
                                            <svg class="icon icon-medium">
                                                <use xlink:href="/images/sprite-icon.svg?v=20231121_4#icon-heart-line"></use></svg>اضافة الى المفضلة
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
                                    <span class="gi-title">معلومات</span>
                                    <article class="gi-content">
                                        <h2 class="product-name">AVIGO By <a href="#">Gruppo Geromin</a></h2>
                                        <div class="product-additional-info">
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
                                        </div>
                                        <div class="product-desc-container">
                                            <div class="grid-x" style="padding-top: 15px;">
                                                <div class="cell">
                                                    <p>حوض الاستحمام القائم بذاته من <strong>Avigo </strong>مصنوع من Mineraltek ، وهو مركب معدني أنيق للعين وعملي للتنظيف ويدوم طويلا. لامع أو غير لامع ، مفرد أو لونين: يخصص حوض الاستحمام Avigo الحمام بأناقة.</p>
                                                    <p>في كيودجا ، مسقط رأس المصمم ، يذهب المرء "إلى فيغو" للتحول إلى البحر ، إلى الماء ، وبالتالي إلى واحدة من أكثر ملذات المعيشة إرضاء. تم تصميم <strong>Avigo </strong>لتتناسب مع نموذجية الحياة الإيطالية من خلال تجديد التقاليد مع الجوهر. من بين مجموعات الأدوات الصحية ، تبرز Avigo لمجموعة عديدة وكاملة من عناصرها ، والتي يتم تنسيقها دائما في التصميم ومدعومة بمستوى جودة عال.</p>
                                                    <p>الخزف الصحي من Hafro هو الانتهاء من مشروع Total Living Bath. أربع مجموعات مصممة لتبرز من خلال توازن أناقة الطراز الإيطالي. مجموعة كاملة ومنسقة من المنتجات التي هي في تطور مستمر لتسبق السوق بأشياء إيجابية وجذابة تهدف إلى مرافقتنا في المستقبل.</p>
                                                </div>
                                            </div>
                                            <a class="_moreInfoOn product-more-info" href="#" requestedurl="https://gruppogeromin.com/en/sanitaryware-washbasins/sanitaryware/avigo/" data-thumbnail="images/product-thumbs/h_Gruppo-Geromin_AVIGO_FvwjndJ4R.jpeg" data-description="الانتقال إلى المنتج" data-name="انقر فوق الزر للانتقال إلى علامة التبويب <b>AVIGO</b>">
                                                <b>معلومات إضافية من المصنع بخصوص AVIGO Gruppo Geromin</b>
                                            </a>
                                        </div>
                                        <span class="intro-description-toggler-button hide-for-large _show-desc">اقرأ المزيد
                                            <svg class="icon-small middle" style="margin-left: 6px;">
                                                <use xlink:href="/images/sprite-icon.svg?v=20231121_4#icon-carret-down" style="fill: white"></use></svg></span>
                                    </article>
                                </div>
                                <div class="accordion-item grid-margin-x is-active">
                                    <a class="accordion-title" aria-controls="24p3fx-accordion" id="24p3fx-accordion-label" aria-expanded="true">الأبعاد</a>
                                    <div class="accordion-content" data-tab-content="" style="display: block" role="region" aria-labelledby="24p3fx-accordion-label" aria-hidden="false" id="24p3fx-accordion">
                                        <p>170 x 75 x 58 H cm</p>
                                        <div class="grid-x grid-padding-x margin-top-1 flex-dimensions">
                                            <figure class="cell small-12">
                                                <a href="#" title="Dimensions AVIGO" class="" data-reveal-id="size-gallery" data-index="1">
                                                    <img src="images/products/Gruppo-Geromin_AVIGO_xkBaOhgyCf.jpeg" loading="lazy" title="Dimensions AVIGO" alt="Dimensions AVIGO" width="624" height="423" style="width: auto">
                                                </a>
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
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server">
    <script src="js/product-page.js"></script>
</asp:Content>
