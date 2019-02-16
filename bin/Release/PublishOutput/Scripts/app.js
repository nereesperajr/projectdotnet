$(function () {
    $('#btnCallService').click(function () {
        $.ajax({
            type: 'POST',
            url: 'WebService/Login.asmx/CheckUsers',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
            //    $('#lblData').html(JSON.stringify(response));

                console.log(JSON.stringify(response));

            },
            error: function (error) {
                console.log(error);
            }
        });
    });
});