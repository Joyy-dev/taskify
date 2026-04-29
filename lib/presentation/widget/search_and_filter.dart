import 'package:flutter/material.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            leading: Icon(Icons.search, color: Color(0xFF565e74),),
            hintText: 'Search tasks...',
          ),
        ),
        const SizedBox(width: 10,),
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          minRadius: 8,
          child: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.filter_list_rounded, color: Color(0xFF131e8c),)
          ),
        )
      ],
    );
  }
}