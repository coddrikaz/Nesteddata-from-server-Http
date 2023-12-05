import 'package:http/http.dart' as http;
import 'package:nested_fdata/models/photo.dart';
import 'package:nested_fdata/models/post.dart';
import 'package:nested_fdata/models/users.dart';

//Class to make Network Calls
class RemoteServices {
  //setup http client to handle multiple request
  var client = http.Client();

  // Function to make Network Calls from json placeholder "post" request
  Future<List<Post>?> getPost() async {
    //setup http client
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);

    //Check for response
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    } else {      
      print('${response.statusCode}');
    }
    return null;
  }

  // Function to make Network Calls from json placeholder "photos" request
  Future<List<Photo>?> getPhotos() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(uri);


    //Check for response
    if (response.statusCode == 200) {
      var json = response.body;
      return photoFromJson(json);
    } else {}
    return null;
  }

  //Function to make Network Calls from json placeholder "photos" request
  Future<List<User>?> getUsers() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);

    //Check for response
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {}
    return null;
  }
}
