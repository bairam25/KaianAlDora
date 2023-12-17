! function(e, t) {
    if ("object" == typeof exports && "object" == typeof module) module.exports = t();
    else if ("function" == typeof define && define.amd) define([], t);
    else {
        var o = t();
        for (var n in o)("object" == typeof exports ? exports : e)[n] = o[n]
    }
}(self, (() => (() => {
    "use strict";
    var e, t, o, n = {
            81510: (e, t, o) => {
                o.d(t, {
                    tI: () => c,
                    y8: () => i,
                    uw: () => n
                });
                var n, i, r = o(25915),
                    a = function() {
                        return (a = Object.assign || function(e) {
                            for (var t, o = 1, n = arguments.length; o < n; o++)
                                for (var i in t = arguments[o]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                            return e
                        }).apply(this, arguments)
                    },
                    s = function(e, t, o, n) {
                        return new(o || (o = Promise))((function(i, r) {
                            function a(e) {
                                try {
                                    l(n.next(e))
                                } catch (e) {
                                    r(e)
                                }
                            }

                            function s(e) {
                                try {
                                    l(n.throw(e))
                                } catch (e) {
                                    r(e)
                                }
                            }

                            function l(e) {
                                var t;
                                e.done ? i(e.value) : (t = e.value, t instanceof o ? t : new o((function(e) {
                                    e(t)
                                }))).then(a, s)
                            }
                            l((n = n.apply(e, t || [])).next())
                        }))
                    },
                    l = function(e, t) {
                        var o, n, i, r, a = {
                            label: 0,
                            sent: function() {
                                if (1 & i[0]) throw i[1];
                                return i[1]
                            },
                            trys: [],
                            ops: []
                        };
                        return r = {
                            next: s(0),
                            throw: s(1),
                            return: s(2)
                        }, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
                            return this
                        }), r;

                        function s(r) {
                            return function(s) {
                                return function(r) {
                                    if (o) throw new TypeError("Generator is already executing.");
                                    for (; a;) try {
                                        if (o = 1, n && (i = 2 & r[0] ? n.return : r[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, r[1])).done) return i;
                                        switch (n = 0, i && (r = [2 & r[0], i.value]), r[0]) {
                                            case 0:
                                            case 1:
                                                i = r;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: r[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = r[1], r = [0];
                                                continue;
                                            case 7:
                                                r = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!((i = (i = a.trys).length > 0 && i[i.length - 1]) || 6 !== r[0] && 2 !== r[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === r[0] && (!i || r[1] > i[0] && r[1] < i[3])) {
                                                    a.label = r[1];
                                                    break
                                                }
                                                if (6 === r[0] && a.label < i[1]) {
                                                    a.label = i[1], i = r;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(r);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        r = t.call(e, a)
                                    } catch (e) {
                                        r = [6, e], n = 0
                                    } finally {
                                        o = i = 0
                                    }
                                    if (5 & r[0]) throw r[1];
                                    return {
                                        value: r[0] ? r[1] : void 0,
                                        done: !0
                                    }
                                }([r, s])
                            }
                        }
                    };
                ! function(e) {
                    e.Product = "Product", e.Event = "Event"
                }(n || (n = {})),
                function(e) {
                    e[e.Mandatory = 1] = "Mandatory", e[e.Optional = 2] = "Optional", e[e.Promo = 3] = "Promo", e[e.PromoImg = 4] = "PromoImg", e[e.ProfessionImg = 7] = "ProfessionImg", e[e.SpecialDayPromo = 8] = "SpecialDayPromo"
                }(i || (i = {}));
                var c = function() {
                    function e(e) {
                        this.options = {
                            eventType: n.Event,
                            userIsAuthenticated: !1,
                            isFbMarketing: !1,
                            openDialog: !1,
                            openDelay: 0,
                            newsletterFooterBox: "#newsletterSubsciptionDiv",
                            newsletterDialogContainer: "#invitation-subscription-dialog-container",
                            newsletterDialogCloseButton: "#xCloseDialog, #linkCloseDialog",
                            newsletterDialogSubscribeButton: "#buttonNewsletterInvitation",
                            newsletterDialogEmailInput: "#inputEmailInvitationSubscription",
                            newsletterDialogJobInput: "input[type=radio][name=job]:checked",
                            newsletterDialogPrivacyInfoCheckbox: "#checkboxInfoPrivacyPopNewsletter",
                            newsletterDialogErrorBox: "#newsletterInvitationErrorMsg",
                            newsletterRecaptchaContainer: "#newsletter-dialog-recaptcha-placeholder",
                            dynamicProductsMoreButton: "._dynamicproducts-morebutton",
                            dialogType: i.PromoImg
                        }, this.elements = {
                            dialogContainer$: null,
                            dialogOverlay$: null,
                            dialogCloseButton$: null,
                            dialogSubscribeButton$: null,
                            newsletterFooterBox$: null,
                            dynamicProductsMoreButton$: null
                        }, this.firstTimeOpen = !0, this.inactivityTimeout = 9e3, this.options = a(a({}, this.options), e), this.elements.dialogContainer$ = $(this.options.newsletterDialogContainer), this.elements.newsletterFooterBox$ = $(this.options.newsletterFooterBox), this.elements.dynamicProductsMoreButton$ = $(this.options.dynamicProductsMoreButton), this.init()
                    }
                    return e.prototype.init = function() {
                        var e = this;
                        this.dialog = new Foundation.Reveal(this.elements.dialogContainer$, {
                            closeOnClick: this.options.dialogType != i.Mandatory,
                            closeOnEsc: this.options.dialogType != i.Mandatory
                        }), this.options.openDialog ? setTimeout((function() {
                            e.checkCookieAndShowDialogOnce()
                        }), this.options.openDelay) : this.options.userIsAuthenticated || this.options.eventType == n.Product && this.initDialogForProductPage(), this.addSpecificClassForProfessionModal()
                    }, e.prototype.addSpecificClassForProfessionModal = function() {
                        this.options.dialogType != i.ProfessionImg && this.options.dialogType != i.SpecialDayPromo || $(this.options.newsletterDialogContainer).addClass("clear-bg")
                    }, e.prototype.initDialogForProductPage = function() {
                        var e = this;
                        $(document).mouseleave((function() {
                            e.checkCookieAndShowDialogOnce()
                        })), this.setDialogTimeout(), $(document).on("click keypress scroll", (function() {
                            e.firstTimeOpen && (e.clearDialogTimeout(), e.setDialogTimeout())
                        }))
                    }, e.prototype.setDialogTimeout = function() {
                        var e = this;
                        this.dialogTimeout = setTimeout((function() {
                            e.checkCookieAndShowDialogOnce()
                        }), this.inactivityTimeout)
                    }, e.prototype.clearDialogTimeout = function() {
                        this.dialogTimeout && (clearTimeout(this.dialogTimeout), this.dialogTimeout = null)
                    }, e.prototype.isNewsletterDialogCookiePresent = function() {
                        var e = function(e) {
                            for (var t = "showDialog=", o = document.cookie.split(";"), n = 0; n < o.length; n++) {
                                for (var i = o[n];
                                    " " == i.charAt(0);) i = i.substring(1);
                                if (0 == i.indexOf(t)) return i.substring(t.length, i.length)
                            }
                            return ""
                        }();
                        return null != e && "" != e
                    }, e.prototype.isSomeOtherDialogOpen = function() {
                        return $(".reveal, [role='dialog'], .modal-login").is(":visible")
                    }, e.prototype.getEventId = function(e, t) {
                        var o, n, r = {
                                visual: (o = {}, o[i.Mandatory] = 350, o[i.Optional] = 353, o[i.Promo] = 356, o[i.PromoImg] = 359, o[i.ProfessionImg] = 362, o[i.SpecialDayPromo] = 364, o),
                                close: (n = {}, n[i.Mandatory] = 351, n[i.Optional] = 354, n[i.Promo] = 357, n[i.PromoImg] = 360, n[i.ProfessionImg] = 363, n[i.SpecialDayPromo] = 365, n)
                            },
                            a = ("visual" === t ? r.visual : r.close)[e];
                        if (void 0 === a) throw new Error("Invalid dialog: " + e);
                        return a
                    }, e.prototype.checkCookieAndShowDialogOnce = function() {
                        this.firstTimeOpen && !this.isSomeOtherDialogOpen() && (this.isNewsletterDialogCookiePresent() || this.showDialog(), this.firstTimeOpen = !1, this.clearDialogTimeout())
                    }, e.prototype.showDialog = function(e) {
                        return void 0 === e && (e = !1), s(this, void 0, void 0, (function() {
                            var t, n = this;
                            return l(this, (function(r) {
                                switch (r.label) {
                                    case 0:
                                        return this.newsletterSubscriptionApi ? [3, 2] : [4, o.e(2402).then(o.bind(o, 92402))];
                                    case 1:
                                        t = r.sent().NewsletterApi, this.newsletterSubscriptionApi = new t, r.label = 2;
                                    case 2:
                                        return this.newsletterSubscriptionApi.getNewsletterDialog((function(t) {
                                            return s(n, void 0, void 0, (function() {
                                                var n, r, a;
                                                return l(this, (function(s) {
                                                    switch (s.label) {
                                                        case 0:
                                                            return [4, o.e(4700).then(o.bind(o, 34700))];
                                                        case 1:
                                                            return s.sent(), this.elements.dialogContainer$.empty(), this.elements.dialogContainer$.html(t), this.dialog.open(), this.initDialogElements(), this.initDialogEvents(), n = "Visual_modal_" + this.options.dialogType.toString() + "_" + i[this.options.dialogType].toLowerCase() + (e ? "_fb" : ""), r = "modal_" + this.options.dialogType.toString() + "_" + i[this.options.dialogType].toLowerCase() + (e ? "_fb" : ""), a = "" + this.getEventId(this.options.dialogType, "visual"), ga("send", "event", "LOGIN_REGISTRAZIONI", "REGISTRAZIONE_NEWSLETTER", n, 1, {
                                                                nonInteraction: 1
                                                            }), window.addEventToDataLayer({
                                                                event: "GAEvent",
                                                                eventCategory: "modal_marketing",
                                                                eventAction: "visual",
                                                                eventLabel: r,
                                                                eventId: a
                                                            }), [2]
                                                    }
                                                }))
                                            }))
                                        }), (function(e) {
                                            console.error(e)
                                        }), this.options.dialogType), [2]
                                }
                            }))
                        }))
                    }, e.prototype.closeDialog = function() {
                        this.dialog.close(), (0, r.d)("showDialog", "showDialog", 7)
                    }, e.prototype.initDialogElements = function() {
                        this.elements.dialogCloseButton$ = this.elements.dialogContainer$.find(this.options.newsletterDialogCloseButton), this.elements.dialogSubscribeButton$ = this.elements.dialogContainer$.find(this.options.newsletterDialogSubscribeButton), this.elements.dialogOverlay$ = this.elements.dialogContainer$.parent(".reveal-overlay")
                    }, e.prototype.initDialogEvents = function() {
                        var e = this,
                            t = "Close_modal_" + this.options.dialogType.toString() + "_" + i[this.options.dialogType].toLowerCase(),
                            n = "modal_" + this.options.dialogType.toString() + "_" + i[this.options.dialogType].toLowerCase(),
                            a = "" + this.getEventId(this.options.dialogType, "close");
                        this.elements.dialogCloseButton$.click((function() {
                            ga("send", "event", "LOGIN_REGISTRAZIONI", "REGISTRAZIONE_NEWSLETTER", t, 1, {
                                nonInteraction: 1
                            }), window.addEventToDataLayer({
                                event: "GAEvent",
                                eventCategory: "modal_marketing",
                                eventAction: "close",
                                eventLabel: n,
                                eventId: a
                            }), e.closeDialog(), document.dispatchEvent(new CustomEvent("newsletter-dialog:close"))
                        })), this.elements.dialogOverlay$.click((function(o) {
                            o.target == e.elements.dialogOverlay$.get(0) && (ga("send", "event", "LOGIN_REGISTRAZIONI", "REGISTRAZIONE_NEWSLETTER", t, 1, {
                                nonInteraction: 1
                            }), window.addEventToDataLayer({
                                event: "GAEvent",
                                eventCategory: "modal_marketing",
                                eventAction: "close",
                                eventLabel: n,
                                eventId: a
                            }), document.dispatchEvent(new CustomEvent("newsletter-dialog:close")))
                        })), this.elements.dialogContainer$.keydown((function(o) {
                            e.elements.dialogContainer$.is(":visible") && 27 == o.keyCode && (ga("send", "event", "LOGIN_REGISTRAZIONI", "REGISTRAZIONE_NEWSLETTER", t, 1, {
                                nonInteraction: 1
                            }), window.addEventToDataLayer({
                                event: "GAEvent",
                                eventCategory: "modal_marketing",
                                eventAction: "close",
                                eventLabel: n,
                                eventId: a
                            }), document.dispatchEvent(new CustomEvent("newsletter-dialog:close")))
                        })), this.elements.dialogSubscribeButton$.click((function(t) {
                            return s(e, void 0, void 0, (function() {
                                var e, n, a, s, c = this;
                                return l(this, (function(l) {
                                    switch (l.label) {
                                        case 0:
                                            return [4, o.e(3612).then(o.bind(o, 63612))];
                                        case 1:
                                            return e = l.sent(), n = e.NewsletterConfirmationType, a = e.NewsletterSubscription, s = e.NewsletterSubscriptionType, null == this.newsletterDialogSubscription && (this.newsletterDialogSubscription = new a({
                                                isFbMarketing: this.options.isFbMarketing,
                                                newsletterSubscruptionType: s.Popup,
                                                newsletterConfirmationType: n.Dialog,
                                                newsletterBoxContainer: this.options.newsletterDialogContainer,
                                                newsletterEmailInput: this.options.newsletterDialogEmailInput,
                                                newsletterJobRadioInput: this.options.newsletterDialogJobInput,
                                                newsletterErrorBox: this.options.newsletterDialogErrorBox,
                                                newsletterPrivacyInfoCheckbox: this.options.newsletterDialogPrivacyInfoCheckbox,
                                                newsletterSubscribeButton: this.options.newsletterDialogSubscribeButton,
                                                newsletterDialogType: this.options.dialogType,
                                                newsletterRecaptchaContainer: this.options.newsletterRecaptchaContainer,
                                                onError: function(e, t) {
                                                    $(c.options.newsletterDialogContainer).find(c.options.newsletterDialogErrorBox).text(e), "AlreadySubscribed" == t && ((0, r.d)("showDialog", "showDialog", 90), c.options.dialogType != i.Mandatory && c.options.dialogType != i.Optional && c.options.dialogType != i.ProfessionImg || c.dialog.close())
                                                }
                                            })), this.newsletterDialogSubscription.onSubscriptionButtonClick(t), [2]
                                    }
                                }))
                            }))
                        }))
                    }, e
                }()
            },
            25915: (e, t, o) => {
                function n(e, t, o, n) {
                    var i = "";
                    if (o) {
                        var r = new Date;
                        r.setTime(r.getTime() + 24 * o * 60 * 60 * 1e3), i = "; expires=" + r.toUTCString()
                    }
                    var a = "";
                    n && (a = "; domain=" + n), document.cookie = e + "=" + (t || "") + i + a + "; path=/"
                }
                o.d(t, {
                    d: () => n
                })
            }
        },
        i = {};

    function r(e) {
        var t = i[e];
        if (void 0 !== t) return t.exports;
        var o = i[e] = {
            exports: {}
        };
        return n[e](o, o.exports, r), o.exports
    }
    r.m = n, r.d = (e, t) => {
        for (var o in t) r.o(t, o) && !r.o(e, o) && Object.defineProperty(e, o, {
            enumerable: !0,
            get: t[o]
        })
    }, r.f = {}, r.e = e => Promise.all(Object.keys(r.f).reduce(((t, o) => (r.f[o](e, t), t)), [])), r.u = e => e + "." + {
        2402: "a6ed784a7a6fbf7a9bee",
        3612: "667b814e2a491ac85ea6",
        4700: "7693ecee909b8c2ff1ac"
    }[e] + ".js", r.miniCssF = e => e + ".e5461a631450115bb713.css", r.o = (e, t) => Object.prototype.hasOwnProperty.call(e, t), e = {}, r.l = (t, o, n, i) => {
        if (e[t]) e[t].push(o);
        else {
            var a, s;
            if (void 0 !== n)
                for (var l = document.getElementsByTagName("script"), c = 0; c < l.length; c++) {
                    var u = l[c];
                    if (u.getAttribute("src") == t) {
                        a = u;
                        break
                    }
                }
            a || (s = !0, (a = document.createElement("script")).charset = "utf-8", a.timeout = 120, r.nc && a.setAttribute("nonce", r.nc), a.src = t), e[t] = [o];
            var d = (o, n) => {
                    a.onerror = a.onload = null, clearTimeout(p);
                    var i = e[t];
                    if (delete e[t], a.parentNode && a.parentNode.removeChild(a), i && i.forEach((e => e(n))), o) return o(n)
                },
                p = setTimeout(d.bind(null, void 0, {
                    type: "timeout",
                    target: a
                }), 12e4);
            a.onerror = d.bind(null, a.onerror), a.onload = d.bind(null, a.onload), s && document.head.appendChild(a)
        }
    }, r.r = e => {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.p = "/dist/", t = e => new Promise(((t, o) => {
        var n = r.miniCssF(e),
            i = r.p + n;
        if (((e, t) => {
                for (var o = document.getElementsByTagName("link"), n = 0; n < o.length; n++) {
                    var i = (a = o[n]).getAttribute("data-href") || a.getAttribute("href");
                    if ("stylesheet" === a.rel && (i === e || i === t)) return a
                }
                var r = document.getElementsByTagName("style");
                for (n = 0; n < r.length; n++) {
                    var a;
                    if ((i = (a = r[n]).getAttribute("data-href")) === e || i === t) return a
                }
            })(n, i)) return t();
        ((e, t, o, n) => {
            var i = document.createElement("link");
            i.rel = "stylesheet", i.type = "text/css", i.onerror = i.onload = r => {
                if (i.onerror = i.onload = null, "load" === r.type) o();
                else {
                    var a = r && ("load" === r.type ? "missing" : r.type),
                        s = r && r.target && r.target.href || t,
                        l = new Error("Loading CSS chunk " + e + " failed.\n(" + s + ")");
                    l.code = "CSS_CHUNK_LOAD_FAILED", l.type = a, l.request = s, i.parentNode.removeChild(i), n(l)
                }
            }, i.href = t, document.head.appendChild(i)
        })(e, i, t, o)
    })), o = {
        8332: 0,
        1510: 0
    }, r.f.miniCss = (e, n) => {
        o[e] ? n.push(o[e]) : 0 !== o[e] && {
            4700: 1
        }[e] && n.push(o[e] = t(e).then((() => {
            o[e] = 0
        }), (t => {
            throw delete o[e], t
        })))
    }, (() => {
        var e = {
            8332: 0,
            1510: 0
        };
        r.f.j = (t, o) => {
            var n = r.o(e, t) ? e[t] : void 0;
            if (0 !== n)
                if (n) o.push(n[2]);
                else {
                    var i = new Promise(((o, i) => n = e[t] = [o, i]));
                    o.push(n[2] = i);
                    var a = r.p + r.u(t),
                        s = new Error;
                    r.l(a, (o => {
                        if (r.o(e, t) && (0 !== (n = e[t]) && (e[t] = void 0), n)) {
                            var i = o && ("load" === o.type ? "missing" : o.type),
                                a = o && o.target && o.target.src;
                            s.message = "Loading chunk " + t + " failed.\n(" + i + ": " + a + ")", s.name = "ChunkLoadError", s.type = i, s.request = a, n[1](s)
                        }
                    }), "chunk-" + t, t)
                }
        };
        var t = (t, o) => {
                var n, i, [a, s, l] = o,
                    c = 0;
                if (a.some((t => 0 !== e[t]))) {
                    for (n in s) r.o(s, n) && (r.m[n] = s[n]);
                    l && l(r)
                }
                for (t && t(o); c < a.length; c++) i = a[c], r.o(e, i) && e[i] && e[i][0](), e[i] = 0
            },
            o = self.webpackChunk = self.webpackChunk || [];
        o.forEach(t.bind(null, 0)), o.push = t.bind(null, o.push.bind(o))
    })();
    var a = {};
    return (() => {
        r.r(a);
        var e = r(81510);
        window.newsletterInvitationDialog = null, window.ActivesInvitationDialog = function() {
            window.newsletterInvitationDialog && window.newsletterInvitationDialog.showDialog(!0)
        }, $((function() {
            if ($("#invitation-subscription-dialog-container").length) {
                var t = new URL(document.location.href),
                    o = window.NewsletterEventType || e.uw.Event,
                    n = "true" == t.searchParams.get("fbMarketing"),
                    i = "true" == t.searchParams.get("welcome"),
                    r = "True" === window.IsEcommerce,
                    a = t.searchParams.has("modal") ? parseInt(t.searchParams.get("modal")) : 0,
                    s = [1, 2, 3, 4, 7, 8].includes(a),
                    l = [7, 8].includes(a),
                    c = window.isAuthenticated;
                (o == e.uw.Product && r || i || s && !c) && (window.newsletterInvitationDialog = new e.tI({
                    eventType: o,
                    userIsAuthenticated: window.isAuthenticated,
                    openDialog: i || s,
                    isFbMarketing: n,
                    openDelay: l ? 4e3 : 0,
                    dialogType: s ? a : e.y8.PromoImg
                }))
            }
        }))
    })(), a
})()));