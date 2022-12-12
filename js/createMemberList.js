function createMemberList(_jsonText) {
	let target = document.getElementById("memberList");
	_jsonText.forEach(data => {
		let parallax = document.createElement("div");
		parallax.classList.add("parallax");
		target.appendChild(parallax);

		let name = document.createElement("h2");
		name.style.textAlign = "center";
		name.textContent = data.name;
		parallax.appendChild(name);

		let content = document.createElement("div");
		content.classList.add("parallax_content");
		parallax.appendChild(content);
		let p = document.createElement("p");
		p.style.textAlign = "left";
		p.innerText = data.message;
		content.appendChild(p);
		if (data.twitch) {
			let twitch = document.createElement("a");
			twitch.classList.add("linkButton");
			twitch.href = "https://www.twitch.tv/" + data.twitch;
			twitch.innerText = "Twitch";
			content.appendChild(twitch);
		}
		if (data.twitter) {
			let twitter = document.createElement("a");
			twitter.classList.add("linkButton");
			twitter.href = "https://twitter.com/" + data.twitter;
			twitter.innerText = "Twitter";
			content.appendChild(twitter);
		}

		let img = document.createElement("img");
		let filename = data.filename ? data.filename : "no_image";
		img.src = "img/member/" + filename + ".png";
		//img.src = "https://drive.google.com/uc?export=view&id=" + _data.ImageID + "&usp=sharing";
		parallax.appendChild(img);
	});
}
