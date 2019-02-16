var CrematoryJS = function () {

    function loadList(grid) {
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

                loadListHTML(_result);

            }
        });

        function loadListHTML(list) {

            //$("#data-table-basic").find('thead').html("<tr><th>Area</th><th>Block</th><th>Lot</th><th>Street</th><th>LATITUDE</th><th>LONGITUDE</th><th>Status</th><th></th></tr >");
            $("#data-table-basic").find('thead').html("<tr><th>Name</th><th>Date of Birth</th><th>Location</th><th>Date of Death</th><th>Date Added</th><th></th></tr >");

            if (list.Interments.length > 0) {
                var _html = "";
                var _html2 = "";

                //$.each(list.Interments, function (i, val) {
                //    _html += " <tr style='vertical-align:middle;'>" +
                //        " <td><span id='cName_" + val.id + "'>" + val.area + "</span ></td > " +
                //        " <td><span id='cCell_" + val.id + "'>" + val.blk + "</span></td> " +
                //        " <td><span>" + val.lot + "</span></td> " +
                //        " <td><span>" + val.street + "</span></td> " +
                //        " <td><span>" + val.LAT + "</span></td> " +
                //        " <td><span>" + val.LONG + "</span></td> " +
                //        " <td><span>" + val.status + "</span></td> " +
                //        " <td><button id='interID_" + val.id + "_delete' type='button' class='btn btn-default btn-sm delete' style='border-color:white;padding:0px;'> " +
                //        "<span class='glyphicon glyphicon-minus' ></span ></button > " +
                //        "</td > " +
                //        " </tr >";


                //});

                $.each(list.Cremates, function (i, val) {
                    _html2 += " <tr style='vertical-align:middle;'>" +
                        " <td><span>" + val.cName + "</span ></td > " +
                        " <td><span>" + val.dob + "</span></td> " +
                        " <td><span>" + val.location + "</span></td> " +
                        " <td><span>" + val.dod + "</span></td> " +
                        " <td><span>" + val.dateAdded + "</span></td> " +
                        " <td><button id='cremates_" + val.id + "_delete' type='button' class='btn btn-default btn-sm delete' style='border-color:white;padding:0px;'> " +
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

                var _selected = $(this).attr("id").split('_');

                if (_selected[0] === "cremate") {
                    deleteCremate(_selected[1]);
                }
                else {
                    deleteInterment(_selected[1]);
                }


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

        function deleteInterment(id) {
            $.ajax({
                type: 'POST',
                url: 'WebService/IntermentSvc.asmx/DeleteInterment',
                dataType: 'json',
                data: JSON.stringify({
                    cID: id
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
        }

        function deleteCremate(id) {
            $.ajax({
                type: 'POST',
                url: 'WebService/IntermentSvc.asmx/DeleteCremate',
                dataType: 'json',
                data: JSON.stringify({
                    cID: id
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
        }
    }

    function saveCremate(id) {
        $.ajax({
            type: 'POST',
            url: 'WebService/IntermentSvc.asmx/SaveCremate',
            dataType: 'json',
            data: JSON.stringify({
                name: $("#cname").val(),
                location: $("#clocation").val(),
                dateOfDeath: $("#cdateOfDeath").val(),
                dateOfBirth: $("#cdateOfBirth").val()
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

        $("#saveNewCremate").off().on('click', function () {
            if ($("#area").val() == ""
                || $("#cname").val() == ""
                || $("#clocation").val() == ""
                || $("#cdateOfDeath").val() == ""
                || $("#cdateOfBirth").val() == "") {

                CommonJS.notify({ title: "", msg: "Please fill-in required fields" }, "bottom", "right");
                return;
            }

            saveCremate();
        });

        $("#saveInterment").off().on('click', function () {

            if ($("#area").val() == ""
                || $("#blk").val() == ""
                || $("#blk").val() == ""
                || $("#lot").val() == ""
                || $("#street").val() == ""
                || $("#LAT").val() == ""
                || $("#LAT").val() == ""
                || $("#LONG").val() == "") {

                CommonJS.notify({ title: "", msg: "Please fill-in required fields" }, "bottom", "right");
                return;
            }

            var _result = {};
            var _interment = {
                area: $("#area").val(),
                blk: $("#blk").val(),
                lot: $("#lot").val(),
                street: $("#street").val(),
                LAT: $("#LAT").val(),
                LONG: $("#LONG").val(),
                status: $("#status").val()
            };

            $.ajax({
                type: 'POST',
                url: 'WebService/IntermentSvc.asmx/SaveInterment',
                dataType: 'json',
                data: JSON.stringify({
                    interment: _interment
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
                    //loadListHTML(_result);
                    var marker = new google.maps.Marker({
                        position: { lat: parseFloat(_interment.LAT), lng: parseFloat(_interment.LONG) },
                        map: GoogleMap,
                        icon: new google.maps.MarkerImage("images/" + (_interment.status == 'occupied' ? 'tomb.png' : 'tomb_2.png'))
                    });

                    var infowindow = new google.maps.InfoWindow({
                        content: 'Latitude: ' + parseFloat(_interment.LAT) + '<br>Longitude: ' + parseFloat(_interment.LONG)
                    });

                    infowindow.open(GoogleMap, marker);

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