import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required TextEditingController searchController,
    required this.onChanged,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final Function(String query) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height * 0.75,
      child: TextField(
        controller: _searchController,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
