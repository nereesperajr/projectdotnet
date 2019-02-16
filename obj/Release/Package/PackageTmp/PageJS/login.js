var Login = function () {

    function ButtonEvents() {
        $("#loginBtn").off().on('click', function () {

            var _userName = $("#uname").val();
            var _password = $("#upass").val();
            var _result = {};

            $.ajax({
                type: 'POST',
                url: 'WebService/Login.asmx/CheckUsers',
                data:  JSON.stringify({
                    uname: _userName,
                    upass: _password
                }),
                dataType: 'json',
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
                        msg: _result.isSuccess ? "Successfully login" : "invalid account",
                        cb: function () {
                            if (_result.isSuccess) {
                                window.location.href = "index.aspx";
                            }                           
                        }
                    }, "bottom", "right");                   
                }
            });
        });
    }


    return {

        init: function (config) {
            //
            ButtonEvents();
        }
    }


}();