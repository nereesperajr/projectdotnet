var InquiriesJS = function () {

    function getInquiries(grid) {

        var _result = {};

        $.ajax({
            type: 'POST',
            url: 'WebService/InquiriesSvc.asmx/Inquiries',
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

            $("#data-table-basic").find('thead').html("<tr><th>Sender Name</th><th>Subject</th><th>Contact No.</th><th>Email</th><th>Message</th><th>Sent Date</th><th></th></tr >");

            if (list.Inquiries.length > 0) {

                var _html = "";
                var _iList = "";


                $.each(list.Inquiries, function (i, val) {
                    _html += " <tr>" +
                        " <td><a id='clientID_'" + val.id + "'>" + val.senderName + "</span></td> " +
                        " <td><span>" + val.subject + "</span></td> " +
                        " <td><span>" + val.contactno + "</span></td> " +
                        " <td><span>" + val.email + "</span></td> " +
                        " <td><span>" + val.msg + "</span></td> " +
                        " <td><span>" + val.sendDate + "</span></td> " +
                        " <td><button id='inqID_" + val.id + "_delete' type='button' class='btn btn-default btn-sm delete' style='border-color:white;padding:0px;'> " +
                        "<span class='glyphicon glyphicon-minus' ></span ></button > " +
                        " </tr >";
                    _iList += '<option value="' + val.id + " - " + val.senderName + " - " + val.contactno + '"></option>';
                });
            }

            $("#inquirierNameList").html(_iList);
            $("#data-table-basic").find('tbody').html(_html);

            $.getScript("js/data-table/jquery.dataTables.min.js")
                .done(function (script, textStatus) {
                    $.getScript("js/data-table/data-table-act.js");
                });         

            $(".delete").off().on('click', function () {

                var line_id = $(this).attr("id").split('_')[1];

                $.ajax({
                    type: 'POST',
                    url: 'WebService/InquiriesSvc.asmx/DeleteInquiry',
                    dataType: 'json',
                    data: JSON.stringify({
                        inqID: line_id
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

        $("#sendMsgBtn").off().on('click', function () {
            if ($("#senderName").val() == ""
                || $("#iName").val() == ""               
                || $("#msg").val() == "") {

                CommonJS.notify({ title: "", msg: "Please fill-in required fields" }, "bottom", "right");
                return;
            }

            var _result = {};     
            $.ajax({
                type: 'POST',
                url: 'WebService/InquiriesSvc.asmx/SendMessage',
                dataType: 'json',
                data: JSON.stringify({
                    name: $("#iName").val(),
                    msg: $("#msg").val(),
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
            getInquiries();
            buttonEvents();
        }
    }

}();