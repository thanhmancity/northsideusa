// bootstrap-rating - v1.1.1 - (c) 2015 dreyescat 
// https://github.com/dreyescat/bootstrap-rating MIT
!function (a, b) {
    "use strict";
    var c = 5;
    a.fn.rating = function (d) {
        return this.each(function () {
            var e = a(this);
            if (!e.data("rating")) {
                e.data("rating", !0);
                var f = a.extend({}, e.data(), d);
                f.start = parseInt(f.start, 10), f.start = isNaN(f.start) ? b : f.start, f.stop = parseInt(f.stop, 10), f.stop = isNaN(f.stop) ? f.start + c || b : f.stop, f.step = parseInt(f.step, 10) || b, f.fractions = Math.abs(parseInt(f.fractions, 10)) || b, f.scale = Math.abs(parseInt(f.scale, 10)) || b, f = a.extend({}, a.fn.rating.defaults, f), f.filledSelected = f.filledSelected || f.filled;
                for (var g = function (a) {
                    var b = Math.floor(a);
                    n.find(".rating-symbol-background").css("visibility", "visible").slice(0, b).css("visibility", "hidden");
                    var c = n.find(".rating-symbol-foreground");
                    c.width(0), c.slice(0, b).width("auto").find("span").attr("class", f.filled), c.eq(a % 1 ? b : b - 1).find("span").attr("class", f.filledSelected), c.eq(b).width(a % 1 * 100 + "%")
                }, h = function (a) {
                    return f.start + Math.floor(a) * f.step + f.step * j(a % 1)
                }, i = function (a) {
                    return (a - f.start) / f.step
                }, j = function (a) {
                    var b = Math.ceil(a % 1 * f.fractions) / f.fractions, c = Math.pow(10, f.scale);
                    return Math.floor(a) + Math.floor(b * c) / c
                }, k = function (a) {
                    var b = f.step > 0 ? f.start : f.stop, c = f.step > 0 ? f.stop : f.start;
                    return a >= b && c >= a
                }, l = function (a) {
                    var b = parseFloat(a);
                    k(b) && g(i(b))
                }, m = function (a) {
                    return function (b) {
                        e.prop("disabled") || e.prop("readonly") || a.call(this, b)
                    }
                }, n = a("<span></span>").insertBefore(e), o = 1; o <= i(f.stop); o++) {
                    var p = a('<div class="rating-symbol"></div>').css({display: "inline-block", position: "relative"});
                    a('<div class="rating-symbol-background ' + f.empty + '"></div>').appendTo(p), a('<div class="rating-symbol-foreground"></div>').append("<span></span>").css({
                        display: "inline-block",
                        position: "absolute",
                        overflow: "hidden",
                        left: 0,
                        width: 0
                    }).appendTo(p), n.append(p), f.extendSymbol.call(p, h(o))
                }
                l(e.val()), e.on("change", function () {
                    l(a(this).val())
                });
                var q, r = function (b) {
                    var c = a(b.currentTarget), d = (b.pageX || b.originalEvent.touches[0].pageX) - c.offset().left;
                    return d = d > 0 ? d : .1 * f.scale, c.index() + d / c.width()
                };
                n.on("mousedown touchstart", ".rating-symbol", m(function (a) {
                    e.val(h(r(a))).change()
                })).on("mousemove touchmove", ".rating-symbol", m(function (c) {
                    var d = j(r(c));
                    d !== q && (q !== b && a(this).trigger("rating.rateleave"), q = d, a(this).trigger("rating.rateenter", [h(q)])), g(d)
                })).on("mouseleave touchend", ".rating-symbol", m(function () {
                    q = b, a(this).trigger("rating.rateleave"), g(i(parseFloat(e.val())))
                }))
            }
        })
    }, a.fn.rating.defaults = {
        filled: "glyphicon glyphicon-star",
        filledSelected: b,
        empty: "glyphicon glyphicon-star-empty",
        start: 0,
        stop: c,
        step: 1,
        fractions: 1,
        scale: 3,
        extendSymbol: function () {
        }
    }, a(function () {
        a("input.rating").rating()
    })
}(jQuery);
