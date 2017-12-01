function doAction(element) {
    alert(element.id);
    console.log(element.tagName)
    if (element.isEqual('respond!')) {
        alert('hello!22!!');
        document.getElementById(element).onclick = function () {
            location.href = "www.google.ru";
        }
    }
}
        // alert('hello!');
        // document.getElementById("myButton").onclick = function () {
        // location.href = "www.yoursite.com";

