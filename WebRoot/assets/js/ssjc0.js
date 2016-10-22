/*ssjc0，3D
 * 于磊，2015.8.2
 */
$(document).ready(function () {

    $(".ctitle").hover(
            function () {
                var cengClass = $(".ceng-" + $(this).attr('idn'));
                $(cengClass).css('background', 'yellow');
            },
            function () {
                var cengClass = $(".ceng-" + $(this).attr('idn'));
                $(cengClass).css('background', 'wheat');
            });
    $(".htitle").hover(
            function () {
                var h = $(this).attr('idn');
                var pointClass = $(".hang li[h=" + h + "]");
                $(pointClass).addClass('ceng-Class-select');
            },
            function () {
                var h = $(this).attr('idn');
                var pointClass = $(".hang li[h=" + h + "]");
                $(pointClass).removeClass('ceng-Class-select');
            });
    $(".ltitle").hover(
            function () {
                var L = $(this).attr('idn');
                var pointClass = $(".hang li[l=" + L + "]");
                $(pointClass).addClass('ceng-Class-select');
            },
            function () {
                var L = $(this).attr('idn');
                var pointClass = $(".hang li[l=" + L + "]");
                $(pointClass).removeClass('ceng-Class-select');
            });
    //变换显示数据
    $('#WSS-Select').change(function () {
        $('.point-3d').each(function () {
            if ($('#WSS-Select').children('option:selected').val() === 'wd') {
                $(this).html($(this).attr('wd'));
            } else if ($('#WSS-Select').children('option:selected').val() === 'sd') {
                $(this).html($(this).attr('sd'));
            } else if ($('#WSS-Select').children('option:selected').val() === 'sf') {
                $(this).html($(this).attr('sf'));
            }
        });
        $('.ctitle').each(function () {
            if ($('#WSS-Select').children('option:selected').val() === 'wd') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=2", "ytType=1");
                var Url2 = Url1.replace("ytType=3", "ytType=1");
                $(this).attr("data-url", Url2);
            } else if ($('#WSS-Select').children('option:selected').val() === 'sd') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=1", "ytType=2");
                var Url2 = Url1.replace("ytType=3", "ytType=2");
                $(this).attr("data-url", Url2);
            } else if ($('#WSS-Select').children('option:selected').val() === 'sf') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=1", "ytType=1");
                var Url2 = Url1.replace("ytType=2", "ytType=1");
                $(this).attr("data-url", Url2);
            }
        });
        $('.htitle').each(function () {
            if ($('#WSS-Select').children('option:selected').val() === 'wd') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=2", "ytType=1");
                var Url2 = Url1.replace("ytType=3", "ytType=1");
                $(this).attr("data-url", Url2);
            } else if ($('#WSS-Select').children('option:selected').val() === 'sd') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=1", "ytType=2");
                var Url2 = Url1.replace("ytType=3", "ytType=2");
                $(this).attr("data-url", Url2);
            } else if ($('#WSS-Select').children('option:selected').val() === 'sf') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=1", "ytType=1");
                var Url2 = Url1.replace("ytType=2", "ytType=1");
                $(this).attr("data-url", Url2);
            }
        });
        $('.ltitle').each(function () {
            if ($('#WSS-Select').children('option:selected').val() === 'wd') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=2", "ytType=1");
                var Url2 = Url1.replace("ytType=3", "ytType=1");
                $(this).attr("data-url", Url2);
            } else if ($('#WSS-Select').children('option:selected').val() === 'sd') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=1", "ytType=2");
                var Url2 = Url1.replace("ytType=3", "ytType=2");
                $(this).attr("data-url", Url2);
            } else if ($('#WSS-Select').children('option:selected').val() === 'sf') {
                var Url = $(this).attr("data-url");
                var Url1 = Url.replace("ytType=1", "ytType=1");
                var Url2 = Url1.replace("ytType=2", "ytType=1");
                $(this).attr("data-url", Url2);
            }
        });
    });
});
