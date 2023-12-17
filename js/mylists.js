! function(e, t) {
    if ("object" == typeof exports && "object" == typeof module) module.exports = t(require("moment"));
    else if ("function" == typeof define && define.amd) define(["moment"], t);
    else {
        var i = "object" == typeof exports ? t(require("moment")) : t(e.moment);
        for (var r in i)("object" == typeof exports ? exports : e)[r] = i[r]
    }
}(self, (e => (() => {
    "use strict";
    var t, i = {
            33192: t => {
                t.exports = e
            }
        },
        r = {};

    function o(e) {
        var t = r[e];
        if (void 0 !== t) return t.exports;
        var a = r[e] = {
            exports: {}
        };
        return i[e](a, a.exports, o), a.exports
    }
    o.m = i, o.n = e => {
        var t = e && e.__esModule ? () => e.default : () => e;
        return o.d(t, {
            a: t
        }), t
    }, o.d = (e, t) => {
        for (var i in t) o.o(t, i) && !o.o(e, i) && Object.defineProperty(e, i, {
            enumerable: !0,
            get: t[i]
        })
    }, o.f = {}, o.e = e => Promise.all(Object.keys(o.f).reduce(((t, i) => (o.f[i](e, t), t)), [])), o.u = e => 7740 === e ? "7740.js" : e + "." + {
        5073: "700a4f3fdd8a03022516",
        6318: "731de630acee59bc4a20"
    }[e] + ".js", o.miniCssF = e => {}, o.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || new Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), o.o = (e, t) => Object.prototype.hasOwnProperty.call(e, t), t = {}, o.l = (e, i, r, a) => {
        if (t[e]) t[e].push(i);
        else {
            var n, s;
            if (void 0 !== r)
                for (var u = document.getElementsByTagName("script"), d = 0; d < u.length; d++) {
                    var l = u[d];
                    if (l.getAttribute("src") == e) {
                        n = l;
                        break
                    }
                }
            n || (s = !0, (n = document.createElement("script")).charset = "utf-8", n.timeout = 120, o.nc && n.setAttribute("nonce", o.nc), n.src = e), t[e] = [i];
            var m = (i, r) => {
                    n.onerror = n.onload = null, clearTimeout(c);
                    var o = t[e];
                    if (delete t[e], n.parentNode && n.parentNode.removeChild(n), o && o.forEach((e => e(r))), i) return i(r)
                },
                c = setTimeout(m.bind(null, void 0, {
                    type: "timeout",
                    target: n
                }), 12e4);
            n.onerror = m.bind(null, n.onerror), n.onload = m.bind(null, n.onload), s && document.head.appendChild(n)
        }
    }, o.r = e => {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, o.p = "/dist/", (() => {
        var e = {
            2423: 0
        };
        o.f.j = (t, i) => {
            var r = o.o(e, t) ? e[t] : void 0;
            if (0 !== r)
                if (r) i.push(r[2]);
                else {
                    var a = new Promise(((i, o) => r = e[t] = [i, o]));
                    i.push(r[2] = a);
                    var n = o.p + o.u(t),
                        s = new Error;
                    o.l(n, (i => {
                        if (o.o(e, t) && (0 !== (r = e[t]) && (e[t] = void 0), r)) {
                            var a = i && ("load" === i.type ? "missing" : i.type),
                                n = i && i.target && i.target.src;
                            s.message = "Loading chunk " + t + " failed.\n(" + a + ": " + n + ")", s.name = "ChunkLoadError", s.type = a, s.request = n, r[1](s)
                        }
                    }), "chunk-" + t, t)
                }
        };
        var t = (t, i) => {
                var r, a, [n, s, u] = i,
                    d = 0;
                if (n.some((t => 0 !== e[t]))) {
                    for (r in s) o.o(s, r) && (o.m[r] = s[r]);
                    u && u(o)
                }
                for (t && t(i); d < n.length; d++) a = n[d], o.o(e, a) && e[a] && e[a][0](), e[a] = 0
            },
            i = self.webpackChunk = self.webpackChunk || [];
        i.forEach(t.bind(null, 0)), i.push = t.bind(null, i.push.bind(i))
    })();
    var a = {};
    return (() => {
        o.r(a);
        var e = function() {
            function e() {}
            return e.prototype.load = function() {
                var e = this;
                return this.myLists ? Promise.resolve(this.myLists) : Promise.all([o.e(7740), o.e(6318)]).then(o.bind(o, 86318)).then((function(t) {
                    var i = t.MyLists;
                    return e.myLists = new i, e.myLists.init({
                        apiHost: "",
                        userToken: "",
                        culture: window.culture,
                        validationMessage: window.addTitleValidation,
                        vueElement: "#myListRevealContainer",
                        listType: 2
                    }), e.myLists
                }))
            }, e
        }();
        Date.now(), $((function() {
            window.myListsLoader || (window.myListsLoader = new e), $("#myListReveal").removeClass("reveal").removeAttr("data-reveal").addClass("hide"), $("body").on("click", "._addToListButton", (function() {
                var e, t = $(this).parent().data("product");
                e = {
                    productId: t.id,
                    manufacturerId: t.manufacturerid,
                    productImageFileName: t.imagefilename,
                    productImage: "https://img.edilportale.com/product-thumbs/h_" + t.imagefilename,
                    productIsSellable: 0 != t.price
                }, window.myListsLoader.load().then((function(t) {
                    t.loadMyListsWithChildren(), t.vueDataMyList.pid = e.productId, t.vueDataMyList.pimage = e.productImage, t.vueDataMyList.pimagefilename = e.productImageFileName, t.vueDataMyList.mid = e.manufacturerId, t.vueDataMyList.pissellable = e.productIsSellable, t.vueDataMyList.itemList = e.itemList, t.vueDataMyList.attributeList = e.attributeList, t.vueDataMyList.validationErrorNewList = null, t.vueDataMyList.newListTitle = "";
                    var i = $("#myListReveal");
                    i.attr("data-reveal") || function(e) {
                        e.addClass("reveal").removeClass("hide").attr("data-reveal", "data-reveal").foundation()
                    }(i), i.foundation("open")
                }))
            })), $("#myListReveal").on("open.zf.reveal", (function() {
                window.myListsLoader.load().then((function(e) {
                    e.vueDataMyList.validationErrorNewList = null, e.vueDataMyList.newListTitle = null, e.vueDataMyList.listOpened = null
                }))
            })), $(document).on("mouseenter", "._search-item", (function(e) {
                var t = this;
                o.e(5073).then(o.bind(o, 5073)).then((function(e) {
                    (new(0, e.AddToMyListsButton)).show($(t).find(".product"))
                }))
            }))
        }))
    })(), a
})()));