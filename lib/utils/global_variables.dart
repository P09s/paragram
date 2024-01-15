import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paragram/screens/add_post_screen.dart';
import 'package:paragram/screens/feed_screen.dart';
import 'package:paragram/screens/notification_screen.dart';
import 'package:paragram/screens/profile_screen.dart';
import 'package:paragram/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  NotificationScreen(),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
