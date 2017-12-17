function jsAdRespondAdd(element) {
    // alert(element.id);
    // console.log(element.id);
    // if (element.id =='respondAd') {

    // alert('hello!22!!');
    // location.href = "/BulletinBoard";
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "MakeAdRespond", true);
    // xhttp.open('GET', 'MakeAdRespond', false);
    // xhttp.send();
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("AdId=" + element.id);
    // xhttp.send("fname=Henry&lname=Ford");
    // alert(element.id);
    // element.disabled;
    // }
}

function jsShowResponds(element) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "RespondsList", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("AdId=" + element.id);
    xhttp.onreadystatechange = function () { // (3)
        if (xhttp.readyState != 4) return;

        if (xhttp.status != 200) {
            alert(xhttp.status + ': ' + xhttp.statusText);
        } else {
            alert(xhttp.responseText);
            var respTxt = xhttp.responseText.split(", ");

            var respTable ;
            for (i = 0; i < respTxt.length; i += 5) {
                respTable = "<tr>"
                    + "<td>" + respTxt[i] + "<td>"
                    + "<td>" + respTxt[i + 1] + "<td>"
                    + "<td>" + respTxt[i + 2] + "<td>"
                    + "<td>" + respTxt[i + 3] + "<td>"
                    + "<td>" + respTxt[i + 4] + "<td>"
                    + "</tr>";
            }
            respTable = "<table>"
                +"<tr>"
                + "<th>username</th>"
                + "<th>user_id</th>"
                + "<th>battle_count</th>"
                + "<th>win_rate</th>"
                + "<th>own_rate</th>"
                + "</tr>"
                + respTable
                + "</table>";
            console.log(respTable);
        }
    }
    // alert("status"+xhttp.status);
    // alert("Text_LOG:"+xhttp.responseText);
    // alert("readyState"+xhttp.readyState);
}

$(function () {
    $('.real-show-hint').on("click", function (e) {
        e = e || window.event;
        e.preventDefault();
        var ypos = $(this).offset().top + 24;
        var xpos = $(this).offset().left;
        var RealHint = $(this).data('hint');
        $(RealHint).css('top', ypos);
        $(RealHint).css('left', xpos);
        $(RealHint).toggle('fast');
        return;
    });

    $('.prm-cross').on('click', function () {
        $(this).parent().hide('fast');
        return false;
    });

    document.onclick = function (e) {
        if ($(e.target).hasClass('real-hint') == false)
            $('.real-hint').hide('fast');
        return;
    }
});
