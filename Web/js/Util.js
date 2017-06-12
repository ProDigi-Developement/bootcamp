
function displayName(value) {
	var newDiv = document.createElement('div');
	var node = document.createTextNode(value);
	node.value = value;
	newDiv.appendChild(node);

	document.getElementById("baseDiv").appendChild(node);
}

function displayImg(imgSrc) {
	var newDiv = document.createElement('div');
	var img = document.createElement('img');
	img.setAttribute("src", imgSrc);
	img.setAttribute("width", 110);
	img.setAttribute("height", 110);
	newDiv.appendChild(img);

    document.getElementById("baseDiv").appendChild(img);
}
