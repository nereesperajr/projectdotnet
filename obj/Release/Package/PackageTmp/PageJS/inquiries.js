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

            $("#data-table-basic").find('thead').html("<tr><th>Sender Name</th><th>Subject</th><th>Contact No.</th><th>Email</th><th>Message</th><th>Sent Date</th></tr >");

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
                    msg: $("#msg").val()
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