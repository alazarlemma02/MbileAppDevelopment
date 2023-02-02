import 'package:bits_intro/data.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          child: Row(children: [
            Image.network(profiles[0]['profileImage']),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(profiles[0]['name']),
                  const SizedBox(height: 8),
                  Text(profiles[0]['userName'])
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share))
          ]),
        ),
      ],
    );
  }
}
