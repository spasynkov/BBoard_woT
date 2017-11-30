function doAction(ElemId) {
    alert('hello!');
    if (ElemId.isEqual('respond!')) {
        alert('hello!22!!');
        document.getElementById(ElemId).onclick = function () {
            location.href = "www.google.ru";
        }
        // alert('hello!');
        // document.getElementById("myButton").onclick = function () {
        // location.href = "www.yoursite.com";
    }
}
