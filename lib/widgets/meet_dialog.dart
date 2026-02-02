import 'package:flutter/material.dart';
import '../models/meet_item.dart';

class MeetDialog extends StatelessWidget {
  final MeetItem item;
  final VoidCallback onMarkAsDone;
  final VoidCallback onViewDetails;

  const MeetDialog({
    super.key,
    required this.item,
    required this.onMarkAsDone,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text('Date: ${item.date}'),
            Text('Time: ${item.hours}'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onMarkAsDone,
                  child: const Text('Mark as done'),
                ),
                ElevatedButton(
                  onPressed: onViewDetails,
                  child: const Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
