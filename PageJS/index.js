var IndexJS = function () {

    var _result = {};

    function dashboard() {
        $.ajax({
            type: 'POST',
            url: 'WebService/Index.asmx/Dashboard',
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

                clientList(_result.Clients);
                deceasedList(_result.Deceased);
                //intermentList(_result.Interment);
                inquiriesList(_result.Inquiries);
                eventsList(_result.Events);
            }
        });     
    }

    var initHTML = {        
            ITEM: function (details) {
             return   '<div class="recent-post-signle rct-pt-mg-wp">' +
                            '<a href="#">' +
                                '<div class="recent-post-flex">' +
                                    '<div id="' + details.ID + '" class="recent-post-it-ctn">' +
                                        '<h2>' + details.H2 + '</h2>' +
                                        '<p>' + details.P + '</p > ' +
                                    '</div>' +
                                '</div>' +
                            '</a >' +
                     '</div >'
            },
            BUTTON: function (details) {
                return '<div class="recent-post-signle">' +
                    '<a ' + (details.TARGETDLG !== "#" ? 'data-toggle="modal" data-target="' + details.TARGETDLG + '"' : 'href= "' + details.HREF + '"') + '>' +
                                '<div class="recent-post-flex rc-ps-vw">' +
                                    '<div id="' + details.ID + '" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;">' +
                                        '<p style="color:#fff!important">' + details.TXT + '</p>' +
                                    '</div>' +
                                '</div>' +
                            '</a >' +
                        '</div >'
                }        
    };

    function deceasedList(list)
    {
        if (!list.length > 0) {
            return;
        }

        var _cList = "";

        $.each(list, function (idx, val) {
            _cList += '<option value="' + val.id + " " + val.name + '" data-location="' + JSON.stringify(val.location) + '" ></option > ';
        });

        $("#searchdeceasedList").html(_cList);
    }


    function clientList(list) {
        if (!list.length > 0) {
            return;
        }

        var _html = "";
        var cnt = 0;
        var _cList = "";
        $.each(list, function (idx, val) {

            _cList += '<option value="' + val.id + " " + val.clientName + '"></option>';

            if (cnt >= 5) {
                return;
            }       

            _html += initHTML.ITEM({ H2: val.clientName + " | " + "(Died: " + val.dod + ")", P: val.location, ID: "" });               
            cnt++;
        });

        _html += initHTML.BUTTON({
            TXT: "View All",
            HREF: 'clients.aspx',
            ID: "btnClients",
            TARGETDLG: "#"
        });

        $("#client_list").html(_html);
        $("#deceasedclientList, #searchdeceasedList").html(_cList);
    } 

    function intermentList(list) {
        if (!list.length > 0) {
            return;
        }

        var _html = "";        
        var cnt = 0;

        $.each(list, function (idx, val) {
            if (cnt >= 5) {
                return;
            }       
            _html += initHTML.ITEM({
                H2: [val.area, val.blk, val.lot, val.street].join(', ') + ' | (' + val.status + ')',
                P: 'LAT: ' + val.LAT + ' | ' + ' LONG: ' + val.LONG,
                ID: "interment_" + val.id
            });
            cnt++;
        });

        _html += initHTML.BUTTON({
            TXT: "Register",
            HREF: "#",  
            ID: "btnInterment",
            TARGETDLG: "#myModalone"
        });

        $("#interment_list, #reg_intermentlist").html(_html);

        
    } 

    function inquiriesList(list) {
        if (!list.length > 0) {
            return;
        }

        var _html = "";
        var cnt = 0;

        $.each(list, function (idx, val) {

            if (cnt >= 5) {
                return;
            }       

            _html += initHTML.ITEM({ H2: val.senderName, P: val.subject, ID: val.id });
            cnt++;

        });

        _html += initHTML.BUTTON({
            TXT: "View all",
            HREF: "inquiries.aspx",
            ID: "btnInquiries",
            TARGETDLG: "#"
        });

        $("#inquiries_list").html(_html);
    } 

    function eventsList(list) {
        if (!list.length > 0) {
            return;
        }

        var _html = "";
        var cnt = 0;

        $.each(list, function (idx, val) {

            if (cnt >= 5) {
                return;
            }      

            _html += initHTML.ITEM({ H2: val.eName, P: val.eDescription, ID: val.id });
            cnt++;

        });

        _html += initHTML.BUTTON({
            TXT: "Add New",
            HREF: "events.aspx",
            ID: "btnEvents",
            TARGETDLG: "#"
        });

        $("#events_list").html(_html);
    } 

    function buttonEvents() {
        
        $("#saveInquiry").off().on('click', function () {
            if ( $("#senderName").val() == ""
                || $("#subject").val() == ""
                || $("#msg").val() == ""
                || $("#contactno").val() == ""
                || $("#email").val() == "") {

                CommonJS.notify({ title: "", msg: "Please fill-in required fields" }, "bottom", "right");
                return;
            }

            var _result = {};
            var _inquiry = {
                subject: $("#subject").val(),
                msg: $("#msg").val(),
                senderName: $("#senderName").val(),
                contactNo: $("#contactno").val(),
                email: $("#email").val(),
                sendMeMsg: $("#sendMeMsg").val() ? 1 : 0
            };

            $.ajax({
                type: 'POST',
                url: 'WebService/InquiriesSvc.asmx/SaveInquiry',
                dataType: 'json',
                data: JSON.stringify({
                    inq: _inquiry
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

        $("#signInBtn").off().on('click', function () {
            window.location.href = "login.aspx";
        });

        $("#refreshsearchbtn").off().on('click', function () {
            initMap();
            $("#searchDeceased").val("");
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
                    ////loadListHTML(_result);
                    //var marker = new google.maps.Marker({
                    //    position: { lat: parseFloat(_interment.LAT), lng: parseFloat(_interment.LONG) },
                    //    map: GoogleMap,
                    //    icon: new google.maps.MarkerImage("images/" + (_interment.status == 'occupied' ? 'tomb.png' : 'tomb_2.png'))
                    //});

                    //var infowindow = new google.maps.InfoWindow({
                    //    content: 'Latitude: ' + parseFloat(_interment.LAT) + '<br>Longitude: ' + parseFloat(_interment.LONG)
                    //});

                    //infowindow.open(GoogleMap, marker);
                    dashboard();

                }
            });
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
                    CommonJS.notify({ title: "", msg: _result.msg }, "bottom", "right");
                    $("#dname, #dInterment, #dateOfDeath, #dateOfBirth").val('');
                    dashboard();
                }
            });
        });

        function setMapOnAll(map) {
            for (var i = 0; i < GoogleMarkers.length; i++) {
                GoogleMarkers[i].setMap(map);
            }
        }


        $("#searchdeceasedbtn").off().on('click', function () {
            var _selectedDeceased = $("#searchDeceased").val();

            var _result = {};         

            $.ajax({
                type: 'POST',
                url: 'WebService/Index.asmx/GetInterments',
                dataType: 'json',
                data: JSON.stringify({
                    searchType: $("#searchType").val(),
                    searchKey: _selectedDeceased
                }),
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    _result = response.d;
                },
                error: function (error) {
                    CommonJS.notify({ title: "", msg: _result.msg }, "bottom", "right");
                },
                complete: function () {

                    if (!_result) {
                        CommonJS.notify({ title: "", msg: "No record found." }, "bottom", "right");
                        return;
                    }

                    setMapOnAll(null);


                    var _iList = ""

                    $.each(_result.Interment,
                        function (i, val) {
                            var marker = new google.maps.Marker({
                                position: { lat: val.LAT, lng: val.LONG },
                                map: GoogleMap,
                                icon: new google.maps.MarkerImage("images/" + (val.status == 'occupied' ? 'tomb.png' : 'tomb_2.png'))
                            });

                            var _details = "Area " + val.area + ", Blk " + val.blk + ", lot " + val.lot + ", " + val.street;

                            var _detailsMarker = (val.status == 'occupied' ? "<div style='white-space:pre'>" + val.name + "\nDied: " + val.dateOfDeath + "\nBorn: " + val.bday + "</div>" : "Area " + val.area + ", Blk " + val.blk + ", lot " + val.lot + ", " + val.street);

                            var infowindow = new google.maps.InfoWindow({
                                content: _detailsMarker
                            });

                            google.maps.event.addListener(marker, 'click', function () {
                                //alert("Hello World");
                                infowindow.open(GoogleMap, marker);
                            });

                            _iList += '<option value="' + val.id + " " + _details + '"></option>';
                            infowindow.open(GoogleMap, marker);
                            GoogleMarkers.push(marker);
                        });
                    $("#intermentsList").html(_iList);


                    //var marker = new google.maps.Marker({
                    //    position: { lat: _result.location.LAT, lng: _result.location.LONG },
                    //    map: GoogleMap,
                    //    icon: new google.maps.MarkerImage("images/tomb.png")
                    //});

                    //var infowindow = new google.maps.InfoWindow({
                    //    content: _result.name
                    //});

                   
                    //GoogleMarkers.push(marker);
                }
            });


        });
    }

    return {
        init: function () {
            dashboard();
            buttonEvents();
        }
    }
}();