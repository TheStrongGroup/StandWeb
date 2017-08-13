var Kind = (function () {

    function _kind() {

        var kindNameList = [];

        this.getClassList = function () {
            return kindNameList;
        }

        this.add = function (url, params) {
            $.getJSON(url, params, function (data) {
                if (data.errorCode == 0) {
                    alert(data.errorMessage);
                } else {
                    alert("添加分类成功！");
                    showTable(data.classlist);
                }
                $("#KindAdd").val("");
            });
        };
        this.getData = function (url, params, type) {
            getByAjax(url, params, type);
        };

        function getByAjax(url, params, type) {
            $.getJSON(url, params, function (data) {
                showTable(data.classlist);
            });
        }

        function delte(url, params) {
            $.getJSON(url, params, function (data) {
                if (!data.hasOwnProperty('errorCode')) {
                    showTable(data.classlist);
                } else {
                    alert(data.errorMsg);
                }

            });
        }

        function update(url, params) {
            $.getJSON(url, params, function (data) {

                alert("修改成功！");
                showTable(data.classlist);
                $("#KindAdd").val("");
            });
        }

        function showTable(data) {
            $(".adddev-bottom").html("<table></table>");
            $(".adddev-bottom>table").width($(".adddev-bottom").width());

            var columns = [
                {field: 'classId', title: '分类编号'}, {field: 'className', title: '分类名称'},
                {field: 'operation', title: '操作'}
            ];
            kindNameList = [];
            var tableData = [];
            $.each(data, function (index, val) {
                var row = {};
                row.classId = val.classId;
                row.className = val.className;
                row.operation = '<button type="button" value="' + val.className+","+val.classId+ '"  class="btn btn-warning" ' +
                    'data-target="#updateClass" data-toggle="modal" >更新</button>' +
                    '<button type="button" value="' + val.classId + '" class="btn btn-danger">删除</button>';
                kindNameList.push(val.className);
                tableData.push(row);
            });

            generateTable($(".adddev-bottom>table"), columns, tableData);

            $(".btn-danger").click(function () {
                var classId = $(this).attr('value');
                delte("rest/class/operator", "classId=" + classId + "&type=3");
            });

            $(".btn-warning").click(function () {
                var classNameAndId = $(this).attr('value');
                $("#classId").val(classNameAndId.split(",")[1])
                $("#className").val(classNameAndId.split(",")[0])
            });

        }
        $("#confirm").click(function () {
            var $className = encodeURI(encodeURI($("#newClassName").val().trim()));
            var $classId =$("#classId").val().trim();
            update("rest/class/operator", "classId=" + $classId + "&className=" + $className + "&type=2");
            $("#updateClass").modal("hide")
        });

        function generateTable($table, columns, data) {

            $table.bootstrapTable({
                striped: true,
                classes: 'table table-bordered',
                columns: columns,
                data: data
            });

        }
    };

    return _kind;

})();
jQuery(document).ready(function ($) {

    $("#setting").addClass('start active');
    $("#add_device").addClass('active');

    var kind = new Kind();
    kind.getData("rest/class/operator", "type=0");

    $("#AddBtn").click(function () {
        var $className = $("#KindAdd").val();

        $className = encodeURI(encodeURI($className.trim()));
        if ($className == "") {
            alert("分类名称不允许为空，请输入！");
            return;
        }

        if ($.inArray($className, kind.getClassList()) > 0) {
            alert("不允许添加重复的分类名称！");
            return;
        }

        kind.add("rest/class/operator", "className=" + $className + "&type=1");
    });


});