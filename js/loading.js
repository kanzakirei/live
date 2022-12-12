function getJsonFromFile(_path, _onCompleted) {
  let req = new XMLHttpRequest();
  req.open("get", _path, true);
  req.send();
  req.onload = function () {
    let json = JSON.parse(req.responseText);
    _onCompleted(json);
    loadingCompleted();
  }
}

function getJsonFromAPI(_path, _onCompleted) {
  let req = new XMLHttpRequest();
  req.open("get", _path, true);
  req.send();
  req.onreadystatechange = function () {
    if (req.readyState == 4 && req.status == 200) {
      let json = JSON.parse(req.responseText);
      _onCompleted(json);
      loadingCompleted();
    }
  }
}

function loadingCompleted() {
  document.getElementById("loading").classList.toggle("fadeOut");
}
