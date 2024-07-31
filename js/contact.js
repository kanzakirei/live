function OnClickedContactButton() {
  const nameForm = document.getElementById("nameForm");
  const messageForm = document.getElementById("messageForm");

  if (nameForm && nameForm.value && messageForm && messageForm.value) {
    var api = "https://script.google.com/macros/s/AKfycbwyoAxPpNTmtEjGvoYi5qdz4cu8SvUfJpWAmhe-wSGQHCWK-kFSmn2UddnrUdbdo4yO/exec";
    var json = JSON.stringify({ name: nameForm.value, message: messageForm.value });

    requestPost(api, json, function (data) {
      document.getElementById('formWrapper').style.display = 'none';
      document.getElementById('thxMessage').style.display = 'block';
    });
  }
}
