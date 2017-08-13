var Device = (function () {

    function _device() {

        this.load = function (url, params, type) {
            getByAjax(url, params, type);
        };

        this.add = function (url, params) {
            $.getJSON(url, params, function (data) {
                if (data.errorCode == 0) {
                    alert(data.errorMessage);
                } else {
                    alert("新增成功！");
                }
                showTable(data.classdata);
            });
        }

        function getByAjax(url, params, type) {
            $.getJSON(url, params, function (data) {

                if (type == 0) {
                    showSelect(data.classlist.classlist);
                    showTable(data.classdata);
                }
            });
        }

        function showSelect(data) {
            Stand.selectAppender(data, $("#Select"), "className", "classId");
        }

        function showTable(data) {
            $("#mainTable").html("<table></table>");
            //$("#report>table").height($(".report-h").height()-36);
            $("#mainTable>table").width($("#mainTable").width());
            var column = [
                {field: 'devId', title: '通讯表号'}, {field: 'devName', title: '设备名称'},
                {field: 'commId', title: '通讯地址'}, {field: 'price', title: '能源单价'},
                {field: 'className', title: '分类分项'}
            ];
            var tableData = [];
            $.each(data, function (key, val) {

                var row = {};
                row.devId = val.devId;
                row.devName = val.devName;
                row.commId = val.devAddr;
                row.price = val.devPrice;
                row.className = val.devClass;

                tableData.push(row);
            });
            generateTable($("#mainTable>table"), column, tableData);
        }


        function generateTable($table, columns, data) {

            $table.bootstrapTable({
                striped: true,
                classes: 'table table-bordered',
                columns: columns,
                data: data
            });

        }

    };

    return _device;

})();
jQuery(document).ready(function ($) {
    $("#setting").addClass('start active');
    $("#add_classfi").addClass('active');
    var device = new Device();

    device.load("rest/device/add", "type", 0);

    $("#Add").click(function (event) {
        var devName = encodeURI(encodeURI($("#devName").val()));
        var devAddr = $("#devAddr").val();
        var devPrice = $("#devPrice").val();
        var classId = $("#Select").val();
        var devDesc = encodeURI(encodeURI($("#remark").val()));

        if (devName == null || devName == "") {
            alert("仪表名称不能为空！");
            return;
        }

        if (devAddr == null || devAddr == "") {
            alert("通讯表号不能为空");
            return;
        }

        if (devPrice == null || devAddr == "") {
            alert("能源单价不能为空！");
            return;
        }

        if (classId == undefined || classId == "") {
            alert("请选择分类分项！");
            return;
        }

        if (!/^[0-9]*$/.test(devAddr)) {
            alert("通讯表号请输入数字!");
        }
        if (!/^[0-9]*$/.test(devPrice.replace(".", ""))) {
            alert("请输入正确的单价！");
        }

        device.add("rest/device/add", "devName=" + devName + "&devId=" + devAddr
            + "&devPrice=" + devPrice + "&devClass=" + classId + "&devDesc=" + devDesc + "&type=1");

    });

    $("#Reset").click(function () {

        $("#devName").val("");
        $("#devAddr").val("");
        $("#devPrice").val("");
        $("#remark").val("");
    });
});