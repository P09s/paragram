import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paragram/models/user.dart';
import 'package:paragram/provider/user_provider.dart';
import 'package:paragram/utils/colors.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatefulWidget {
  final snap;
  const NotificationCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Container(
        color: mobileBackgroundColor,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.snap['profImage']),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        trailing: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.snap['postUrl'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          DateFormat.yMd()
                              .add_jm()
                              .format(widget.snap['datePublished'].toDate()),
                          style: const TextStyle(
                              fontSize: 16, color: secondaryColor),
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: widget.snap['username'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: ' liked this post.',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ]));
  }
}
