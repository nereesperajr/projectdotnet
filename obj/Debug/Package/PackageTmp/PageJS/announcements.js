var AnnouncementsJS = function () {

    function getAnnouncement(grid) {
        $.ajax({
            type: 'POST',
            url: 'WebService/AnnouncementSvc.asmx/Announcements',
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

            $("#data-table-basic").find('thead').html("<tr><th>ID</th><th>Subject</th><th>Message</th></tr >");

            if (list.Announcement.length > 0) {

                var _html = "";

                $.each(list.Announcement, function (i, val) {
                    _html += " <tr>" +
                        " <td><a id='annsID_'" + val.id + "'>" + val.id + "</span></td> " +
                        " <td><span>" + val.subject + "</span></td> " +
                        " <td><span>" + val.msg + "</span></td> " +
                        " <td><button id='annsID_" + val.id + "_delete' type='button' class='btn btn-default btn-sm delete' style='border-color:white;padding:0px;'> " +
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
                    url: 'WebService/AnnouncementSvc.asmx/DeleteAnnouncement',
                    dataType: 'json',
                    data: JSON.stringify({
                        annID: line_id
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
        $("#sendAnnsBtn").off().on('click', function () {
            if ($("#msg").val() == ""
                || $("#subject").val() == "")
            {

                CommonJS.notify({ title: "", msg: "Please fill-in required fields" }, "bottom", "right");
                return;
            }

            var _result = {};
         
            $.ajax({
                type: 'POST',
                url: 'WebService/AnnouncementSvc.asmx/SaveAnnouncement',
                dataType: 'json',
                data: JSON.stringify({
                    anns: {
                        subject: $("#subject").val(),
                        msg: $("#msg").val(),
                        uname: $("#smsusername").val(),
                        password: $("#smspassword").val()
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
            getAnnouncement();
            buttonEvents();
        }
    }

}();