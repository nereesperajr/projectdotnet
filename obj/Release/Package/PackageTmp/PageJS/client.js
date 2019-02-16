var ClientJS = function () {

    function loadList(grid) {
        $.ajax({
            type: 'POST',
            url: 'WebService/Client.asmx/ClientList',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
                _result = response.d;
            },
            error: function (error) {
                console.log(error);
            },
            complete: function () {
                if (!_result.isSuccess) {
                    CommonJS.notify({
                        title: "",
                        msg: _result.message,
                    }, "bottom", "right");                  

                }

                loadListHTML(_result);

            }
        });

        function loadListHTML(list) {

            $("#data-table-basic").find('thead').html("<tr><th>Name</th><th>Cell No.</th><th>Birthday</th><th>Address</th><th>Registered date</th><th></th></tr >");

            if (list.Clients.length > 0) {
                var _html = "";

                $.each(list.Clients, function (i, val) {
                    _html += " <tr style='vertical-align:middle;'>" +
                        " <td><span>" + val.clientName + "</span></td> " +
                        " <td><span>" + val.cellNo + "</span></td> " +
                        " <td><span>" + val.bday + "</span></td> " +
                        " <td><span>" + val.address + "</span></td> " +
                        " <td><span>" + val.regDate + "</span></td> " +
                        " <td><button id='clientID_'" + val.id + "' type='button' class='btn btn-default btn-sm' style='border-color:white;padding:0px;'> " +
                                "<span class='glyphicon glyphicon-edit' ></span ></button ></td > " +
                        " </tr >";
                });
            }
            
            $("#data-table-basic").find('tbody').html(_html);     

            $.getScript("js/data-table/jquery.dataTables.min.js")
                .done(function (script, textStatus) {
                    $.getScript("js/data-table/data-table-act.js");
                });
        }
    }

    function buttonEvents() {

        $("#saveClient").off().on('click', function () {

            if ($("#clientName").val() === ""
                || $("#cellNo").val() === ""
                || $("#bday").val() === ""
                || $("#address").val() === ""
                || $("#regDate").val() === "") {

                CommonJS.notify({ title: "", msg: "Please fill-in all fields." }, "bottom", "right");
                return;
            }

            var _result = {};

            $.ajax({
                type: 'POST',
                url: 'WebService/Client.asmx/SaveClient',
                dataType: 'json',
                data: JSON.stringify({
                    cl: {
                        clientName: $("#clientName").val(),
                        cellNo: $("#cellNo").val(),
                        bday: $("#bday").val(),
                        address: $("#address").val(),
                        regDate: $("#regDate").val()
                    }
                }),
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    _result = response.d;
                },
                error: function (error) {
                    console.log(error);
                },
                complete: function () {
                    CommonJS.notify({ title: "", msg: _result.msg, }, "top", "center");

                    $("#clientName, #cellNo, #bday, #address, #regDate").val("");
                    //loadListHTML(_result);

                }
            });


        });
    }

    function init() {
        //$("#bday").datetimepicker();
    }

    return {
        init: function () {
            init();
            loadList();
            buttonEvents();
        }
    }

}();