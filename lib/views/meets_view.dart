import 'package:flutter/material.dart';
import '../models/meet_item.dart';
import '../widgets/meet_item_card.dart';
import '../widgets/meet_dialog.dart';
import 'detail_view.dart';

class MeetsView extends StatefulWidget {
  const MeetsView({super.key});

  @override
  State<MeetsView> createState() => _MeetsViewState();
}

class _MeetsViewState extends State<MeetsView> {
  late List<MeetItem> meetItems;

  @override
  void initState() {
    super.initState();
    // Static list of meetings
    meetItems = [
      MeetItem(
        title: 'Meeting with marketing team',
        date: 'Sep 15',
        hours: '13:00 - 13:45',
        type: 'Google Meet',
        link: 'https://meet.google.com',
      ),
      MeetItem(
        title: 'Meeting with marketing team',
        date: 'Sep 16',
        hours: '12:00 - 12:45',
        type: 'Zoom',
        link: 'https://zoom.us',
      ),
      MeetItem(
        title: 'Meeting with marketing team',
        date: 'Sep 17',
        hours: '10:00 - 12:00',
        type: 'Teams',
        link: 'https://teams.microsoft.com',
      ),
      MeetItem(
        title: 'Meeting with new client',
        date: 'Sep 17',
        hours: '15:00 - 16:45',
        type: 'Google Meet',
        link: 'https://meet.google.com',
      ),
    ];
  }

  void _showMeetingDialog(MeetItem item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MeetDialog(
          item: item,
          onMarkAsDone: () {
            setState(() {
              meetItems[index].done = true;
            });
            Navigator.pop(context);
          },
          onViewDetails: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailView(meetItem: item),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly schedule'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: meetItems.length,
        itemBuilder: (context, index) {
          final item = meetItems[index];
          return MeetItemCard(
            item: item,
            onTap: () => _showMeetingDialog(item, index),
          );
        },
      ),
    );
  }
}
