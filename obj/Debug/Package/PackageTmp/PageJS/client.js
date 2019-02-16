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
                loadIntermentList();
            }
        });

        function loadIntermentList() {
            var _result = {};

            $.ajax({
                type: 'POST',
                url: 'WebService/IntermentSvc.asmx/IntermentList',
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

                    var _iList = "";
                    $.each(_result.Interments, function (i, val) {
                        if (val.status == 'occupied') {
                            return;
                        }

                        var _details = "Area " + val.area + ", Blk " + val.blk + ", lot " + val.lot + ", " + val.street;
                        _iList += '<option value="' + val.id + " " + _details + '"></option>';
                    });

                    $("#intermentsList").html(_iList);
                }
            });
        }

        function loadListHTML(list) {

            $("#data-table-basic").find('thead').html("<tr><th>Name</th><th>Date of Birth</th><th>Interment</th><th>Date of Death</th><th>Date Added</th><th></th></tr >");

            if (list.Clients.length > 0) {
                var _html = "";

                $.each(list.Clients, function (i, val) {
                    _html += " <tr style='vertical-align:middle;'>" +
                        " <td><span>" + val.clientname + "</span ></td > " +
                        " <td><span>" + val.bday + "</span></td> " +
                        " <td><span>" + val.interment + "</span></td> " +
                        " <td><span>" + val.dateOfDeath + "</span></td> " +
                        " <td><span>" + val.regDate + "</span></td> " +
                        " <td><button id='clientID_" + val.id + "_delete' type='button' class='btn btn-default btn-sm delete' style='border-color:white;padding:0px;'> " +
                        "<span class='glyphicon glyphicon-minus' ></span ></button > " +
                        "</td > " +
                        " </tr >";


                });
            }
            
            $("#data-table-basic").find('tbody').html(_html);     

            $.getScript("js/data-table/jquery.dataTables.min.js")
                .done(function (script, textStatus) {
                    $.getScript("js/data-table/data-table-act.js");
                });


            $(".delete").off().on('click', function () {

                var line_id = $(this).attr("id").split('_')[1];

                $.ajax({
                    type: 'POST',
                    url: 'WebService/Client.asmx/DeleteClient',
                    dataType: 'json',
                    data: JSON.stringify({
                        cID: line_id
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
                        location.reload();
                    }
                });


                //$(this).parent().parent().find('td').each(function () {
                //    // do your cool stuff
                //    if ($(this).find('button').length > 0) {
                //        return;
                //    }

                //    var spanTxt = $(this).find('span'); 
                //    $(spanTxt).replaceWith("<input value='" + $(spanTxt).text() + "' />");
                    
                //});     
            });

        }
    }

    function buttonEvents() {

        $("#newDeceased").off().on('click', function () {           
        });


        $("#saveNewDeceased").off().on('click', function () {

            if ($("#dname").val() === "" || $("#dInterment").val() === "" || $("#dateOfBirth").val() === "" || $("#dateOfDeath").val() === "") {
                CommonJS.notify({ title: "", msg: "Please fill-in all fields" }, "bottom", "right");
                return;
            }

            var _result = {};

            $.ajax({
                type: 'POST',
                url: 'WebService/Index.asmx/SaveDeceased',
                dataType: 'json',
                data: JSON.stringify({
                    name: $("#dname").val(),
                    dateOfBirth: $("#dateOfBirth").val(),
                    location: $("#dInterment").val(),
                    dateOfDeath: $("#dateOfDeath").val()
                }),
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    _result = response.d;
                },
                error: function (error) {
                    console.log(error);
                },
                complete: function () {
                    $("#dname, #dInterment, #dateOfDeath, #dateOfBirth").val('');
                    alert(_result.msg);                    
                    location.reload();
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