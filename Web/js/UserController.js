// Controller
var fetchUserSucessful;
var fetchUserFailed;
var userList = new Array();

// Fetch Users
function fetchSuccessCallback(data) {
	if (data) {
		Array.prototype.push.apply(userList, data);

		console.log("CONTROLLER: Print all users fetched.");
		for (i = 0; i < userList.length; i++) {
			console.log("User: " + userList[i].getName());
		}

		this.fetchUserSucessful(userList);
	} else {
		console.log("CONTROLLER: error: Data is null / Invalid.");
	}
}

function fetchFailCallback(errorMessage) {
	console.log("CONTROLLER: ERROR. More info: " + errorMessage);
	this.fetchUserFailed(errorMessage);
}

function fetchUsers(fetchUserSucessful, fetchUserFailed) {
	this.fetchUserSucessful = fetchUserSucessful;
	this.fetchUserFailed = fetchUserFailed;

	// getUsers(fetchSuccessCallback, fetchFailCallback, 10);
	getUsersAjax(fetchSuccessCallback, fetchFailCallback, 10);
}
