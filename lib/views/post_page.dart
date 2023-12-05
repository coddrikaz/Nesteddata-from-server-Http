import 'package:flutter/material.dart';

import 'package:nested_fdata/constants/constants.dart';
import 'package:nested_fdata/models/post.dart';
import 'package:nested_fdata/services/remote_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

//
class _PostPageState extends State<PostPage> {
  //List to store post data
  List<Post>? post;
  //boolean to trigger if loaded
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  //function to get Data from API
  getData() async {
    post = await RemoteServices().getPost();
    if (post != null) {
      setState(() {
        //print("post: $post");
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: post?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
              child: Container(
                decoration: Constant.postPageContainer,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12.0,
                    ),
                    CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Colors.grey,
                      child: Text(
                        post![index].id.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post![index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Constant.postPageTitle,
                          ),
                          Text(post![index].body, style: Constant.postPageBody)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        replacement: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Loading Posts from API'),
              SizedBox(height: 10.0),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
