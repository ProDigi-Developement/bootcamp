/* fetch controller */
const baseUrl = 'https://randomuser.me/api/?results=';

function getUsers(success, fail, numberOfUsers) {
	console.log('getUser called.');

	var myHeaders = new Headers();
	myHeaders.append("Accept", "application/json");

	var myInit = { method: 'GET',
				   headers: myHeaders,
				   mode: 'cors',
				   cache: 'default' };

	var url = baseUrl + numberOfUsers;

	var myRequest = new Request(url, myInit);

	fetch(myRequest)      //this myRequest has url with
	  .then(function (response) {     //to check the status of response variable
		if (response.status == 200) {      //if its 200 means this url is authorized to fetch data from it & 401 for unauthorized
			var contentType = response.headers.get("content-type");       //value of content-type is Get here

			if (contentType && contentType.indexOf("application/json") !== -1) {
				response.json().then(function(json) {   //response.json() converts response variables into json variables
					var userArray = new Array();

					var user = null;
					for (index = 0; json.results.length > index; index++) {
						user = new User(json.results[index].name.first, json.results[index].picture.thumbnail);
						userArray[index] = user;
					}

					success(userArray);
				});
			} else {
				console.log("Oops, we haven't got JSON!");
				fail("Content is not JSON.");
			}
		} else {
			fail("Status is not 200.");
		}
	  })
	  .catch(function(error) {
		fail("Fetch not worked. More Info: " + error);
	  });
}
