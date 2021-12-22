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
      height: AppBar().preferredSize.height * 0.8,
      child: TextField(
        controller: _searchController,
        autofocus: false,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Clique para pesquisar...",
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Tooltip(
            message: "Limpar busca",
            child: IconButton(
              icon: Icon(Icons.clear),
              onPressed: _onClearSearchPressed,
            ),
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  void _onClearSearchPressed() {
    _searchController.clear();
    onChanged("");
  }
}
