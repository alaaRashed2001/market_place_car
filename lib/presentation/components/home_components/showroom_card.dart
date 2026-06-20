import 'package:flutter/material.dart';
class Showroom {
  const Showroom({required this.imageUrl, required this.name, required this.rating});

  final String imageUrl;
  final String name;
  final double rating;
}
class ShowroomCard extends StatelessWidget {
  const ShowroomCard({super.key, required this.showroom});

  final Showroom showroom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              showroom.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.store_mall_directory_outlined, color: Colors.black26, size: 32),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                showroom.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            ),
            const Icon(Icons.ios_share_rounded, size: 18, color: Colors.black54),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: const Color(0xFFFBE9D0), borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(showroom.rating.toString(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              const SizedBox(width: 4),
              const Icon(Icons.star_rounded, size: 14, color: Color(0xFFE7A93C)),
            ],
          ),
        ),
      ],
    );
  }
}
