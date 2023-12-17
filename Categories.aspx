<%@ Page Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Categories.aspx.vb" Inherits="Categories" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="PageHeader" ContentPlaceHolderID="Header" runat="Server"></asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="Content" runat="Server">
    <div id="pnlCategories">
        <nav class="breadcrumbs-container hide-for-small-only hide-for-medium-only cat_2718" aria-label="You are here:" role="navigation">
            <div class="grid-container">
                <div class="grid-x">
                    <ul class="breadcrumbs cell small-12">
                        <li>
                            <a href="Home.aspx"><span>الصفحة الرئيسية</span></a>
                        </li>
                        <li>
                            <span class="current">الفئات</span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="grid-container margin-top-3">
            <div class="grid-x grid-padding-x">
                <div class="small-12 cell">
                    <h4>الفئات</h4>

                    <div class="category-a margin-top-3 margin-bottom-3">
                        <div id="boxesCatA2" class="grid-x grid-padding-x grid-margin-y small-margin-collapse large-up-4 medium-up-3 small-up-2 categoryA-tile">
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" title="السيراميك الحمام">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/2698@1x.jpg" width="760" height="1064" alt="السيراميك الحمام" title="السيراميك الحمام" loading="eager">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>السيراميك الحمام</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">أحواض غسل</a></li>
                                    <li><a href="#">مراحيض</a></li>
                                    <li><a href="#">شطافات</a></li>
                                    <li><a href="#">حوض اليد</a></li>
                                    <li><a href="#" title="السيراميك الحمام" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" onclick="SubCategories();" title="الاستحمام وأحواض الاستحمام">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/2711@1x.jpg" width="760" height="1064" alt="الاستحمام وأحواض الاستحمام" title="الاستحمام وأحواض الاستحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>الاستحمام وأحواض الاستحمام</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">بانيوهات</a></li>
                                    <li><a href="#">بانيوهات قدم</a></li>
                                    <li><a href="#">كبائن الاستحمام</a></li>
                                    <li><a href="#">أعمدة الدش</a></li>
                                    <li><a href="#" onclick="SubCategories();" title="الاستحمام وأحواض الاستحمام" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" title="صنابير الحمام">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/2712@1x.jpg" width="760" height="1064" alt="صنابير الحمام" title="صنابير الحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>صنابير الحمام</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">بالوعة الصنابير</a></li>
                                    <li><a href="#">الصنابير بالرخام</a></li>
                                    <li><a href="#">الصنابير حوض الاستحمام</a></li>
                                    <li><a href="#">صنابير دش</a></li>
                                    <li><a href="#" title="صنابير الحمام" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" title="أثاث الحمام">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/2715@1x.jpg" width="760" height="1064" alt="أثاث الحمام" title="أثاث الحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>أثاث الحمام</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">خزانات حمام</a></li>
                                    <li><a href="#">وحدات حوض الغسل</a></li>
                                    <li><a href="#">أسطح حوض الغسل</a></li>
                                    <li><a href="#">مرايا حمام</a></li>
                                    <li><a href="#" title="أثاث الحمام" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" title="إضاءة الحمام">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/3083@1x.jpg" width="760" height="1064" alt="إضاءة الحمام" title="إضاءة الحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>إضاءة الحمام</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">مصابيح جدارية للحمام</a></li>
                                    <li><a href="#">مصابيح سقف الحمام</a></li>
                                    <li><a href="#">مصابيح مرآة</a></li>
                                    <li><a href="#">مرايا مع ضوء</a></li>
                                    <li><a href="#" title="إضاءة الحمام" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" title="اكسسوارات الحمام والديكور">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/767@1x.jpg" width="760" height="1064" alt="اكسسوارات الحمام والديكور" title="اكسسوارات الحمام والديكور" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>اكسسوارات الحمام والديكور</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">حوامل المناشف</a></li>
                                    <li><a href="#">حوامل الصابون</a></li>
                                    <li><a href="#">موزعات الصابون السائل</a></li>
                                    <li><a href="#">حوامل فُرش الأسنان</a></li>
                                    <li><a href="#" title="اكسسوارات الحمام والديكور" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" title="الغسيل والتنظيف المنزلية">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/2714@1x.jpg" width="760" height="1064" alt="الغسيل والتنظيف المنزلية" title="الغسيل والتنظيف المنزلية" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>الغسيل والتنظيف المنزلية</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">خزائن غرفة الغسيل</a></li>
                                    <li><a href="#">تغرق لغسيل الملابس</a></li>
                                    <li><a href="#">سلال الغسيل</a></li>
                                    <li><a href="#">غسالات الملابس</a></li>
                                    <li><a href="#" title="الغسيل والتنظيف المنزلية" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new">
                                    <a href="#" title="حمامات ذوي الاحتياجات الخاصة">
                                        <div class="wrapper-img-placeholder">
                                            <div class="img-placeholder" style="flex: 1 0 auto">
                                                <picture>
                                                    <img src="images/category/1470@1x.jpg" width="760" height="1064" alt="حمامات ذوي الاحتياجات الخاصة" title="حمامات ذوي الاحتياجات الخاصة" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                        <figcaption>
                                            <h2>حمامات ذوي الاحتياجات الخاصة</h2>
                                        </figcaption>
                                    </a>
                                </figure>
                                <ul categorieschildren="" class="hide-for-small-only">
                                    <li><a href="#">أطقم الاستحمام</a></li>
                                    <li><a href="#">أحواض استحمام مزودة بباب</a></li>
                                    <li><a href="#">مراحيض مُعلقة</a></li>
                                    <li><a href="#">أحواض غسل مُعلقة</a></li>
                                    <li><a href="#" title="حمامات ذوي الاحتياجات الخاصة" style="font-weight: 500; padding-top: 4px">View all...</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div id="pnlSubCategories" style="display: none;">
        <nav class="breadcrumbs-container hide-for-small-only hide-for-medium-only cat_2718" aria-label="You are here:" role="navigation">
            <div class="grid-container">
                <div class="grid-x">
                    <ul class="breadcrumbs cell small-12">
                        <li>
                            <a href="Home.aspx"><span>الصفحة الرئيسية</span></a>
                        </li>
                        <li>
                            <a href="Categories.aspx"><span>الفئات</span></a>
                        </li>
                        <li>
                            <span class="current">الاستحمام وأحواض الاستحمام</span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="grid-container margin-top-3">
            <div class="grid-x grid-padding-x">
                <div class="small-12 cell">
                    <h4>الاستحمام وأحواض الاستحمام</h4>

                    <div class="margin-top-3 margin-bottom-3">
                        <div class="grid-x grid-padding-x grid-margin-y small-margin-collapse large-up-4 medium-up-2 small-up-2" data-third-level-cats="" data-gtm="{&quot;h&quot;:&quot;[data-third-level-cats]>.cell a&quot;,&quot;i-s&quot;:&quot;25&quot;,&quot;c-s&quot;:&quot;boxes-categoria-b&quot;,&quot;a-x&quot;:&quot;./@title&quot;,&quot;l-x&quot;:&quot;1+count(./../../preceding-sibling::div)&quot;}">
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="Items.aspx" title="بانيوهات">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_OFURO-Rapsel-440749-rel335483c8.jpg" width="840" height="630" alt="بانيوهات" title="بانيوهات" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="Home.aspx" title="بانيوهات">
                                    <h2>بانيوهات</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="بانيوهات قدم">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_augusto-ceramica-cielo-627841-relc2e9afae.jpg" width="840" height="630" alt="بانيوهات قدم" title="بانيوهات قدم" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="بانيوهات قدم">
                                    <h2>بانيوهات قدم</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="كبائن الاستحمام">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_walk-in-shower-agape-523855-rel2eda0e34.jpeg" width="840" height="630" alt="كبائن الاستحمام" title="كبائن الاستحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="كبائن الاستحمام">
                                    <h2>كبائن الاستحمام</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="أعمدة الدش">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_PETRA-Agape-443513-reldc9d458e.jpg" width="840" height="630" alt="أعمدة الدش" title="أعمدة الدش" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="أعمدة الدش">
                                    <h2>أعمدة الدش</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="لوحات الحائط حوض الاستحمام">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_LINE-Bathtub-wall-panel-GRUPPO-GEROMIN-112152-rela0924793.jpg" width="840" height="630" alt="لوحات الحائط حوض الاستحمام" title="لوحات الحائط حوض الاستحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="لوحات الحائط حوض الاستحمام">
                                    <h2>لوحات الحائط حوض الاستحمام</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="رشاشات دش استحمام علوية">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_q316-spot-rubinetterie-zazzeri-600738-relaa7db592.jpg" width="840" height="630" alt="رشاشات دش استحمام علوية" title="رشاشات دش استحمام علوية" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="رشاشات دش استحمام علوية">
                                    <h2>رشاشات دش استحمام علوية</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="رؤساء دش الأفقي">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_rainshower-f-27251-grohe-357631-rel515a0405.jpg" width="840" height="630" alt="رؤساء دش الأفقي" title="رؤساء دش الأفقي" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="رؤساء دش الأفقي">
                                    <h2>رؤساء دش الأفقي</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="قناة دش">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_proshower-base-l-progress-profiles-404479-rel38e49415.jpg" width="840" height="630" alt="قناة دش" title="قناة دش" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="قناة دش">
                                    <h2>قناة دش</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="تجهيزات دش المقصورة">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_COOPER-Agape-523851-reld69319b7.jpeg" width="840" height="630" alt="تجهيزات دش المقصورة" title="تجهيزات دش المقصورة" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="تجهيزات دش المقصورة">
                                    <h2>تجهيزات دش المقصورة</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="رؤساء دش">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_handshower-with-individual-rosettes-gessi-597223-rele389b69e.jpg" width="840" height="630" alt="رؤساء دش" title="رؤساء دش" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="رؤساء دش">
                                    <h2>رؤساء دش</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="حوامل برنس الحمام">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_linea-towel-rack-fantini-rubinetti-427850-rele29499cd.jpg" width="840" height="630" alt="حوامل برنس الحمام" title="حوامل برنس الحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="حوامل برنس الحمام">
                                    <h2>حوامل برنس الحمام</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="ستارة الحمام">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_prodotti-70094-reld5a7b7210c8a4fc18de6f5ce7992c57b.jpg" width="840" height="630" alt="ستارة الحمام" title="ستارة الحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="ستارة الحمام">
                                    <h2>ستارة الحمام</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="حمام الجدار Shelfes">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_bathroom-e-string-furniture-589774-rel12810401.png" width="840" height="630" alt="حمام الجدار Shelfes" title="حمام الجدار Shelfes" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="حمام الجدار Shelfes">
                                    <h2>حمام الجدار Shelfes</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="براز الحمام">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_prodotti-181599-rel0091d273681444e7a0c1b16a6752c617.jpg" width="840" height="630" alt="براز الحمام" title="براز الحمام" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="براز الحمام">
                                    <h2>براز الحمام</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="حوض الاستحمام مسند الرأس">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_UNICO-Bathtub-headrest-Rexa-Design-319560-rel8a450791.jpg" width="840" height="630" alt="حوض الاستحمام مسند الرأس" title="حوض الاستحمام مسند الرأس" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="حوض الاستحمام مسند الرأس">
                                    <h2>حوض الاستحمام مسند الرأس</h2>
                                </a>
                            </div>
                            <div class="cell">
                                <figure class="product categories-new padding-bottom-0">
                                    <a href="#" title="قناة دش">
                                        <div class="cont-image">
                                            <div class="img-placeholder small">
                                                <picture>
                                                    <img src="images/product-thumbs/h_proshower-base-l-progress-profiles-404479-rel38e49415.jpg" width="840" height="630" alt="قناة دش" title="قناة دش" style="opacity: 1; transition: opacity 0.5s ease 0s; min-width: 1px; background-color: rgb(255, 255, 255);">
                                                </picture>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <a href="#" title="قناة دش">
                                    <h2>قناة دش</h2>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
<asp:Content ID="PageFooter" ContentPlaceHolderID="Footer" runat="Server">
    <script>
        function SubCategories() {
            $('#pnlCategories').hide();
            $('#pnlSubCategories').show();
        }
    </script>
</asp:Content>
