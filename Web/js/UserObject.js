// Model
function User(name, imageUrl)  {
	this.name = name;
	this.imageUrl = imageUrl;

	this.getName = function() {
		return this.name;
	}

	this.getImage = function() {
		return this.imageUrl;
	}
}
