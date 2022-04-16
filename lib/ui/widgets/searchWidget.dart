import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String hintText;
  const SearchWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 20,
              color: Theme.of(context).hintColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(widget.hintText,
                style: TextStyle(color: Theme.of(context).hintColor))
          ],
        ));
  }
}
