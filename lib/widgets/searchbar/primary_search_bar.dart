import 'package:flutter/material.dart';

class PrimarySearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  final Iterable<Widget>? trailing;
  const PrimarySearchBar(
      {super.key, required this.onChanged, this.hintText, this.trailing});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(Icons.search),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
        const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      ),
      trailing: trailing,
      hintText: hintText ?? "Search Products",
      elevation: MaterialStateProperty.all<double>(2),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onChanged: onChanged,
    );
  }
}
