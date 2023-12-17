/*! For license information please see product-page.js.LICENSE.txt */ ! function(e, t) {
    if ("object" == typeof exports && "object" == typeof module) module.exports = t(require("moment"));
    else if ("function" == typeof define && define.amd) define(["moment"], t);
    else {
        var n = "object" == typeof exports ? t(require("moment")) : t(e.moment);
        for (var o in n)("object" == typeof exports ? exports : e)[o] = n[o]
    }
}(self, (e => (() => {
    var t, n, o, a, r, i, c = {
            5080: (e, t, n) => {
                "use strict";
                var o;
                n.d(t, {
                        l: () => o
                    }),
                    function(e) {
                        e[e.None = 0] = "None", e[e.PriceRequest = 1] = "PriceRequest", e[e.CatalogRequest = 2] = "CatalogRequest", e[e.DealersRequest = 3] = "DealersRequest", e[e.ContactRequest = 4] = "ContactRequest", e[e.GenericRequest = 5] = "GenericRequest", e[e.PriceAndCatalogRequest = 6] = "PriceAndCatalogRequest", e[e.BimRequest = 7] = "BimRequest", e[e.ManufacturerProductsBoxRequest = 8] = "ManufacturerProductsBoxRequest"
                    }(o || (o = {}))
            },
            72937: (e, t, n) => {
                "use strict";
                var o;
                n.d(t, {
                        i: () => o
                    }),
                    function(e) {
                        e[e.None = 0] = "None", e[e.ClickWebSite = 1] = "ClickWebSite", e[e.DownloadCatalog = 2] = "DownloadCatalog", e[e.DownloadBim = 3] = "DownloadBim", e[e.ClickMoreInformation = 4] = "ClickMoreInformation", e[e.ClickWhereToBuyWebSite = 5] = "ClickWhereToBuyWebSite", e[e.WebLink = 6] = "WebLink", e[e.DownloadVideo = 7] = "DownloadVideo", e[e.DownloadDemo = 8] = "DownloadDemo", e[e.SaveBim = 9] = "SaveBim", e[e.DownloadBimType = 10] = "DownloadBimType", e[e.DownloadCadType = 11] = "DownloadCadType", e[e.DownloadBimApp = 12] = "DownloadBimApp", e[e.DownloadCatalogTenderSpecification = 101] = "DownloadCatalogTenderSpecification", e[e.DownloadCatalogTechnicalSheet = 102] = "DownloadCatalogTechnicalSheet"
                    }(o || (o = {}))
            },
            21560: (e, t, n) => {
                "use strict";
                var o;
                n.d(t, {
                        M: () => o
                    }),
                    function(e) {
                        e[e.Edilportale = 1] = "Edilportale", e[e.Archiproducts = 4] = "Archiproducts", e[e.Archilovers = 5] = "Archilovers", e[e.Bim = 8] = "Bim"
                    }(o || (o = {}))
            },
            93353: (e, t, n) => {
                "use strict";
                var o;
                n.d(t, {
                        x: () => o
                    }),
                    function(e) {
                        e[e.Product = 1] = "Product", e[e.Multi = 2] = "Multi", e[e.Manufacturer = 3] = "Manufacturer", e[e.ReselledProduct = 4] = "ReselledProduct"
                    }(o || (o = {}))
            },
            66295: (e, t, n) => {
                "use strict";
                var o;
                n.d(t, {
                        c: () => o
                    }),
                    function(e) {
                        e[e.Unknown = 0] = "Unknown", e[e.News = 1] = "News", e[e.Product = 2] = "Product", e[e.Manufacturer = 3] = "Manufacturer", e[e.ProductsSearch = 4] = "ProductsSearch", e[e.Reseller = 5] = "Reseller"
                    }(o || (o = {}))
            },
            56114: (e, t, n) => {
                "use strict";
                n.d(t, {
                    Q: () => o
                });
                var o = function(e) {
                    var t = this;
                    void 0 === e && (e = !0), this._stateful = e, this._callbacks = [], this.attachHandler = function(e) {
                        t._callbacks.indexOf(e) > -1 || (t._callbacks.push(e), void 0 !== t._payload && t._stateful && e(t._payload))
                    }, this._payload = void 0, this.payloadReceived = function(e) {
                        t._payload = e, t._callbacks.forEach((function(t) {
                            return t(e)
                        }))
                    }
                }
            },
            68882: (e, t, n) => {
                var o, a, r;
                window, a = [n(49570), n(68893)], void 0 === (r = "function" == typeof(o = function(e, t) {
                    "use strict";
                    e.createMethods.push("_createAsNavFor");
                    var n = e.prototype;
                    return n._createAsNavFor = function() {
                        this.on("activate", this.activateAsNavFor), this.on("deactivate", this.deactivateAsNavFor), this.on("destroy", this.destroyAsNavFor);
                        var e = this.options.asNavFor;
                        if (e) {
                            var t = this;
                            setTimeout((function() {
                                t.setNavCompanion(e)
                            }))
                        }
                    }, n.setNavCompanion = function(n) {
                        n = t.getQueryElement(n);
                        var o = e.data(n);
                        if (o && o != this) {
                            this.navCompanion = o;
                            var a = this;
                            this.onNavCompanionSelect = function() {
                                a.navCompanionSelect()
                            }, o.on("select", this.onNavCompanionSelect), this.on("staticClick", this.onNavStaticClick), this.navCompanionSelect(!0)
                        }
                    }, n.navCompanionSelect = function(e) {
                        if (this.navCompanion) {
                            var t = this.navCompanion.selectedCells[0],
                                n = this.navCompanion.cells.indexOf(t),
                                o = n + this.navCompanion.selectedCells.length - 1,
                                a = Math.floor((i = n, c = o, s = this.navCompanion.cellAlign, (c - i) * s + i));
                            if (this.selectCell(a, !1, e), this.removeNavSelectedElements(), !(a >= this.cells.length)) {
                                var r = this.cells.slice(n, o + 1);
                                this.navSelectedElements = r.map((function(e) {
                                    return e.element
                                })), this.changeNavSelectedClass("add")
                            }
                        }
                        var i, c, s
                    }, n.changeNavSelectedClass = function(e) {
                        this.navSelectedElements.forEach((function(t) {
                            t.classList[e]("is-nav-selected")
                        }))
                    }, n.activateAsNavFor = function() {
                        this.navCompanionSelect(!0)
                    }, n.removeNavSelectedElements = function() {
                        this.navSelectedElements && (this.changeNavSelectedClass("remove"), delete this.navSelectedElements)
                    }, n.onNavStaticClick = function(e, t, n, o) {
                        "number" == typeof o && this.navCompanion.selectCell(o)
                    }, n.deactivateAsNavFor = function() {
                        this.removeNavSelectedElements()
                    }, n.destroyAsNavFor = function() {
                        this.navCompanion && (this.navCompanion.off("select", this.onNavCompanionSelect), this.off("staticClick", this.onNavStaticClick), delete this.navCompanion)
                    }, e
                }) ? o.apply(t, a) : o) || (e.exports = r)
            },
            48144: (e, t, n) => {
                "use strict";
                n.d(t, {
                    b: () => r,
                    d: () => a
                });
                var o = n(56114);

                function a(e) {
                    void 0 === e && (e = !1);
                    var t = $("[data-vr-frame]"),
                        n = t.data("vr-frame"),
                        o = $("#thumb-counter");
                    if (null !== o && o.addClass("hide"), "expivi" === n || "sayduck" === n) {
                        if (!t.data("vrLoaded")) return;
                        var a = $("#vrFrameClose"),
                            r = $("#vrFrameOpen");
                        if (!t.hasClass("opacity-none-hidden")) return;
                        t.removeClass("opacity-none-hidden"), a.removeClass("hide"), r.addClass("opacity-none-hidden")
                    } else {
                        if (a = $("#vrFrameClose"), r = $("#vrFrameOpen"), !t.hasClass("opacity-none-hidden")) return;
                        if (t.removeClass("opacity-none-hidden"), a.removeClass("hide"), r.addClass("opacity-none-hidden"), "true" == $("#vrFrame").data("loaded")) return;
                        t.attr("src", t.attr("src")), $("#vrFrame").data("loaded", "true")
                    }
                    e && window.addEventToDataLayer({
                        event: "GAEvent",
                        eventId: "152",
                        eventCategory: "OnClickProductPage",
                        eventAction: "OnClick_3DViewer"
                    })
                }

                function r() {
                    var e = $("[data-vr-frame]"),
                        t = $("#vrFrameClose"),
                        n = $("#vrFrameOpen"),
                        o = $("#thumb-counter");
                    e.addClass("opacity-none-hidden"), t.addClass("hide"), n.removeClass("opacity-none-hidden"), null !== o && o.removeClass("hide")
                }
                window.initialize3D = function(e) {
                    return t = this, a = void 0, i = function() {
                        var t, a;
                        return function(e, t) {
                            var n, o, a, r, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            };
                            return r = {
                                next: c(0),
                                throw: c(1),
                                return: c(2)
                            }, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
                                return this
                            }), r;

                            function c(r) {
                                return function(c) {
                                    return function(r) {
                                        if (n) throw new TypeError("Generator is already executing.");
                                        for (; i;) try {
                                            if (n = 1, o && (a = 2 & r[0] ? o.return : r[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, r[1])).done) return a;
                                            switch (o = 0, a && (r = [2 & r[0], a.value]), r[0]) {
                                                case 0:
                                                case 1:
                                                    a = r;
                                                    break;
                                                case 4:
                                                    return i.label++, {
                                                        value: r[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    i.label++, o = r[1], r = [0];
                                                    continue;
                                                case 7:
                                                    r = i.ops.pop(), i.trys.pop();
                                                    continue;
                                                default:
                                                    if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== r[0] && 2 !== r[0])) {
                                                        i = 0;
                                                        continue
                                                    }
                                                    if (3 === r[0] && (!a || r[1] > a[0] && r[1] < a[3])) {
                                                        i.label = r[1];
                                                        break
                                                    }
                                                    if (6 === r[0] && i.label < a[1]) {
                                                        i.label = a[1], a = r;
                                                        break
                                                    }
                                                    if (a && i.label < a[2]) {
                                                        i.label = a[2], i.ops.push(r);
                                                        break
                                                    }
                                                    a[2] && i.ops.pop(), i.trys.pop();
                                                    continue
                                            }
                                            r = t.call(e, i)
                                        } catch (e) {
                                            r = [6, e], o = 0
                                        } finally {
                                            n = a = 0
                                        }
                                        if (5 & r[0]) throw r[1];
                                        return {
                                            value: r[0] ? r[1] : void 0,
                                            done: !0
                                        }
                                    }([r, c])
                                }
                            }
                        }(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return e.isEcommerce ? (a = new o.Q, window.onPurchaseMenuLoaded = function(e) {
                                        a.payloadReceived(e.opts || [])
                                    }, [4, n.e(9597).then(n.bind(n, 89597))]) : [3, 3];
                                case 1:
                                    return [4, (0, r.sent().expiviEcommerceIntegration)(e.expiviParameters, a)];
                                case 2:
                                    return t = r.sent(), [3, 6];
                                case 3:
                                    return [4, Promise.all([n.e(7922), n.e(5675)]).then(n.bind(n, 72012))];
                                case 4:
                                    return [4, (0, r.sent().expiviNativeUiIntegration)(e.expiviParameters)];
                                case 5:
                                    t = r.sent(), r.label = 6;
                                case 6:
                                    return e.isAREnabled || $("button#xpv-toolbar-item-web-ar").addClass("hide"), e.onUIReady && t.forEach((function(t) {
                                        return e.onUIReady(t)
                                    })), [2, t]
                            }
                        }))
                    }, new((r = void 0) || (r = Promise))((function(e, n) {
                        function o(e) {
                            try {
                                s(i.next(e))
                            } catch (e) {
                                n(e)
                            }
                        }

                        function c(e) {
                            try {
                                s(i.throw(e))
                            } catch (e) {
                                n(e)
                            }
                        }

                        function s(t) {
                            var n;
                            t.done ? e(t.value) : (n = t.value, n instanceof r ? n : new r((function(e) {
                                e(n)
                            }))).then(o, c)
                        }
                        s((i = i.apply(t, a || [])).next())
                    }));
                    var t, a, r, i
                }, window.add_Post_Message_Listener = function() {
                    var e = !1;
                    window.addEventListener("message", (function(t) {
                        var n = t[t.message ? "message" : "data"];
                        switch (t.origin) {
                            case "http://sayduck.com":
                            case "https://sayduck.com":
                                if (null != n.code) switch (n.code) {
                                    case 200:
                                        var o = $("[data-vr-frame]"),
                                            a = $("#vrFrameClose"),
                                            r = $("#vrFrameOpen");
                                        o.removeClass("opacity-none-hidden"), a.removeClass("hide"), r.addClass("opacity-none-hidden"), $("#thumb-counter").addClass("hide"), o.data("vrLoaded", !0), e || (document.getElementById("vrFrame").contentWindow.postMessage({
                                            action: "viewer.resized"
                                        }, "*"), e = !0)
                                }
                                break;
                            default:
                                t.data
                        }
                    }), !1)
                }, $((function() {
                    if ("193138" == $(".product-page").attr("productId")) {
                        var e = $("#vr-frame");
                        null != e && null != e && (e.attr("src", "http://catalogue.accasoftware.com/webedificius/viewer.php?scene=15-MARA-A9013"), setTimeout((function() {
                            $(".vr-frame-close").toggleClass("hide"), $(".vr-frame-close").click()
                        }), 2e3))
                    }
                })), $((function() {
                    $("#btnCloseViewer").on("click", r), $("#vrFrameTrigger").on("click", (function() {
                        return a(!0)
                    }))
                }))
            },
            76433: (e, t, n) => {
                "use strict";
                n.d(t, {
                    X8: () => a,
                    YY: () => o,
                    Zv: () => r
                });
                var o = function(e) {
                        var t = 10,
                            n = e.querySelector(".flickity-slider");
                        n && (t = n.children.length);
                        var o = e.querySelectorAll(".flickity-button");
                        if (o.length)
                            for (var a = 0; a < o.length; a++) {
                                var r = o[a];
                                t > 1 && r.setAttribute("data-more-than-1", ""), t > 3 && r.setAttribute("data-more-than-3", ""), t > 5 && r.setAttribute("data-more-than-5", "")
                            }
                    },
                    a = function(e) {
                        for (var t = e.querySelectorAll(".ambassador-benefits span + span"), n = 0; n < t.length; n++) {
                            var o = t[n];
                            new Foundation.Tooltip($(o))
                        }
                    };

                function r(e, t, n, o) {
                    $(o[0]).find("p").text(t), $(o[0]).find("." + n + "-partial").text(e + 1)
                }
            },
            2206: (e, t, n) => {
                "use strict";
                n.d(t, {
                    M: () => l
                });
                var o = n(68264),
                    a = n(76433),
                    r = n(3495);

                function i(e, t) {
                    0 == t || e.target;
                    for (var n = $('[data-mobile-dots-reducer="true"]').find(".carousel-cell").length, o = t, a = "", r = $("#thumb-counter"), i = 0; i < n; i++) a += o == i ? '<div class="line-dots dots_' + i + ' active"></div>' : '<div class="line-dots dots_' + i + '"></div>';
                    n > 20 && r.css("left", 0), r.html(a)
                }
                var c = n(49570),
                    s = n.n(c);

                function l(e) {
                    e = void 0 === e ? $(".main-carousel .carousel-cell").length > 1 : e;
                    var t, c = $(".main-carousel"),
                        l = $("#product-image");
                    return document.querySelector(".main-carousel") && (t = new(s())(".main-carousel", {
                        pageDots: !1,
                        prevNextButtons: e,
                        lazyLoad: 2,
                        arrowShape: r.kT,
                        friction: 1,
                        selectedAttraction: .7,
                        imagesLoaded: !0,
                        on: {
                            ready: function() {
                                var e = $(this.element),
                                    t = e.parent(),
                                    n = e.find(".is-selected img").data("caption");
                                (0, a.Zv)(0, n, "container", t)
                            }
                        }
                    })), c.on("change.flickity", (function(e, t) {
                        var n = t,
                            o = $(this),
                            r = o.parent(),
                            c = o.find(".is-selected img").data("caption");
                        (0, a.Zv)(n, c, "container", r), i(e, t)
                    })), c.on("fullscreenChange.flickity", (function(e, t) {
                        $(".productsheet__overview__gallery").toggleClass("fullscreen-mode"), !1 === t && function(e) {
                            $(e.target).find(".is-selected img").data("appended-img") || $("#product-image img").each((function(e, t) {
                                var n = $(t),
                                    o = new Date;
                                n.attr("data-flickity-lazyload-src", n.data("src-thumb") + "?" + o.getTime()).attr("data-flickity-lazyload-srcset", n.data("src-thumb") + "?" + o.getTime())
                            })), $(e.target).closest(".flickity-viewport").css("touch-action", "pan-y"), $(e.target).closest(".carousel-wrapper").removeClass("fullscreen"), (0, o.j)()
                        }(e)
                    })), i(l, 0), $(".main-carousel").on("click", "img", (function(e) {
                        t && Promise.all([n.e(7961).then(n.t.bind(n, 77961, 23)), n.e(4842).then(n.bind(n, 94842))]).then((function() {
                            t.viewFullscreen(),
                                function(e) {
                                    var t = new Date,
                                        n = $(e.target);
                                    n.data("appended-img") || (n.attr("src", n.data("src-big") + "?" + t.getTime()), n.attr("srcset", n.data("src-big") + "?" + t.getTime()), $("#product-image img").each((function(e, n) {
                                        var o = $(n);
                                        o.attr("data-flickity-lazyload-src", o.data("src-big") + "?" + t.getTime()).attr("data-flickity-lazyload-srcset", o.data("src-big") + "?" + t.getTime())
                                    }))), n.closest(".flickity-viewport").css("touch-action", ""), n.closest(".carousel-wrapper").addClass("fullscreen"), (0, o.V)()
                                }(e)
                        }))
                    })), $(document).on("keydown", (function(e) {
                        "Escape" == e.key && t && t.resize()
                    })), $(".carousel-wrapper#product-image .close-gallery").on("click", (function() {
                        t && (t.exitFullscreen(), t.resize()), $("#product-image").find(".flickity-viewport").css("touch-action", "pan-y")
                    })), c
                }
            },
            19248: (e, t, n) => {
                "use strict";
                n.d(t, {
                    D: () => o
                });
                var o = function(e) {
                    window.onVariantImageSelected = function(t) {
                        n.e(1614).then(n.bind(n, 61614)).then((function(n) {
                            (0, n.onImageSelected)(e, t)
                        }))
                    }
                }
            },
            68264: (e, t, n) => {
                "use strict";
                n.d(t, {
                    V: () => r,
                    j: () => i
                });
                var o = ["user-scalable=yes", "maximum-scale=2.5", "minimum-scale=1"];

                function a() {
                    for (var e = $("meta[name=viewport]").attr("content").split(","), t = 0; t < e.length; t++) e[t] = e[t].trim();
                    return e
                }

                function r() {
                    for (var e = a(), t = 0; t < o.length; t++) {
                        var n = o[t]; - 1 === e.indexOf(o[t]) && e.push(n)
                    }
                    $("meta[name=viewport]").attr("content", e.join(", "))
                }

                function i() {
                    for (var e = a(), t = 0; t < o.length; t++) {
                        var n = e.indexOf(o[t]);
                        n > -1 && e.splice(n, 1)
                    }
                    $("meta[name=viewport]").attr("content", e.join(", "))
                }
            },
            16498: (e, t, n) => {
                "use strict";
                n.r(t);
                var o = n(19248),
                    a = n(2206),
                    r = n(3495),
                    i = n(49570),
                    c = n.n(i);
                n(68882);
                var s = n(48144);
                $((function() {
                    var e, t = (0, a.M)();
                    (0, o.D)(t), Foundation.MediaQuery.atLeast("medium") && (e = $(".nav-carousel"), e[0] && new(c())(".nav-carousel", {
                        asNavFor: ".main-carousel",
                        contain: !0,
                        pageDots: !1,
                        prevNextButtons: !1,
                        groupCells: !0,
                        cellAlign: "left",
                        imagesLoaded: !0,
                        lazyLoad: 1,
                        arrowShape: r.kT,
                        watchCSS: !0
                    }), e).find("img.nav-carousel-image").on("click", s.b)
                })), $((function() {
                    window.carouselInstances = window.carouselInstances || {}, window.loadReferences = function(e) {
                        var t = window.carouselInstances;
                        return t.references ? Promise.resolve(t.references) : (t.references = !0, function(e) {
                            return n.e(2252).then(n.bind(n, 32252)).then((function(t) {
                                var n = t.ReferencesCarousel,
                                    o = e;
                                o.carouselSettings = {
                                    pageDots: !1,
                                    imagesLoaded: !0,
                                    percentPosition: !1,
                                    cellAlign: "left",
                                    lazyLoad: 2,
                                    cellSelector: ".item",
                                    contain: !0,
                                    autoPlay: !0,
                                    arrowShape: r.kT
                                };
                                var a = new n(o);
                                return window.carouselInstances.references = a, a.init().then((function() {
                                    return {
                                        ReferencesCarousel: n,
                                        main: a
                                    }
                                }))
                            })).then((function(t) {
                                var n = t.ReferencesCarousel,
                                    o = t.main,
                                    a = e,
                                    r = e.navSelector,
                                    i = e.selector,
                                    c = document.querySelector(i),
                                    s = document.querySelector(".references-carousel-nav-container");
                                c.appendChild(s), a.selector = r, a.carouselSettings = {
                                    pageDots: !1,
                                    imagesLoaded: !0,
                                    percentPosition: !1,
                                    cellAlign: "left",
                                    lazyLoad: !1,
                                    prevNextButtons: !1,
                                    contain: !0,
                                    asNavFor: o.element
                                };
                                var l = new n(a);
                                return window.carouselInstances.referencesNav = l, l.asNavFor(o), l.init()
                            }))
                        }(Object.assign({
                            selector: "#referencesCarousel",
                            navSelector: "#referencesCarouselNav",
                            closeSelector: ".close-button",
                            productId: +window.IdProduct,
                            culture: "it"
                        }, e)))
                    }
                })), n(34488);
                var l = n(76433),
                    u = n(76326),
                    d = function() {
                        function e(e) {
                            var t = e.selector,
                                n = e.storageKey;
                            this._storageKey = n, this._selector = t
                        }
                        return e.prototype.getItemsFromLocalstorage = function() {
                            return JSON.parse(localStorage.getItem(this._storageKey) || "[]")
                        }, e.prototype.setItemsToLocalstorage = function(e) {
                            localStorage.setItem(this._storageKey, JSON.stringify(e))
                        }, e.prototype.getProductURL = function(e, t, n) {
                            return e = e.formatURIComponent(), t = t.formatURIComponent(), window.jsLabel.recent.productsPathTemplate.format({
                                manufacturerName: e,
                                productName: t,
                                productId: n
                            })
                        }, e.prototype.getProductImage = function(e, t) {
                            return window.jsLabel.recent.imagePathTemplate.format({
                                thumb: e,
                                image: t
                            })
                        }, e.prototype.init = function() {
                            var e = this,
                                t = document.querySelector(this._selector);
                            if (!t) return Promise.reject();
                            var n = this.getItemsFromLocalstorage();
                            if (n.length) {
                                n.reverse().map((function(t) {
                                    return (0, u.yC)("div", {
                                        className: "item"
                                    }, (0, u.yC)("figure", {
                                        className: "product padding-bottom-0"
                                    }, (0, u.yC)("a", {
                                        href: e.getProductURL(t.manufacturer, t.name, t.id)
                                    }, (0, u.yC)("div", {
                                        className: "cont-image"
                                    }, (0, u.yC)("div", {
                                        className: "img-placeholder small"
                                    }, (0, u.yC)("picture", null, (0, u.yC)("img", {
                                        alt: t.name,
                                        "data-flickity-lazyload-src": e.getProductImage("h", decodeURIComponent(t.imagefilename)),
                                        "data-flickity-lazyload-srcset": e.getProductImage("b", decodeURIComponent(t.imagefilename)) + " 2x"
                                    }))), (0, u.yC)("div", {
                                        className: "productHistory-BrandLogo"
                                    }, (0, u.yC)("img", {
                                        alt: "Logo",
                                        "data-flickity-lazyload-src": t.manufacturerImage
                                    }))))))
                                })).forEach((function(e) {
                                    t.appendChild(e)
                                }));
                                var o = new(c())(this._selector, r.Td);
                                return (0, l.YY)(t), Promise.resolve(o)
                            }
                            return Promise.reject()
                        }, e.prototype.addToRecent = function(e) {
                            for (var t = this.getItemsFromLocalstorage(), n = !1, o = 0; o < t.length; o++) t[o].id === e.id && (n = !0);
                            n || (t.push(e), 10 === t.length && t.shift(), this.setItemsToLocalstorage(t))
                        }, e
                    }();
                $((function() {
                    window.carouselInstances = window.carouselInstances || {};
                    var e = new d({
                        selector: "#recentCarousel",
                        storageKey: "APX_recentProducts"
                    });
                    window.addProductToRecent = function(t) {
                        return e.addToRecent(t)
                    }, void 0 !== typeof window.product && e.addToRecent(window.product), $(".recent-products-container").appear((function() {
                        return (t = window.carouselInstances).recent ? Promise.resolve(t.recent) : (t.recent = !0, e.init().then((function(e) {
                            return window.carouselInstances.recent = e
                        })));
                        var t
                    }), {
                        single: !0
                    })
                }));
                var f, p = (f = function(e, t) {
                        return (f = Object.setPrototypeOf || {
                                __proto__: []
                            }
                            instanceof Array && function(e, t) {
                                e.__proto__ = t
                            } || function(e, t) {
                                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
                            })(e, t)
                    }, function(e, t) {
                        function n() {
                            this.constructor = e
                        }
                        f(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
                    }),
                    v = function(e) {
                        function t(t, n) {
                            return e.call(this, t, window.jsLabel.moreLikeThis.uri, n) || this
                        }
                        return p(t, e), t
                    }(r.hx),
                    m = n(70585);

                function h(e) {
                    if (e.hasClass("dynamic-products-container") && "weekly-selection" == e.closest("[data-widget]").attr("data-widget")) return "home_page";
                    if (e.attr("data-sorting")) switch (e.attr("data-sorting")) {
                        case "PriceAsc":
                            return "sorting_increasing_price";
                        case "PriceDesc":
                            return "sorting_decreasing_price"
                    }
                    return "standard_sorting"
                }

                function g(e, t, n, o) {
                    if (e.length) {
                        var a = e.data(),
                            r = t.find("figure.product");
                        if (r.length) {
                            var i = JSON.parse(r.attr("data-product"));
                            return {
                                id: i.id,
                                name: i.name,
                                brand: i.manufacturer,
                                category: a.category || i.category || n,
                                price: i.price,
                                list: o || h(e),
                                position: t.index(),
                                dimension7: (c = i.isHub, c ? "marketing" : "default"),
                                dimension8: i.desc
                            }
                        }
                    }
                    var c;
                    return null
                }
                $((function() {
                    window.carouselInstances = window.carouselInstances || {};
                    var e = new v("#moreLikeThisCarousel", {
                        on: {
                            ready: function() {
                                ! function(e, t, n, o) {
                                    void 0 === t && (t = "._search-item");
                                    var a = $("#moreLikeThisCarousel");
                                    if (a.length) {
                                        var r = {
                                            event: m.w.EcommerceImpression,
                                            ecommerce: {
                                                currencyCode: $("._openGlobalizationSettings").attr("data-currency-code"),
                                                impressions: []
                                            }
                                        };
                                        a.find(t).each((function(e, t) {
                                            var n = $(t),
                                                o = g(a, n, undefined, "related_product");
                                            o && r.ecommerce.impressions.push(o)
                                        })), window.addEventToDataLayer(r)
                                    }
                                }(0, "._search-item"),
                                function(e, t, n, o) {
                                    void 0 === t && (t = "._search-item");
                                    var a = $("#moreLikeThisCarousel");
                                    a.length && a.on("click", t, (function(e) {
                                        var t = $(e.currentTarget),
                                            n = g(a, t, undefined, "related_product");
                                        if (n) {
                                            var o = {
                                                event: m.w.EcommerceClick,
                                                ecommerce: {
                                                    click: {
                                                        actionField: {
                                                            list: h(a)
                                                        },
                                                        products: [n]
                                                    }
                                                }
                                            };
                                            window.addEventToDataLayer(o)
                                        }
                                    }))
                                }(0, "._search-item")
                            }
                        }
                    });
                    $(".more-like-this-container").appear((function() {
                        return (t = window.carouselInstances).moreLikeThis ? Promise.resolve(t.moreLikeThis) : (t.moreLikeThis = !0, e.init().then((function(e) {
                            return window.carouselInstances.moreLikeThis = e
                        })));
                        var t
                    }), {
                        single: !0
                    })
                }));
                var y = function() {
                        var e = function(t, n) {
                            return (e = Object.setPrototypeOf || {
                                    __proto__: []
                                }
                                instanceof Array && function(e, t) {
                                    e.__proto__ = t
                                } || function(e, t) {
                                    for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
                                })(t, n)
                        };
                        return function(t, n) {
                            function o() {
                                this.constructor = t
                            }
                            e(t, n), t.prototype = null === n ? Object.create(n) : (o.prototype = n.prototype, new o)
                        }
                    }(),
                    w = function(e) {
                        function t(t, n) {
                            return e.call(this, t, window.jsLabel.sameCollection.uri, n) || this
                        }
                        return y(t, e), t
                    }(r.hx);
                $((function() {
                    window.carouselInstances = window.carouselInstances || {};
                    var e = new w("#sameCollectionCarousel");
                    $(".same-collection-container").appear((function() {
                        return (t = window.carouselInstances).sameCollection ? Promise.resolve(t.sameCollection) : (t.sameCollection = !0, e.init().then((function(e) {
                            return window.carouselInstances.sameCollection = e
                        })));
                        var t
                    }), {
                        single: !0
                    })
                }));
                var b = function() {
                        var e = function(t, n) {
                            return (e = Object.setPrototypeOf || {
                                    __proto__: []
                                }
                                instanceof Array && function(e, t) {
                                    e.__proto__ = t
                                } || function(e, t) {
                                    for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
                                })(t, n)
                        };
                        return function(t, n) {
                            function o() {
                                this.constructor = t
                            }
                            e(t, n), t.prototype = null === n ? Object.create(n) : (o.prototype = n.prototype, new o)
                        }
                    }(),
                    C = function(e) {
                        function t(t, n) {
                            return e.call(this, t, void 0, n) || this
                        }
                        return b(t, e), t
                    }(r.hx),
                    k = n(68264),
                    _ = ["variant-gallery", "size-gallery", "detail-gallery", "single-image-gallery"],
                    I = {};
                $((function() {
                    $(document).on("click", "[data-reveal-id]", (function() {
                        var e = this;
                        n.e(4842).then(n.bind(n, 94842)).then((function() {
                            var t = $(e).data("reveal-id"),
                                n = $(e).data("index");
                            $("#" + t).find(".index-current").html(n), $("#" + t).foundation("open"), (0, k.V)()
                        }))
                    })), window.carouselInstances = window.carouselInstances || {};
                    for (var e, t = function(t) {
                            var n = $("#" + t);
                            n.length && (I[t] = new C("#" + t + " .details-carousel", {
                                lazyLoad: !0,
                                cellAlign: "center",
                                percentPosition: !0,
                                on: {
                                    ready: function() {
                                        var e = n.find(".is-selected img").data("caption");
                                        (0, l.Zv)(0, e, "details", n)
                                    },
                                    change: function(e) {
                                        var t = n.find(".is-selected img").data("caption");
                                        (0, l.Zv)(e, t, "details", n)
                                    },
                                    select: function(e) {
                                        var t = n.find(".is-selected img").data("caption");
                                        (0, l.Zv)(e, t, "details", n)
                                    }
                                }
                            }), e = t.replace(/-([a-z])/g, (function(e) {
                                return e[1].toUpperCase()
                            })) + "FullscreenCarousel", n.on("open.zf.reveal", (function(o) {
                                var a = window.carouselInstances;
                                return a[e] ? Promise.resolve(a[e]) : (a[e] = !0, I[t].init().then((function(t) {
                                    var o = parseInt(n.find(".index-current").html(), 10) - 1;
                                    t.select(o, !1, !0), t.focus(), window.carouselInstances[e] = t
                                })))
                            })), n.on("closed.zf.reveal", (function(t) {
                                window.carouselInstances[e].destroy(), delete window.carouselInstances[e], (0, k.j)()
                            })))
                        }, o = 0, a = _; o < a.length; o++) t(a[o])
                })), n(65357);
                var R = n(54262),
                    S = n(72937),
                    L = n(86159),
                    P = n(93353),
                    q = n(66295),
                    D = n(21560),
                    T = new L.p("ProductPopContact", "#popContactDialog");

                function E(e, t, n, o, a) {
                    T.loadPopRequest(e, P.x.Product, t, n, o, q.c.Product, a)
                }
                $((function() {
                    var e, t, n;
                    e = $(".product-page").attr("productId"), t = $(".product-page").attr("manufacturerId"), n = (0, R.l)() ? D.M.Bim : D.M.Archiproducts, $(".catalog").click((function(o) {
                        var a = S.i.DownloadCatalog;
                        $(this).hasClass("tenderspecification") ? a = S.i.DownloadCatalogTenderSpecification : $(this).hasClass("techincalsheet") && (a = S.i.DownloadCatalogTechnicalSheet), o.preventDefault();
                        var r = $(this).attr("catalogId");
                        E(n, a, +e, +t, {
                            eventObjectId: +r,
                            socialCanvas: (0, R.o)(),
                            thumbnail: $(this).attr("data-thumbnail"),
                            confirmationText: $(this).attr("data-name"),
                            confirmationDescription: $(this).attr("data-description")
                        })
                    })), $(".sayduck-close-viewer").on("click", (function() {})), $(".sayduck-open-viewer").on("click", (function() {})), $("._bimObject").click((function(o) {
                        o.preventDefault();
                        var a = $(this).attr("bimId");
                        E(n, S.i.DownloadBim, +e, +t, {
                            eventObjectId: +a
                        })
                    })), $("._bimSave").click((function(o) {
                        o.preventDefault();
                        var a = $(this).attr("bimId");
                        E(n, S.i.SaveBim, +e, +t, {
                            eventObjectId: +a
                        })
                    })), $("._moreInfoOn").click((function(o) {
                        o.preventDefault();
                        var a = $(this).attr("requestedUrl");
                        E(n, S.i.ClickMoreInformation, +e, +t, {
                            requestedUrl: a,
                            isCompilationRequired: !1,
                            thumbnail: $(this).attr("data-thumbnail"),
                            confirmationDescription: $(this).attr("data-description"),
                            confirmationText: $(this).attr("data-name")
                        })
                    })), $("#WhereToBuytButton").click((function(o) {
                        o.preventDefault();
                        var a = $(this).attr("requestedUrl");
                        E(n, S.i.ClickWhereToBuyWebSite, +e, +t, {
                            requestedUrl: a,
                            isCompilationRequired: !1,
                            thumbnail: $(this).attr("data-thumbnail"),
                            confirmationDescription: $(this).attr("data-description"),
                            confirmationText: $(this).attr("data-name")
                        })
                    })), $(document).on("click", "._websiteDialog", (function(e) {
                        e.preventDefault();
                        var n = $(this).attr("requestUrl");
                        ! function(e, t, n) {
                            T.loadPopRequest(D.M.Archiproducts, P.x.Manufacturer, e, t, t, q.c.Product, n)
                        }(S.i.ClickWebSite, +t, {
                            requestedUrl: n,
                            isCompilationRequired: !1,
                            thumbnail: $(this).attr("data-thumbnail"),
                            confirmationDescription: $(this).attr("data-description"),
                            confirmationText: $(this).attr("data-name")
                        })
                    })), $("._weblink").click((function(o) {
                        o.preventDefault();
                        var a = $(this).attr("requestedUrl");
                        E(n, S.i.WebLink, +e, +t, {
                            requestedUrl: a,
                            isCompilationRequired: !1,
                            thumbnail: $(this).attr("data-thumbnail"),
                            confirmationDescription: $(this).attr("data-description")
                        })
                    })), $("._not-embeddable").click((function(o) {
                        o.preventDefault();
                        var a = $(this).attr("videoId");
                        E(n, S.i.DownloadVideo, +e, +t, {
                            eventObjectId: +a
                        })
                    }))
                })), n(22681), n(88109);
                var A = n(5080),
                    O = function() {
                        function e() {
                            this._lastSelectedOption = A.l.None, this._bottomInstanceLoader = new N({
                                appName: "InfoRequestBottomForm",
                                container: "#InfoRequestFormContainer",
                                preventOpenEvents: !0,
                                preventOptionsChangeEvents: !0,
                                preventLoadingEvents: !0
                            }), this._modalInstanceLoader = new N({
                                appName: "InfoRequestModal",
                                container: ".apx-modal > div",
                                isModal: !0
                            })
                        }
                        return e.prototype.initInfoRequest = function() {
                            var e = this;
                            $("#InfoRequestFormContainer").appear((function() {
                                e.loadInfoRequestBottomForm()
                            })), $("#PriceRequestButton").on("click", (function() {
                                e.loadInfoRequestModal(A.l.PriceRequest)
                            })), $("#CatalogRequestButton").on("click", (function() {
                                e.loadInfoRequestModal(A.l.CatalogRequest)
                            })), $("#BimCadRequestButton").on("click", (function() {
                                e.loadInfoRequestModal(A.l.BimRequest)
                            })), $("#DealersRequestButton").on("click", (function() {
                                e.loadInfoRequestModal(A.l.DealersRequest)
                            })), $("#RequestInfoToResellerButton, #RequestInfoToProductButton").on("click", (function() {
                                e.loadInfoRequestModal(A.l.GenericRequest)
                            })), $("#MissingBimFileRequest").on("click", (function() {
                                e.loadInfoRequestModal(A.l.BimRequest)
                            })), $("#apx-modal").on("closed.zf.reveal", (function() {
                                e.loadInfoRequestBottomForm()
                            })), $(document).on("click", "._contactCompany", (function() {
                                e.loadManufacturerInfoRequestModal(A.l.ManufacturerProductsBoxRequest)
                            })), this.openInfoRequestDialogFromLogin()
                        }, e.prototype.loadInfoRequestBottomForm = function() {
                            var e = this.retrieveInfoRequestData();
                            this._bottomInstanceLoader.loadInfoRequestForm(e.productId, e.manufacturerId, e.isEcommerce, "info-request-bottom-form", this._lastSelectedOption)
                        }, e.prototype.loadInfoRequestModal = function(e, t) {
                            void 0 === t && (t = P.x.Product), this._lastSelectedOption = e;
                            var n = this.retrieveInfoRequestData();
                            this._modalInstanceLoader.loadInfoRequestForm(n.productId, n.manufacturerId, n.isEcommerce, "info-request-modal-form", e, t).then((function() {
                                return $(".apx-modal").foundation("open")
                            }))
                        }, e.prototype.loadManufacturerInfoRequestModal = function(e) {
                            this.loadInfoRequestModal(e, P.x.Manufacturer)
                        }, e.prototype.retrieveInfoRequestData = function() {
                            var e;
                            return {
                                productId: parseInt($(".product-page").attr("productId")),
                                manufacturerId: parseInt($(".product-page").attr("manufacturerId")),
                                isEcommerce: "true" == (null === (e = $(".product-page").attr("isEcommerce")) || void 0 === e ? void 0 : e.toLowerCase())
                            }
                        }, e.prototype.openInfoRequestDialogFromLogin = function() {
                            var e = function(e) {
                                for (var t = "LoginSourceRequest=", n = document.cookie.split(";"), o = 0; o < n.length; o++) {
                                    for (var a = n[o];
                                        " " == a.charAt(0);) a = a.substring(1);
                                    if (0 == a.indexOf(t)) return a.substring(t.length, a.length)
                                }
                                return ""
                            }();
                            if ("" !== e) switch (document.cookie = "LoginSourceRequest=; expires=Thu, 01 Jan 1970 00:00:00 UTC;", parseInt(e)) {
                                case A.l.ContactRequest:
                                case A.l.GenericRequest:
                                case A.l.None:
                                    $("#RequestInfoToProductButton").trigger("click");
                                    break;
                                case A.l.CatalogRequest:
                                    $("#CatalogRequestButton").trigger("click");
                                    break;
                                case A.l.BimRequest:
                                    $("#BimCadRequestButton").trigger("click");
                                    break;
                                case A.l.DealersRequest:
                                    $("#DealersRequestButton").trigger("click");
                                    break;
                                case A.l.PriceRequest:
                                    $("#PriceRequestButton").trigger("click")
                            }
                        }, e
                    }(),
                    N = function() {
                        function e(e) {
                            var t = e.appName,
                                n = e.container,
                                o = e.isModal,
                                a = void 0 !== o && o,
                                r = e.preventOpenEvents,
                                i = void 0 !== r && r,
                                c = e.preventOptionsChangeEvents,
                                s = void 0 !== c && c,
                                l = e.preventLoadingEvents,
                                u = void 0 !== l && l;
                            this._appName = t, this._container = n, this._isModal = a, this._preventOpenEvents = i, this._preventOptionsChangeEvents = s, this._preventLoadingEvents = u
                        }
                        return e.prototype.loadInfoRequestForm = function(e, t, o, a, r, i) {
                            return void 0 === r && (r = A.l.None), void 0 === i && (i = P.x.Product), c = this, s = void 0, u = function() {
                                var c, s, l;
                                return function(e, t) {
                                    var n, o, a, r, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    };
                                    return r = {
                                        next: c(0),
                                        throw: c(1),
                                        return: c(2)
                                    }, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
                                        return this
                                    }), r;

                                    function c(r) {
                                        return function(c) {
                                            return function(r) {
                                                if (n) throw new TypeError("Generator is already executing.");
                                                for (; i;) try {
                                                    if (n = 1, o && (a = 2 & r[0] ? o.return : r[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, r[1])).done) return a;
                                                    switch (o = 0, a && (r = [2 & r[0], a.value]), r[0]) {
                                                        case 0:
                                                        case 1:
                                                            a = r;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: r[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, o = r[1], r = [0];
                                                            continue;
                                                        case 7:
                                                            r = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== r[0] && 2 !== r[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === r[0] && (!a || r[1] > a[0] && r[1] < a[3])) {
                                                                i.label = r[1];
                                                                break
                                                            }
                                                            if (6 === r[0] && i.label < a[1]) {
                                                                i.label = a[1], a = r;
                                                                break
                                                            }
                                                            if (a && i.label < a[2]) {
                                                                i.label = a[2], i.ops.push(r);
                                                                break
                                                            }
                                                            a[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    r = t.call(e, i)
                                                } catch (e) {
                                                    r = [6, e], o = 0
                                                } finally {
                                                    n = a = 0
                                                }
                                                if (5 & r[0]) throw r[1];
                                                return {
                                                    value: r[0] ? r[1] : void 0,
                                                    done: !0
                                                }
                                            }([r, c])
                                        }
                                    }
                                }(this, (function(u) {
                                    switch (u.label) {
                                        case 0:
                                            return c = {
                                                appName: this._appName,
                                                type: i,
                                                productId: e,
                                                recipientId: t,
                                                isModal: this._isModal,
                                                isEcommerce: o,
                                                selectedOption: r,
                                                container: this._container,
                                                source: q.c.Product,
                                                portal: (0, R.l)() ? D.M.Bim : D.M.Archiproducts,
                                                formId: a
                                            }, this._preventOpenEvents && (c.onOpen = function() {}), this._preventOptionsChangeEvents && (c.onOptionsChange = function() {}), this._preventLoadingEvents && (c.onLoading = c.onLoadComplete = function() {}), [4, Promise.all([n.e(6427), n.e(4350)]).then(n.bind(n, 89250))];
                                        case 1:
                                            return s = u.sent().initInfoRequest, this._instance ? (this._instance.resetForm(), this._instance.setInputOptions(c), [2, this._instance]) : (l = this, [4, s(c)]);
                                        case 2:
                                            return l._instance = u.sent(), [2, this._instance]
                                    }
                                }))
                            }, new((l = Promise) || (l = Promise))((function(e, t) {
                                function n(e) {
                                    try {
                                        a(u.next(e))
                                    } catch (e) {
                                        t(e)
                                    }
                                }

                                function o(e) {
                                    try {
                                        a(u.throw(e))
                                    } catch (e) {
                                        t(e)
                                    }
                                }

                                function a(t) {
                                    var a;
                                    t.done ? e(t.value) : (a = t.value, a instanceof l ? a : new l((function(e) {
                                        e(a)
                                    }))).then(n, o)
                                }
                                a((u = u.apply(c, s || [])).next())
                            }));
                            var c, s, l, u
                        }, e
                    }(),
                    x = new O;

                function M(e) {
                    window.myListsLoader.load().then((function(t) {
                        t.loadMyListsWithChildren(), t.vueDataMyList.pid = e.productId, t.vueDataMyList.pimage = e.productImage, t.vueDataMyList.pimagefilename = e.productImageFileName, t.vueDataMyList.mid = e.manufacturerId, t.vueDataMyList.pissellable = e.productIsSellable, t.vueDataMyList.itemList = e.itemList, t.vueDataMyList.attributeList = e.attributeList, t.vueDataMyList.validationErrorNewList = null, t.vueDataMyList.newListTitle = "";
                        var n = $("#myListReveal");
                        n.attr("data-reveal") || function(e) {
                            e.addClass("reveal").removeClass("hide").attr("data-reveal", "data-reveal").foundation()
                        }(n), n.foundation("open")
                    }))
                }
                $((function() {
                    x.initInfoRequest()
                }));
                var j = function() {
                    return (j = Object.assign || function(e) {
                        for (var t, n = 1, o = arguments.length; n < o; n++)
                            for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                        return e
                    }).apply(this, arguments)
                };
                window.initializeSaveButton = function(e) {
                    $("body").on("click", "._addProductNotSellable", (function() {
                        var t = document.head.querySelector("[property~='og:image'][content]").content;
                        M(j(j({}, e), {
                            productImage: t,
                            productImageFileName: t
                        }))
                    }))
                }, $((function() {
                    document.addEventListener("purchaseForm:addToProject", (function(e) {
                        Promise.all([n.e(7740), n.e(9383)]).then(n.bind(n, 39383)).then((function(t) {
                            var n = t.myListApi;
                            n.updateProduct(e.detail.data, (function(t) {
                                t.result ? n.saveAdditionalItemInfo(window.additionalItemInfoData, (function() {
                                    null === e.detail.backToMyListId ? window.location.href = "/" + e.detail.projectSettings.culture + "/mylists/myprojects/" + e.projectSettings.listId : window.location.href = "/" + e.detail.projectSettings.culture + "/mylists/myprojects/" + e.detail.projectSettings.listId + "?subListId=" + e.detail.projectSettings.subListId
                                }), (function() {
                                    alert("Error while saving additional info")
                                })) : alert("Server Error")
                            }), (function(e) {
                                console.log(e)
                            }))
                        }))
                    })), document.addEventListener("purchaseForm:addToProjectLists", (function(e) {
                        M(e.detail.myListsOptions)
                    }))
                })), window.initTooltip = function() {
                    var e = $(".sfridoTip");
                    new Foundation.Tooltip(e), $("[data-tooltip]:not(.has-tip)").foundation()
                };
                var B, F = function() {
                    return (F = Object.assign || function(e) {
                        for (var t, n = 1, o = arguments.length; n < o; n++)
                            for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                        return e
                    }).apply(this, arguments)
                };
                null === (B = $(".product-page").attr("isEcommerce")) || void 0 === B || B.toLowerCase(), window.initializeProductCartAnalytics = function(e) {
                    document.addEventListener("wr-addToCart", (function(t) {
                        window.addEventToDataLayer({
                            event: m.w.AddToCart,
                            ecommerce: {
                                currencyCode: e.currencyCode,
                                add: {
                                    products: [{
                                        name: e.name,
                                        id: t.detail.id,
                                        price: t.detail.price,
                                        brand: t.detail.brand,
                                        category: e.category,
                                        variant: t.detail.variant,
                                        quantity: t.detail.quantity,
                                        dimension6: null === t.detail.availability ? "infinito" : t.detail.availability,
                                        dimension7: t.detail.productSection,
                                        dimension8: e.typology,
                                        dimension9: e.materials,
                                        dimension10: e.designers
                                    }]
                                }
                            }
                        })
                    }))
                };
                var z = {
                    event: "GAEvent",
                    eventId: "58",
                    eventCategory: "cta-checkout-gialle"
                };
                $("#RequestInfoToProductButton").on("click", (function() {
                    window.addEventToDataLayer(F(F({}, z), {
                        eventAction: A.l[A.l.GenericRequest]
                    }))
                })), $("#CatalogRequestButton").on("click", (function() {
                    window.addEventToDataLayer(F(F({}, z), {
                        eventAction: A.l[A.l.CatalogRequest]
                    }))
                })), $("#BimCadRequestButton").on("click", (function() {
                    window.addEventToDataLayer(F(F({}, z), {
                        eventAction: A.l[A.l.BimRequest]
                    }))
                })), $("#DealersRequestButton").on("click", (function() {
                    window.addEventToDataLayer(F(F({}, z), {
                        eventAction: A.l[A.l.DealersRequest]
                    }))
                })), $("#PriceRequestButton").on("click", (function() {
                    window.addEventToDataLayer(F(F({}, z), {
                        eventAction: A.l[A.l.PriceRequest]
                    }))
                })), $(".phone-text").on("click", (function() {
                    window.addEventToDataLayer({
                        event: "GAEvent",
                        eventId: "59",
                        eventCategory: "cta-checkout",
                        eventAction: "Numero di telefono"
                    })
                })), $(".info-request-button_whatsapp").on("click", (function() {
                    window.addEventToDataLayer({
                        event: "GAEvent",
                        eventId: "59",
                        eventCategory: "cta-checkout",
                        eventAction: "Scrivici su WhatsApp"
                    })
                })), $(".content-quote").on("click", (function() {
                    window.addEventToDataLayer({
                        event: "GAEvent",
                        eventId: "59",
                        eventCategory: "cta-checkout",
                        eventAction: "Richiedi un Preventivo"
                    })
                })), $(document).on("submit", "#revealQuoteRequest form.ng-valid", (function() {
                    window.addEventToDataLayer({
                        event: "GAEvent",
                        eventId: "59",
                        eventCategory: "cta-checkout",
                        eventAction: "Richiedi un Preventivo Send Button"
                    })
                })), n(79884), $((function() {
                    if ($(document).on("open.zf.reveal", "#myProductsDialog[data-reveal]", (function() {
                            $("#myProductsDialog .my-products-pane-list li:last-child .my-products-not-added").removeClass("element-added")
                        })), !Foundation.MediaQuery.atLeast("medium")) {
                        $(".accordion-item[data-close-on-mobile='true']").removeClass("is-active");
                        var e = $(".product-desc-container");
                        e.text().length > 2e3 && e.addClass("cut-desc"), $("._show-desc").on("click", (function() {
                            e.removeClass("cut-desc")
                        }))
                    }
                    $(".accordion-item").on("click", (function() {
                        $(this).removeAttr("data-close-on-mobile")
                    })), $(".badge-more").on("click", (function() {
                        $("html, body").animate({
                            scrollTop: $("#badges").offset().top
                        }, 250)
                    })), $(".reveal.full._video").on("open.zf.reveal", (function(e, t) {
                        var n = $("iframe", this).data("source");
                        null != n && null != n && ($("iframe", this)[0].src = n)
                    }))
                }))
            },
            65357: function(e, t, n) {
                var o = this && this.__awaiter || function(e, t, n, o) {
                        return new(n || (n = Promise))((function(a, r) {
                            function i(e) {
                                try {
                                    s(o.next(e))
                                } catch (e) {
                                    r(e)
                                }
                            }

                            function c(e) {
                                try {
                                    s(o.throw(e))
                                } catch (e) {
                                    r(e)
                                }
                            }

                            function s(e) {
                                var t;
                                e.done ? a(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                    e(t)
                                }))).then(i, c)
                            }
                            s((o = o.apply(e, t || [])).next())
                        }))
                    },
                    a = this && this.__generator || function(e, t) {
                        var n, o, a, r, i = {
                            label: 0,
                            sent: function() {
                                if (1 & a[0]) throw a[1];
                                return a[1]
                            },
                            trys: [],
                            ops: []
                        };
                        return r = {
                            next: c(0),
                            throw: c(1),
                            return: c(2)
                        }, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
                            return this
                        }), r;

                        function c(r) {
                            return function(c) {
                                return function(r) {
                                    if (n) throw new TypeError("Generator is already executing.");
                                    for (; i;) try {
                                        if (n = 1, o && (a = 2 & r[0] ? o.return : r[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, r[1])).done) return a;
                                        switch (o = 0, a && (r = [2 & r[0], a.value]), r[0]) {
                                            case 0:
                                            case 1:
                                                a = r;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: r[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, o = r[1], r = [0];
                                                continue;
                                            case 7:
                                                r = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== r[0] && 2 !== r[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === r[0] && (!a || r[1] > a[0] && r[1] < a[3])) {
                                                    i.label = r[1];
                                                    break
                                                }
                                                if (6 === r[0] && i.label < a[1]) {
                                                    i.label = a[1], a = r;
                                                    break
                                                }
                                                if (a && i.label < a[2]) {
                                                    i.label = a[2], i.ops.push(r);
                                                    break
                                                }
                                                a[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        r = t.call(e, i)
                                    } catch (e) {
                                        r = [6, e], o = 0
                                    } finally {
                                        n = a = 0
                                    }
                                    if (5 & r[0]) throw r[1];
                                    return {
                                        value: r[0] ? r[1] : void 0,
                                        done: !0
                                    }
                                }([r, c])
                            }
                        }
                    };
                $(document).on("click", '[data-open="bim-download-modal"]', (function() {
                    return o(this, void 0, void 0, (function() {
                        return a(this, (function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, Promise.all([n.e(6427), n.e(7302), n.e(2019)]).then(n.bind(n, 62019))];
                                case 1:
                                    return (0, e.sent().onDownloadModalOpenClick)($(this)), [2]
                            }
                        }))
                    }))
                }))
            },
            22681: () => {
                function e() {
                    if ($("#AlternativeBreadcrumbs li").length > 0) {
                        var e = $(".breadcrumbs-container .breadcrumbs li:last-child"),
                            t = e.offset();
                        $(".openAlternativeBreadcrumb svg").css("left", t.left + e.width() + 8 + "px"), $(".openAlternativeBreadcrumb").removeClass("hide")
                    }
                }
                $((function() {
                    e(), $(window).resize(e)
                }))
            },
            88109: () => {
                $((function() {
                    $(".visible-tags a.showlink").click((function(e) {
                        e.preventDefault(), $(this).hide(), $(".invisible-tags").fadeIn().css("display", "inline")
                    })), $(".invisible-tags a.showlink").click((function(e) {
                        e.preventDefault(), $(".invisible-tags").hide(), $(".visible-tags a.showlink").fadeIn()
                    }))
                }))
            },
            54262: (e, t, n) => {
                "use strict";
                var o;

                function a() {
                    return location.hostname.indexOf("bim") >= 0
                }

                function r() {
                    var e = document.location.href,
                        t = o.None;
                    return e.indexOf("canvas") > -1 && (t = o[getParameterByName("canvas", e)]), t
                }
                n.d(t, {
                        o: () => r,
                        l: () => a
                    }),
                    function(e) {
                        e[e.None = 0] = "None", e[e.Pinterest = 1] = "Pinterest", e[e.Facebook = 2] = "Facebook", e[e.Instagram = 3] = "Instagram"
                    }(o || (o = {}))
            },
            3495: (e, t, n) => {
                "use strict";
                n.d(t, {
                    Td: () => s,
                    hx: () => l,
                    kT: () => c
                });
                var o = n(76433),
                    a = n(49570),
                    r = n.n(a),
                    i = function() {
                        return (i = Object.assign || function(e) {
                            for (var t, n = 1, o = arguments.length; n < o; n++)
                                for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                            return e
                        }).apply(this, arguments)
                    },
                    c = "M 71.292969 0.238281 C 75.695312 0.304688 79.242188 3.851562 79.289062 8.242188 C 79.289062 8.242188 79.289062 8.253906 79.289062 8.253906 C 79.289062 10.445312 78.386719 12.433594 76.945312 13.871094 L 40.207031 50.261719 L 76.984375 86.355469 C 78.261719 87.773438 79.042969 89.65625 79.042969 91.722656 C 79.042969 96.164062 75.425781 99.761719 70.964844 99.761719 C 68.902344 99.761719 67.019531 98.992188 65.597656 97.726562 L 65.605469 97.738281 L 23.101562 55.96875 C 21.652344 54.492188 20.746094 52.484375 20.714844 50.261719 L 20.714844 50.257812 C 20.71875 48.023438 21.648438 45.996094 23.136719 44.550781 L 23.140625 44.546875 L 65.648438 2.570312 C 67.0625 1.15625 69.007812 0.269531 71.164062 0.238281 Z M 71.292969 0.238281",
                    s = {
                        pageDots: !1,
                        imagesLoaded: !0,
                        percentPosition: !1,
                        cellAlign: "left",
                        lazyLoad: 6,
                        contain: !0,
                        wrapAround: !1,
                        arrowShape: c
                    },
                    l = function() {
                        function e(e, t, n, o) {
                            this._lastSlide = o, this._element = "string" == typeof e ? document.querySelector(e) : e, this._carouselSettings = n, this._htmlLoadURL = t
                        }
                        return e.prototype.init = function() {
                            var e = this;
                            return this._element ? new Promise((function(t, n) {
                                if (e._htmlLoadURL) $(e._element).load(e._htmlLoadURL, (function() {
                                    e._lastSlide && $(e._element).append(e._lastSlide);
                                    var o = e.initCarousel();
                                    o ? t(o) : n()
                                }));
                                else {
                                    var o = e.initCarousel();
                                    o ? t(o) : n()
                                }
                            })) : Promise.reject()
                        }, e.prototype.clear = function() {
                            this._element
                        }, e.prototype.initCarousel = function() {
                            var e = this,
                                t = i(i(i({}, s), this._carouselSettings || {}), {
                                    on: {
                                        ready: function() {
                                            var t, n;
                                            e._element.classList.add("carousel-ready"), "function" == typeof(null === (n = null === (t = e._carouselSettings) || void 0 === t ? void 0 : t.on) || void 0 === n ? void 0 : n.ready) && e._carouselSettings.on.ready()
                                        },
                                        change: function(t) {
                                            var n, o;
                                            "function" == typeof(null === (o = null === (n = e._carouselSettings) || void 0 === n ? void 0 : n.on) || void 0 === o ? void 0 : o.change) && e._carouselSettings.on.change(t)
                                        },
                                        select: function(t) {
                                            var n, o;
                                            "function" == typeof(null === (o = null === (n = e._carouselSettings) || void 0 === n ? void 0 : n.on) || void 0 === o ? void 0 : o.select) && e._carouselSettings.on.select(t)
                                        }
                                    }
                                }),
                                n = new(r())(this._element, t);
                            return this.setSlidesCountDataAttrs(), (0, o.X8)(this._element), n
                        }, e.prototype.setSlidesCountDataAttrs = function() {
                            for (var e = (this._carouselSettings && this._carouselSettings.watchCSS ? this._element : this._element.querySelector(".flickity-slider")).children.length, t = 1; t <= 10; t++) e > t && this._element.setAttribute("data-more-than-" + t, "");
                            (0, o.YY)(this._element)
                        }, e
                    }()
            },
            86159: (e, t, n) => {
                "use strict";
                n.d(t, {
                    p: () => a
                });
                var o = function() {
                        return (o = Object.assign || function(e) {
                            for (var t, n = 1, o = arguments.length; n < o; n++)
                                for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                            return e
                        }).apply(this, arguments)
                    },
                    a = function() {
                        function e(e, t) {
                            this._appName = e, this._container = t
                        }
                        return e.prototype.loadPopRequest = function(e, t, a, r, i, c, s) {
                            return l = this, u = void 0, f = function() {
                                var l, u, d;
                                return function(e, t) {
                                    var n, o, a, r, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    };
                                    return r = {
                                        next: c(0),
                                        throw: c(1),
                                        return: c(2)
                                    }, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
                                        return this
                                    }), r;

                                    function c(r) {
                                        return function(c) {
                                            return function(r) {
                                                if (n) throw new TypeError("Generator is already executing.");
                                                for (; i;) try {
                                                    if (n = 1, o && (a = 2 & r[0] ? o.return : r[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, r[1])).done) return a;
                                                    switch (o = 0, a && (r = [2 & r[0], a.value]), r[0]) {
                                                        case 0:
                                                        case 1:
                                                            a = r;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: r[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, o = r[1], r = [0];
                                                            continue;
                                                        case 7:
                                                            r = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== r[0] && 2 !== r[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === r[0] && (!a || r[1] > a[0] && r[1] < a[3])) {
                                                                i.label = r[1];
                                                                break
                                                            }
                                                            if (6 === r[0] && i.label < a[1]) {
                                                                i.label = a[1], a = r;
                                                                break
                                                            }
                                                            if (a && i.label < a[2]) {
                                                                i.label = a[2], i.ops.push(r);
                                                                break
                                                            }
                                                            a[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    r = t.call(e, i)
                                                } catch (e) {
                                                    r = [6, e], o = 0
                                                } finally {
                                                    n = a = 0
                                                }
                                                if (5 & r[0]) throw r[1];
                                                return {
                                                    value: r[0] ? r[1] : void 0,
                                                    done: !0
                                                }
                                            }([r, c])
                                        }
                                    }
                                }(this, (function(f) {
                                    switch (f.label) {
                                        case 0:
                                            return l = o({
                                                appName: this._appName,
                                                container: this._container,
                                                portal: e,
                                                type: t,
                                                eventType: a,
                                                targetId: r,
                                                manufacturerId: i,
                                                source: c
                                            }, s), [4, Promise.all([n.e(6427), n.e(9576)]).then(n.bind(n, 89576))];
                                        case 1:
                                            return u = f.sent().initPopRequest, this._instance && (this._instance.$destroy(), this._instance.$el.remove()), d = this, [4, u(l).catch((function() {
                                                return null
                                            }))];
                                        case 2:
                                            return d._instance = f.sent(), [2, this._instance]
                                    }
                                }))
                            }, new((d = Promise) || (d = Promise))((function(e, t) {
                                function n(e) {
                                    try {
                                        a(f.next(e))
                                    } catch (e) {
                                        t(e)
                                    }
                                }

                                function o(e) {
                                    try {
                                        a(f.throw(e))
                                    } catch (e) {
                                        t(e)
                                    }
                                }

                                function a(t) {
                                    var a;
                                    t.done ? e(t.value) : (a = t.value, a instanceof d ? a : new d((function(e) {
                                        e(a)
                                    }))).then(n, o)
                                }
                                a((f = f.apply(l, u || [])).next())
                            }));
                            var l, u, d, f
                        }, e
                    }()
            },
            70585: (e, t, n) => {
                "use strict";
                var o, a, r, i;
                n.d(t, {
                        w: () => o
                    }),
                    function(e) {
                        e.GAEvent = "GAEvent", e.EcommerceImpression = "productImpression", e.EcommerceDetail = "productView", e.EcommerceClick = "productClick", e.AddToCart = "addToCart", e.RemoveFromCart = "removeFromCart", e.Checkout = "checkout", e.Purchase = "purchase", e.DLEvent = "DLEvent"
                    }(o || (o = {})),
                    function(e) {
                        e.MARKETPLACE = "marketplace", e.STANDARD = "standard"
                    }(a || (a = {})),
                    function(e) {
                        e.MIXED = "mixed", e.COURIER = "courier"
                    }(r || (r = {})),
                    function(e) {
                        e.BANK_TRANSFER = "Bonifico Bancario", e.PAYPAL = "PayPal", e.SOFORT = "Sofort", e.CREDIT_CARD = "Carta di Credito", e.IN_STORE_PURCHASE = "Acquisto in negozio", e.PAYMENT_PLAN = "Pagamento rateizzato"
                    }(i || (i = {}))
            },
            79884: () => {
                $('[data-open="video-embed-modal"]').on("click", (function(e) {
                    var t = $(this).data("url");
                    null != t && $("#video-embed-modal iframe").attr("src", t)
                })), $("#video-embed-modal").on("closed.zf.reveal", (function(e, t) {
                    $(this).find("iframe").attr("src", "")
                }))
            },
            76326: (e, t, n) => {
                "use strict";
                n.d(t, {
                    rg: () => a,
                    yC: () => r
                });
                var o = function() {
                        for (var e = 0, t = 0, n = arguments.length; t < n; t++) e += arguments[t].length;
                        var o = Array(e),
                            a = 0;
                        for (t = 0; t < n; t++)
                            for (var r = arguments[t], i = 0, c = r.length; i < c; i++, a++) o[a] = r[i];
                        return o
                    },
                    a = function(e) {
                        var t = document.implementation.createHTMLDocument("_");
                        return t.body.innerHTML = e.trim(), t.body.firstChild
                    },
                    r = function(e, t) {
                        for (var n, a = [], r = 2; r < arguments.length; r++) a[r - 2] = arguments[r];
                        if ("function" == typeof e) return e.apply(void 0, o([t || {}], a));
                        var s, l, u = e;
                        if (null === u) s = document.createDocumentFragment();
                        else if (s = (n = i(u))[0], l = n[1], t)
                            for (var d = 0, f = Object.keys(t); d < f.length; d++) {
                                var p = f[d],
                                    v = t[p];
                                if ("className" === p) l("class", v);
                                else if ("style" === p && "object" == typeof t[p])
                                    for (var m in t[p]) s.style[m] = t[p][m];
                                else p.startsWith("on") && "function" == typeof t[p] ? s.addEventListener(p.substring(2).toLowerCase(), v) : "boolean" == typeof v ? v && l(p, "") : l(p, v)
                            }
                        for (var h = 0, g = a; h < g.length; h++) {
                            var y = g[h];
                            c(s, y)
                        }
                        return s
                    };

                function i(e) {
                    if (["svg", "path", "use", "g", "circle"].indexOf(e) > -1) {
                        var t = document.createElementNS("http://www.w3.org/2000/svg", e);
                        return [t, function(e, n) {
                            return t.setAttributeNS(null, e, n)
                        }]
                    }
                    var n = document.createElement(e);
                    return [n, function(e, t) {
                        return n.setAttribute(e, t)
                    }]
                }

                function c(e, t) {
                    if (null != t)
                        if (Array.isArray(t))
                            for (var n = 0, o = t; n < o.length; n++) c(e, o[n]);
                        else "string" == typeof t ? e.appendChild(document.createTextNode(t)) : t instanceof Node ? e.appendChild(t) : "boolean" == typeof t || e.appendChild(document.createTextNode(String(t)))
                }
            },
            34488: () => {
                String.prototype.format = String.prototype.format || function() {
                    var e = this.toString();
                    if (arguments.length) {
                        var t, n = typeof arguments[0],
                            o = "string" === n || "number" === n ? Array.prototype.slice.call(arguments) : arguments[0];
                        for (t in o) e = e.replace(new RegExp("\\{" + t + "\\}", "gi"), o[t])
                    }
                    return e
                }, String.prototype.formatURIComponent = String.prototype.formatURIComponent || function() {
                    return window.removeDiacritics(this).toLowerCase().replace(/[^a-z0-9\- ]/g, "").trim().replace(/\s+/g, "-")
                }
            },
            33192: t => {
                "use strict";
                t.exports = e
            }
        },
        s = {};

    function l(e) {
        var t = s[e];
        if (void 0 !== t) return t.exports;
        var n = s[e] = {
            exports: {}
        };
        return c[e].call(n.exports, n, n.exports, l), n.exports
    }
    l.m = c, t = [], l.O = (e, n, o, a) => {
        if (!n) {
            var r = 1 / 0;
            for (u = 0; u < t.length; u++) {
                for (var [n, o, a] = t[u], i = !0, c = 0; c < n.length; c++)(!1 & a || r >= a) && Object.keys(l.O).every((e => l.O[e](n[c]))) ? n.splice(c--, 1) : (i = !1, a < r && (r = a));
                if (i) {
                    t.splice(u--, 1);
                    var s = o();
                    void 0 !== s && (e = s)
                }
            }
            return e
        }
        a = a || 0;
        for (var u = t.length; u > 0 && t[u - 1][2] > a; u--) t[u] = t[u - 1];
        t[u] = [n, o, a]
    }, l.n = e => {
        var t = e && e.__esModule ? () => e.default : () => e;
        return l.d(t, {
            a: t
        }), t
    }, o = Object.getPrototypeOf ? e => Object.getPrototypeOf(e) : e => e.__proto__, l.t = function(e, t) {
        if (1 & t && (e = this(e)), 8 & t) return e;
        if ("object" == typeof e && e) {
            if (4 & t && e.__esModule) return e;
            if (16 & t && "function" == typeof e.then) return e
        }
        var a = Object.create(null);
        l.r(a);
        var r = {};
        n = n || [null, o({}), o([]), o(o)];
        for (var i = 2 & t && e;
            "object" == typeof i && !~n.indexOf(i); i = o(i)) Object.getOwnPropertyNames(i).forEach((t => r[t] = () => e[t]));
        return r.default = () => e, l.d(a, r), a
    }, l.d = (e, t) => {
        for (var n in t) l.o(t, n) && !l.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, l.f = {}, l.e = e => Promise.all(Object.keys(l.f).reduce(((t, n) => (l.f[n](e, t), t)), [])), l.u = e => 7922 === e ? "7922.js" : 7302 === e ? "7302.js" : 7740 === e ? "7740.js" : e + "." + {
        1614: "8c69547a2e7bede0be0a",
        2019: "8ea5e245fee5fd48720e",
        2252: "1dfd30ee803d5de1273a",
        2531: "bca3222ab2f4ccb85c62",
        3195: "d260ac5a5d25e0241280",
        4350: "4b9983bb6351cb6f721f",
        4842: "861ac25e5b1f464da6e8",
        5675: "1fad81d5e74c1382624a",
        6427: "cf3e625876b2858b7d4c",
        6895: "829292c1dfa5978a14b0",
        6945: "0ea543a320f57f361190",
        7961: "ef9e8c21698bd64c2383",
        9138: "6b2f6dee9b366ea561d0",
        9383: "7ec6a98fe9ecb70b9c1a",
        9423: "0c987c3a1c8b02f1b46c",
        9576: "80d3593680a5b70ca0b9",
        9597: "72f3652500df3fae93d3"
    }[e] + ".js", l.miniCssF = e => 7387 === e ? "product-page.css" : e + "." + {
        4842: "a7088f0b3c0af4e770b2",
        9138: "54b146633e32b524d015"
    }[e] + ".css", l.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || new Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), l.o = (e, t) => Object.prototype.hasOwnProperty.call(e, t), a = {}, l.l = (e, t, n, o) => {
        if (a[e]) a[e].push(t);
        else {
            var r, i;
            if (void 0 !== n)
                for (var c = document.getElementsByTagName("script"), s = 0; s < c.length; s++) {
                    var u = c[s];
                    if (u.getAttribute("src") == e) {
                        r = u;
                        break
                    }
                }
            r || (i = !0, (r = document.createElement("script")).charset = "utf-8", r.timeout = 120, l.nc && r.setAttribute("nonce", l.nc), r.src = e), a[e] = [t];
            var d = (t, n) => {
                    r.onerror = r.onload = null, clearTimeout(f);
                    var o = a[e];
                    if (delete a[e], r.parentNode && r.parentNode.removeChild(r), o && o.forEach((e => e(n))), t) return t(n)
                },
                f = setTimeout(d.bind(null, void 0, {
                    type: "timeout",
                    target: r
                }), 12e4);
            r.onerror = d.bind(null, r.onerror), r.onload = d.bind(null, r.onload), i && document.head.appendChild(r)
        }
    }, l.r = e => {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, l.p = "/dist/", r = e => new Promise(((t, n) => {
        var o = l.miniCssF(e),
            a = l.p + o;
        if (((e, t) => {
                for (var n = document.getElementsByTagName("link"), o = 0; o < n.length; o++) {
                    var a = (i = n[o]).getAttribute("data-href") || i.getAttribute("href");
                    if ("stylesheet" === i.rel && (a === e || a === t)) return i
                }
                var r = document.getElementsByTagName("style");
                for (o = 0; o < r.length; o++) {
                    var i;
                    if ((a = (i = r[o]).getAttribute("data-href")) === e || a === t) return i
                }
            })(o, a)) return t();
        ((e, t, n, o) => {
            var a = document.createElement("link");
            a.rel = "stylesheet", a.type = "text/css", a.onerror = a.onload = r => {
                if (a.onerror = a.onload = null, "load" === r.type) n();
                else {
                    var i = r && ("load" === r.type ? "missing" : r.type),
                        c = r && r.target && r.target.href || t,
                        s = new Error("Loading CSS chunk " + e + " failed.\n(" + c + ")");
                    s.code = "CSS_CHUNK_LOAD_FAILED", s.type = i, s.request = c, a.parentNode.removeChild(a), o(s)
                }
            }, a.href = t, document.head.appendChild(a)
        })(e, a, t, n)
    })), i = {
        7387: 0
    }, l.f.miniCss = (e, t) => {
        i[e] ? t.push(i[e]) : 0 !== i[e] && {
            4842: 1,
            9138: 1
        }[e] && t.push(i[e] = r(e).then((() => {
            i[e] = 0
        }), (t => {
            throw delete i[e], t
        })))
    }, (() => {
        var e = {
            7387: 0
        };
        l.f.j = (t, n) => {
            var o = l.o(e, t) ? e[t] : void 0;
            if (0 !== o)
                if (o) n.push(o[2]);
                else {
                    var a = new Promise(((n, a) => o = e[t] = [n, a]));
                    n.push(o[2] = a);
                    var r = l.p + l.u(t),
                        i = new Error;
                    l.l(r, (n => {
                        if (l.o(e, t) && (0 !== (o = e[t]) && (e[t] = void 0), o)) {
                            var a = n && ("load" === n.type ? "missing" : n.type),
                                r = n && n.target && n.target.src;
                            i.message = "Loading chunk " + t + " failed.\n(" + a + ": " + r + ")", i.name = "ChunkLoadError", i.type = a, i.request = r, o[1](i)
                        }
                    }), "chunk-" + t, t)
                }
        }, l.O.j = t => 0 === e[t];
        var t = (t, n) => {
                var o, a, [r, i, c] = n,
                    s = 0;
                if (r.some((t => 0 !== e[t]))) {
                    for (o in i) l.o(i, o) && (l.m[o] = i[o]);
                    if (c) var u = c(l)
                }
                for (t && t(n); s < r.length; s++) a = r[s], l.o(e, a) && e[a] && e[a][0](), e[a] = 0;
                return l.O(u)
            },
            n = self.webpackChunk = self.webpackChunk || [];
        n.forEach(t.bind(null, 0)), n.push = t.bind(null, n.push.bind(n))
    })();
    var u = l.O(void 0, [9570], (() => l(16498)));
    return l.O(u)
})()));