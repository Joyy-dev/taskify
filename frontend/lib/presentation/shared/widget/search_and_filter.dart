import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/shared/controllers/search_controllers.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllers>();
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            controller: controller.searchController,
            leading: Icon(Icons.search, color: Color(0xFF565e74),),
            hintText: 'Search tasks...',
            hintStyle: WidgetStatePropertyAll(TextStyle(color: Color(0xFF777587))),
            textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.bodyMedium),
            onChanged: (value) {
              controller.updateSearch(value);
            },
            onSubmitted: (value) {
              controller.onSearch(value);
            },
            trailing: [
              IconButton(onPressed: () {}, 
                icon: Icon(Icons.cancel_outlined)
              )
            ],
          ),
        ),
      ],
    );
  }
}