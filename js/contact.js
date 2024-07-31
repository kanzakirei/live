appendScript("networkManager.js");

function onClickedContactButton() {
  const nameForm = document.getElementById("nameForm");
  const messageForm = document.getElementById("messageForm");

  if (nameForm && nameForm.value && messageForm && messageForm.value) {
    var api = "https://script.google.com/macros/s/AKfycbwyoAxPpNTmtEjGvoYi5qdz4cu8SvUfJpWAmhe-wSGQHCWK-kFSmn2UddnrUdbdo4yO/exec";
    var parameter = "?name=" + nameForm.value + "&message=" + messageForm.value;
    requestGet(api + parameter, function (data) {
      document.getElementById('formWrapper').style.display = 'none';
      document.getElementById('thxMessage').style.display = 'block';
    });
  }
}
