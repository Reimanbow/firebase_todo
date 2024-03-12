import "package:flutter/material.dart";

class TodoDescriptionPage extends StatelessWidget {
  const TodoDescriptionPage({
    super.key,
    required this.title,
    required this.description,
    required this.isDone,
  });

  final String title;
  final String description;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isDone
                ? const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Not Done",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
