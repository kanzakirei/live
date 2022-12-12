function loadJson() {
	let req = new XMLHttpRequest();
	req.open("get", "json/updateHistoryList.json", true);
	req.send();
	req.onload = function () {
		let jsonText = JSON.parse(req.responseText);
		createMemberList(jsonText);
	}
}

function createMemberList(_jsonText) {
	const MAX_UPDATE_HISTORY_DRAW = 5;
	const MAX_UPDATE_HISTORY_VIEW = 10;
	let target = document.getElementById("updateHistoryList");
	let div = document.createElement("div");
	div.classList.add("article");
	target.appendChild(div);
	let view = createView(div, "更新履歴");
	_jsonText.forEach((data, index) => {
		if (index == MAX_UPDATE_HISTORY_DRAW) {
			view = createDetails(view, "");
		}
		if (index < MAX_UPDATE_HISTORY_VIEW) {
			createPanel(view, data.msg, data.date);
		}
	});
}

function createView(_parent, _title) {
	let h2 = document.createElement("h2");
	h2.classList.add("article-title");
	h2.textContent = _title;
	_parent.appendChild(h2);
	let div = document.createElement("ul");
	div.classList.add("article-list");
	_parent.appendChild(div);
	return div;
}

function createDetails(_parent, _title) {
	let details = document.createElement("details");
	_parent.appendChild(details);
	let summary = document.createElement("summary");
	summary.innerHTML = _title;
	details.appendChild(summary);
	return details;
}

function createPanel(_parent, _msg, _date) {
	let li = document.createElement("li");
	_parent.appendChild(li);

	let label = document.createElement("span");
	label.classList.add("label");
	if (_msg.indexOf("追加") >= 0) {
		label.classList.add("label_red");
		label.innerHTML = "追加";
	} else {
		label.classList.add("label_black");
		label.innerHTML = "更新";
	}
	li.appendChild(label);

	let msgLabel = document.createElement("span");
	msgLabel.innerHTML = _msg;
	li.appendChild(msgLabel);

	let dateLabel = document.createElement("span");
	dateLabel.classList.add("article-list-date");
	dateLabel.innerHTML = _date;
	li.appendChild(dateLabel);
}

loadJson();