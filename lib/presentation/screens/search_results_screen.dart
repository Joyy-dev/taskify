import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:taskify/presentation/controllers/search_controllers.dart';
import 'package:taskify/presentation/widget/project_search_result.dart';
import 'package:taskify/presentation/widget/task_search_results.dart';
import 'package:taskify/presentation/widget/team_search_results.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllers>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        actions: [
          Icon(Icons.format_list_bulleted_sharp)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => SearchBar(
              leading: Icon(Icons.search),
              hintText: controller.searchQuery.value,
              hintStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.bodyMedium),
              trailing: [
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.cancel_outlined)
                )
              ],
            )
            ),
            const SizedBox(height: 15,),
            Text(
              'Showing ${controller.searchedQueryCount} matches for your query'
            ),
            const SizedBox(height: 20,),
            TaskSearchResults(),
            ProjectSearchResult(),
            const SizedBox(height: 20,),
            TeamSearchResults()
          ],
        ),
      ),
    );
  }
}