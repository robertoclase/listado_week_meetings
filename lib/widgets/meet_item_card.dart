import 'package:flutter/material.dart';
import '../models/meet_item.dart';

class MeetItemCard extends StatelessWidget {
  final MeetItem item;
  final VoidCallback onTap;

  const MeetItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: item.done ? Colors.grey[300] : Colors.white,
        child: ListTile(
          onTap: onTap,
          leading: _buildDateContainer(),
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: item.done ? Colors.grey : Colors.black,
              decoration: item.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    item.hours,
                    style: TextStyle(
                      color: item.done ? Colors.grey : Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: _getMeetingIcon(),
        ),
      ),
    );
  }

  Widget _buildDateContainer() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.date.split(' ')[1],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item.date.split(' ')[0],
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getMeetingIcon() {
    IconData iconData;
    switch (item.type) {
      case 'Google Meet':
        iconData = Icons.videocam;
        break;
      case 'Zoom':
        iconData = Icons.video_call;
        break;
      case 'Teams':
        iconData = Icons.people;
        break;
      default:
        iconData = Icons.event;
    }
    return Icon(iconData, color: Colors.deepPurple);
  }
}
