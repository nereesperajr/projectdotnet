var EventsJS = function () {

    function getEvents(grid) {
        $.ajax({
            type: 'POST',
            url: 'WebService/Events.asmx/EventList',
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

            $("#data-table-basic").find('thead').html("<tr><th>Event Name</th><th>Description</th><th>Event Date</th><th>Venue</th><th>Remarks</th><th></th></tr >");

            if (list.Events.length > 0) {

                var _html = "";

                $.each(list.Events, function (i, val) {
                    _html += " <tr>" +
                        " <td><a id='clientID_'" + val.id + "'>" + val.eName + "</span></td> " +
                        " <td><span>" + val.eDescription + "</span></td> " +
                        " <td><span>" + val.eDate + "</span></td> " +
                        " <td><span>" + val.eVenue + "</span></td> " +
                        " <td><span>" + val.eRemarks + "</span></td> " +
                        " <td><button id='evsID_" + val.id + "_delete' type='button' class='btn btn-default btn-sm delete' style='border-color:white;padding:0px;'> " +
                        "<span class='glyphicon glyphicon-minus' ></span ></button > " +
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
                    url: 'WebService/Events.asmx/DeleteEvent',
                    dataType: 'json',
                    data: JSON.stringify({
                        eID: line_id
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
                        //var tbl = $("#data-table-basic").DataTable();
                        //tbl.ajax.reload();
                        //$('#data-table-basic').DataTable().ajax.reload();
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

        $("#saveEvent").off().on('click', function () {
            if ($("#eName").val() == ""
                || $("#eDescription").val() == ""
                || $("#eVenue").val() == ""
                || $("#eDate").val() == ""
                || $("#email").val() == "") {

                CommonJS.notify({ title: "", msg: "Please fill-in required fields" }, "bottom", "right");
                return;
            }

            var _result = {};
            var _evs = {
                eName: $("#eName").val(),
                eDescription: $("#eDescription").val(),
                eVenue: $("#eVenue").val(),
                eDate: $("#eDate").val(),
                eRemarks: $("#eRemarks").val()
            };

            $.ajax({
                type: 'POST',
                url: 'WebService/Events.asmx/SaveEvents',
                dataType: 'json',
                data: JSON.stringify({
                    evs: _evs,
                    uname: $("#smsusername").val(),
                    password: $("#smspassword").val()
                }),
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    _result = response.d;
                },
                error: function (error) {
                    console.log(error);
                },
                complete: function () {
                    CommonJS.notify({
                        title: "",
                        msg: _result.msg,
                    }, "bottom", "right");  
                }
            });



        });

    }
    

    return {
        init: function () {
            getEvents();
            buttonEvents(); 
        }
    }

}();