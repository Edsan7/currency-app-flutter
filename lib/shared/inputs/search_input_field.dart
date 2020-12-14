import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController textEditingController;

  const SearchInputField({
    Key key,
    this.onChanged,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: TextFormField(
        controller: textEditingController,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          labelText: 'Search a currency',
        ),
      ),
    );
  }
}
