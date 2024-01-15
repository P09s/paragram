import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paragram/screens/stories/story_1.dart';
import 'package:paragram/screens/storypage.dart';
import 'package:paragram/screens/widgets/post_card.dart';
import 'package:paragram/utils/colors.dart';
import 'package:paragram/utils/story_boxes.dart';

class PostCollectionScreen extends StatefulWidget {
  const PostCollectionScreen({super.key});

  @override
  State<PostCollectionScreen> createState() => _PostCollectionScreen();
}

class _PostCollectionScreen extends State<PostCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: mobileBackgroundColor,
            centerTitle: false,
            title: Text('Posts')),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) => PostCard(
                        snap: snapshot.data!.docs[index].data(),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
