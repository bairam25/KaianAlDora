! function(e, t) {
    if ("object" == typeof exports && "object" == typeof module) module.exports = t();
    else if ("function" == typeof define && define.amd) define([], t);
    else {
        var r = t();
        for (var n in r)("object" == typeof exports ? exports : e)[n] = r[n]
    }
}(self, (() => (() => {
    var e, t, r, n = {
            5080: (e, t, r) => {
                "use strict";
                var n;
                r.d(t, {
                        l: () => n
                    }),
                    function(e) {
                        e[e.None = 0] = "None", e[e.PriceRequest = 1] = "PriceRequest", e[e.CatalogRequest = 2] = "CatalogRequest", e[e.DealersRequest = 3] = "DealersRequest", e[e.ContactRequest = 4] = "ContactRequest", e[e.GenericRequest = 5] = "GenericRequest", e[e.PriceAndCatalogRequest = 6] = "PriceAndCatalogRequest", e[e.BimRequest = 7] = "BimRequest", e[e.ManufacturerProductsBoxRequest = 8] = "ManufacturerProductsBoxRequest"
                    }(n || (n = {}))
            },
            21560: (e, t, r) => {
                "use strict";
                var n;
                r.d(t, {
                        M: () => n
                    }),
                    function(e) {
                        e[e.Edilportale = 1] = "Edilportale", e[e.Archiproducts = 4] = "Archiproducts", e[e.Archilovers = 5] = "Archilovers", e[e.Bim = 8] = "Bim"
                    }(n || (n = {}))
            },
            93353: (e, t, r) => {
                "use strict";
                var n;
                r.d(t, {
                        x: () => n
                    }),
                    function(e) {
                        e[e.Product = 1] = "Product", e[e.Multi = 2] = "Multi", e[e.Manufacturer = 3] = "Manufacturer", e[e.ReselledProduct = 4] = "ReselledProduct"
                    }(n || (n = {}))
            },
            66295: (e, t, r) => {
                "use strict";
                var n;
                r.d(t, {
                        c: () => n
                    }),
                    function(e) {
                        e[e.Unknown = 0] = "Unknown", e[e.News = 1] = "News", e[e.Product = 2] = "Product", e[e.Manufacturer = 3] = "Manufacturer", e[e.ProductsSearch = 4] = "ProductsSearch", e[e.Reseller = 5] = "Reseller"
                    }(n || (n = {}))
            },
            79761: (e, t, r) => {
                "use strict";

                function n(e) {
                    if (!e.oninput) {
                        for (var t = e.getAttribute("data-filter-model"), r = [], n = document.querySelectorAll('[data-filter="' + t + '"]'), a = 0; a < n.length; a++)
                            for (var o = n[a].children, i = 0; i < o.length; i++) r.push([o[i], o[i].innerText]);
                        e.oninput = function(e) {
                            for (var t = e.target.value, n = new RegExp(t, "i"), a = 0; a < r.length; a++) {
                                var o = r[a];
                                "" == t || n.test(o[1]) && !o[0].classList.contains("headerBrandLetter") ? o[0].style.display = "" : o[0].style.display = "none"
                            }
                        }
                    }
                }
                r.r(t), r.d(t, {
                    attachFacetFilterHandler: () => n
                })
            },
            25334: (e, t, r) => {
                "use strict";

                function n() {
                    var e = document.querySelectorAll("[data-filter-model]");
                    e.length && r.e(9761).then(r.bind(r, 79761)).then((function(t) {
                        for (var r = t.attachFacetFilterHandler, n = 0; n < e.length; n++) r(e[n])
                    }))
                }

                function a() {
                    $('[data-ajax-facet-onclick="true"]').on("click", (function() {
                        var e = $(this).attr("data-result-set");
                        if (e) {
                            var t = document.location.href,
                                r = /\?/i.test(t) ? "&" : "?";
                            r += "facets=" + e, /#/i.test(t) ? t = t.replace(/#(.*?)/i, r + "#$1") : t += r, $.get(t, (function(t) {
                                var r = $(t);
                                $.each(r, (function() {
                                    var t = $(this);
                                    e = e.toLowerCase();
                                    var r = t;
                                    r.addClass("is-active"), $('[data-result-set="' + e + '"]').replaceWith(r), n && n()
                                })), new Foundation.Accordion($(".accordion.filter"))
                            }))
                        }
                    }))
                }
                r.d(t, {
                    facetLoaderOnClick: () => a
                }), n(), $((function() {
                    $("#btnApplyPriceRange").click((function(e) {
                        var t = parseInt($("#sliderMin").get(0).value, 10),
                            r = parseInt($("#sliderMax").get(0).value, 10),
                            n = "";
                        if (isNaN(t) || isNaN(r))
                            if (isNaN(t)) isNaN(r) ? n = a = $(this).data("search-pattern-clear") : (a = $(this).data("search-pattern-under"), o = $(this).data("search-replace-under"), n = a.replace(o, o.replace("0", "{0}").replace("{0}", r)));
                            else {
                                var a = $(this).data("search-pattern-above"),
                                    o = $(this).data("search-replace-above");
                                n = a.replace(o, o.replace("0", "{0}").replace("{0}", t))
                            }
                        else {
                            a = $(this).data("search-pattern-to"), o = $(this).data("search-replace-to");
                            n = a.replace(o, o.replace("0", "{0}").replace("1", "{1}").replace("{0}", Math.min(t, r)).replace("{1}", Math.max(r, t)))
                        }
                        n.length > 0 && (location.href = n)
                    }))
                }))
            },
            54730: () => {
                var e = $("#newsletterSubsciptionDiv");
                $(window).on("scroll", (function() {
                    var t = $(window).scrollTop(),
                        r = $(window).height(),
                        n = $("#floatButton");
                    t <= 0 ? (n.addClass("animeHidden"), n.removeClass("animeVisible")) : e.length && t + r > e.offset().top ? n.addClass("animeHidden") : (n.addClass("animeVisible"), n.removeClass("animeHidden"))
                }))
            },
            70585: (e, t, r) => {
                "use strict";
                var n, a, o, i;
                r.d(t, {
                        w: () => n
                    }),
                    function(e) {
                        e.GAEvent = "GAEvent", e.EcommerceImpression = "productImpression", e.EcommerceDetail = "productView", e.EcommerceClick = "productClick", e.AddToCart = "addToCart", e.RemoveFromCart = "removeFromCart", e.Checkout = "checkout", e.Purchase = "purchase", e.DLEvent = "DLEvent"
                    }(n || (n = {})),
                    function(e) {
                        e.MARKETPLACE = "marketplace", e.STANDARD = "standard"
                    }(a || (a = {})),
                    function(e) {
                        e.MIXED = "mixed", e.COURIER = "courier"
                    }(o || (o = {})),
                    function(e) {
                        e.BANK_TRANSFER = "Bonifico Bancario", e.PAYPAL = "PayPal", e.SOFORT = "Sofort", e.CREDIT_CARD = "Carta di Credito", e.IN_STORE_PURCHASE = "Acquisto in negozio", e.PAYMENT_PLAN = "Pagamento rateizzato"
                    }(i || (i = {}))
            }
        },
        a = {};

    function o(e) {
        var t = a[e];
        if (void 0 !== t) return t.exports;
        var r = a[e] = {
            exports: {}
        };
        return n[e].call(r.exports, r, r.exports, o), r.exports
    }
    o.m = n, o.n = e => {
        var t = e && e.__esModule ? () => e.default : () => e;
        return o.d(t, {
            a: t
        }), t
    }, t = Object.getPrototypeOf ? e => Object.getPrototypeOf(e) : e => e.__proto__, o.t = function(r, n) {
        if (1 & n && (r = this(r)), 8 & n) return r;
        if ("object" == typeof r && r) {
            if (4 & n && r.__esModule) return r;
            if (16 & n && "function" == typeof r.then) return r
        }
        var a = Object.create(null);
        o.r(a);
        var i = {};
        e = e || [null, t({}), t([]), t(t)];
        for (var c = 2 & n && r;
            "object" == typeof c && !~e.indexOf(c); c = t(c)) Object.getOwnPropertyNames(c).forEach((e => i[e] = () => r[e]));
        return i.default = () => r, o.d(a, i), a
    }, o.d = (e, t) => {
        for (var r in t) o.o(t, r) && !o.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, o.f = {}, o.e = e => Promise.all(Object.keys(o.f).reduce(((t, r) => (o.f[r](e, t), t)), [])), o.u = e => e + "." + {
        3195: "d260ac5a5d25e0241280",
        6295: "ef1c59b3e3c96f0ab847",
        9250: "09db11e5b652fdee66b6",
        9423: "0c987c3a1c8b02f1b46c",
        9761: "a2b8bdc06b6acc162f94"
    }[e] + ".js", o.miniCssF = e => {}, o.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || new Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), o.o = (e, t) => Object.prototype.hasOwnProperty.call(e, t), r = {}, o.l = (e, t, n, a) => {
        if (r[e]) r[e].push(t);
        else {
            var i, c;
            if (void 0 !== n)
                for (var u = document.getElementsByTagName("script"), l = 0; l < u.length; l++) {
                    var s = u[l];
                    if (s.getAttribute("src") == e) {
                        i = s;
                        break
                    }
                }
            i || (c = !0, (i = document.createElement("script")).charset = "utf-8", i.timeout = 120, o.nc && i.setAttribute("nonce", o.nc), i.src = e), r[e] = [t];
            var d = (t, n) => {
                    i.onerror = i.onload = null, clearTimeout(f);
                    var a = r[e];
                    if (delete r[e], i.parentNode && i.parentNode.removeChild(i), a && a.forEach((e => e(n))), t) return t(n)
                },
                f = setTimeout(d.bind(null, void 0, {
                    type: "timeout",
                    target: i
                }), 12e4);
            i.onerror = d.bind(null, i.onerror), i.onload = d.bind(null, i.onload), c && document.head.appendChild(i)
        }
    }, o.r = e => {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, o.p = "/dist/", (() => {
        var e = {
            3706: 0,
            6595: 0,
            9761: 0
        };
        o.f.j = (t, r) => {
            var n = o.o(e, t) ? e[t] : void 0;
            if (0 !== n)
                if (n) r.push(n[2]);
                else {
                    var a = new Promise(((r, a) => n = e[t] = [r, a]));
                    r.push(n[2] = a);
                    var i = o.p + o.u(t),
                        c = new Error;
                    o.l(i, (r => {
                        if (o.o(e, t) && (0 !== (n = e[t]) && (e[t] = void 0), n)) {
                            var a = r && ("load" === r.type ? "missing" : r.type),
                                i = r && r.target && r.target.src;
                            c.message = "Loading chunk " + t + " failed.\n(" + a + ": " + i + ")", c.name = "ChunkLoadError", c.type = a, c.request = i, n[1](c)
                        }
                    }), "chunk-" + t, t)
                }
        };
        var t = (t, r) => {
                var n, a, [i, c, u] = r,
                    l = 0;
                if (i.some((t => 0 !== e[t]))) {
                    for (n in c) o.o(c, n) && (o.m[n] = c[n]);
                    u && u(o)
                }
                for (t && t(r); l < i.length; l++) a = i[l], o.o(e, a) && e[a] && e[a][0](), e[a] = 0
            },
            r = self.webpackChunk = self.webpackChunk || [];
        r.forEach(t.bind(null, 0)), r.push = t.bind(null, r.push.bind(r))
    })();
    var i = {};
    return (() => {
        "use strict";
        o.r(i), o(54730);
        var e = o(70585);

        function t(e) {
            if (e.hasClass("dynamic-products-container") && "weekly-selection" == e.closest("[data-widget]").attr("data-widget")) return "home_page";
            if (e.attr("data-sorting")) switch (e.attr("data-sorting")) {
                case "PriceAsc":
                    return "sorting_increasing_price";
                case "PriceDesc":
                    return "sorting_decreasing_price"
            }
            return "standard_sorting"
        }
        var r = o(5080),
            n = o(21560),
            a = o(93353),
            c = o(66295);
        window.initMultiRdi = function(e, t) {
            var i = $("html").attr("lang"),
                u = ".apx-modal > div";
            $("._mrdiRequest").on("click", (function(l) {
                return s = this, d = void 0, p = function() {
                    return function(e, t) {
                        var r, n, a, o, i = {
                            label: 0,
                            sent: function() {
                                if (1 & a[0]) throw a[1];
                                return a[1]
                            },
                            trys: [],
                            ops: []
                        };
                        return o = {
                            next: c(0),
                            throw: c(1),
                            return: c(2)
                        }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                            return this
                        }), o;

                        function c(o) {
                            return function(c) {
                                return function(o) {
                                    if (r) throw new TypeError("Generator is already executing.");
                                    for (; i;) try {
                                        if (r = 1, n && (a = 2 & o[0] ? n.return : o[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, o[1])).done) return a;
                                        switch (n = 0, a && (o = [2 & o[0], a.value]), o[0]) {
                                            case 0:
                                            case 1:
                                                a = o;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: o[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = o[1], o = [0];
                                                continue;
                                            case 7:
                                                o = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === o[0] && (!a || o[1] > a[0] && o[1] < a[3])) {
                                                    i.label = o[1];
                                                    break
                                                }
                                                if (6 === o[0] && i.label < a[1]) {
                                                    i.label = a[1], a = o;
                                                    break
                                                }
                                                if (a && i.label < a[2]) {
                                                    i.label = a[2], i.ops.push(o);
                                                    break
                                                }
                                                a[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        o = t.call(e, i)
                                    } catch (e) {
                                        o = [6, e], n = 0
                                    } finally {
                                        r = a = 0
                                    }
                                    if (5 & o[0]) throw o[1];
                                    return {
                                        value: o[0] ? o[1] : void 0,
                                        done: !0
                                    }
                                }([o, c])
                            }
                        }
                    }(this, (function(s) {
                        switch (s.label) {
                            case 0:
                                return l.preventDefault(), $(u).length ? [4, Promise.all([o.e(6295), o.e(9250)]).then(o.bind(o, 89250))] : [3, 3];
                            case 1:
                                return [4, (0, s.sent().initInfoRequest)({
                                    type: a.x.Multi,
                                    portal: n.M.Archiproducts,
                                    source: c.c.ProductsSearch,
                                    culture: i,
                                    productsFilter: e,
                                    requestUrl: t,
                                    selectedOption: r.l.PriceAndCatalogRequest,
                                    appName: "MultiRDI",
                                    container: u,
                                    onClose: function() {
                                        $(".apx-modal").foundation("close")
                                    },
                                    subject: $("#meta-content").text()
                                })];
                            case 2:
                                s.sent(), s.label = 3;
                            case 3:
                                return $(".apx-modal").foundation("open"), [2]
                        }
                    }))
                }, new((f = void 0) || (f = Promise))((function(e, t) {
                    function r(e) {
                        try {
                            a(p.next(e))
                        } catch (e) {
                            t(e)
                        }
                    }

                    function n(e) {
                        try {
                            a(p.throw(e))
                        } catch (e) {
                            t(e)
                        }
                    }

                    function a(t) {
                        var a;
                        t.done ? e(t.value) : (a = t.value, a instanceof f ? a : new f((function(e) {
                            e(a)
                        }))).then(r, n)
                    }
                    a((p = p.apply(s, d || [])).next())
                }));
                var s, d, f, p
            }))
        };
        var u = o(25334),
            l = o(79761);
        ! function(r, n, a, o) {
            void 0 === n && (n = "._search-item");
            var i = $("#productGrid");
            i.length && i.on("click", n, (function(r) {
                var n = $(r.currentTarget),
                    a = function(e, r, n, a) {
                        if (e.length) {
                            var o = e.data(),
                                i = r.find("figure.product");
                            if (i.length) {
                                var c = JSON.parse(i.attr("data-product"));
                                return {
                                    id: c.id,
                                    name: c.name,
                                    brand: c.manufacturer,
                                    category: o.category || c.category || n,
                                    price: c.price,
                                    list: a || t(e),
                                    position: r.index(),
                                    dimension7: (u = c.isHub, u ? "marketing" : "default"),
                                    dimension8: c.desc
                                }
                            }
                        }
                        var u;
                        return null
                    }(i, n, undefined, undefined);
                if (a) {
                    var o = {
                        event: e.w.EcommerceClick,
                        ecommerce: {
                            click: {
                                actionField: {
                                    list: t(i)
                                },
                                products: [a]
                            }
                        }
                    };
                    window.addEventToDataLayer(o)
                }
            }))
        }(), window.initTopManufacturers = function() {
            $("#featuredBrandsModal").on("open.zf.reveal", (function() {
                $("#featureBrandContent").empty().append($("#facetBrand").clone()), (0, l.attachFacetFilterHandler)($("#featureBrandContent [data-filter-model]")[0])
            })), $(document).on("click", "#featuredClose", (function(e) {
                e.preventDefault(), $("#facetBrand ul li").show(), $("#featuredBrandsModal").foundation("close")
            }))
        }, $((function() {
            (0, u.facetLoaderOnClick)()
        }))
    })(), i
})()));