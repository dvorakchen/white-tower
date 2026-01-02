import 'package:flutter/material.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  const SubjectCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CachedNetworkImage(
          imageUrl: subject.iconLink,
          width: 50,
          height: 50,
          errorWidget: (context, url, error) =>
              const Icon(Icons.error, size: 50),
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Text(
                subject.title,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                subject.subtitle,
                style: const TextStyle(fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
