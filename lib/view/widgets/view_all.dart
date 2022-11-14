import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  String title, subtitle;
  Function onPressed;

  ViewAll(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }
}
