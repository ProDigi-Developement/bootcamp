/* fetch controller */
const baseUrl = 'https://randomuser.me/api/?results=';

var script = document.createElement('script');
script.src = 'http://code.jquery.com/jquery-1.11.0.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

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
						let name = json.results[index].name.first
						let imagePath = json.results[index].picture.thumbnail
						user = new User(name, imagePath);
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

function getUsersAjax(success, fail, numberOfUsers) {
	var url = baseUrl + numberOfUsers;
	$.ajax({
		type: "GET",
 		url: url,
		dataType: "json"
    })
	.success(function(data) {
		// var json = JSON.parse(data);
	    console.log( "API AJAX requet success" );
		console.log(data);

		var userArray = new Array();

		var user = null;
		for (index = 0; data.results.length > index; index++) {
			// console.log(item);
			// console.log(data.results[item].name.first);
			// console.log(data.results[item].picture.thumbnail);
			user = new User(data.results[index].name.first, data.results[index].picture.thumbnail);
			userArray[index] = user;
		}

		success(userArray);
	  })
  	.fail(function(error) {
    	console.log( "API: error" );
		fail(error);
  	})
	.always(function() {
	    console.log( "API: request complete" );
	});
}
