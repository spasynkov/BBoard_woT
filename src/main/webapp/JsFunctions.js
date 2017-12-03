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

// alert('hello!');
// document.getElementById("myButton").onclick = function () {
// location.href = "www.yoursite.com";

