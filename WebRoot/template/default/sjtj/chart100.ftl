<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>数据统计</title>
    <meta http-equiv="refresh" content="5">
    <script src="${BASE_ASSETS_PATH}libs/jquery-2.1.4.min.js"></script>
</head>
<body>
<iframe id="iframe1" onload="changeFrameHeight_1()"   scrolling="no" frameborder="0" src="${BASE_PATH}/sjtj/chart21.action"/>
<iframe  id="iframe2" src="${BASE_PATH}/sjtj/chart31.action" />
<iframe  id="iframe3" src="${BASE_PATH}/sjtj/chart51.action"/>
<iframe  id="iframe4" src="${BASE_PATH}/sjtj/chart61.action"/>
<script type="text/javascript">
    function changeFrameHeight_1() {
        var ifm = document.getElementById("#iframe1");
        ifm.height = document.documentElement.clientHeight/2;
    }
    window.onresize = function () {
        changeFrameHeight_1();
        alert(1)
    }
</script>
</body>
</html>