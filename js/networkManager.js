function requestGet(_endPoint, _onSuccessed = null, _onErrored = null) {
  fetch(_endPoint)
    .then(response => {
      return response.json();
    })
    .then(data => {
      if (_onSuccessed != null) _onSuccessed(data);
    })
    .catch(error => {
      if (_onErrored != null) _onErrored(error);
    });
}

function requestPost(_endPoint, _json, _onSuccessed = null, _onErrored = null) {
  const headers = new Headers();
  headers.append('Content-Type', 'application/json');
  const request = new Request(_endPoint, {
    method: 'POST',
    headers: headers,
    body: _json
  });
  fetch(request)
    .then(response => {
      return response.json();
    })
    .then(data => {
      if (_onSuccessed != null) _onSuccessed(data);
    })
    .catch(error => {
      if (_onErrored != null) _onErrored(error);
    });
}