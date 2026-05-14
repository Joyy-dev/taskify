import 'package:flutter/material.dart';
import 'package:taskify/core/enums/category.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) { 
    final container = Category.values; 
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: container.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final title = container[index];
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              border: Border(
                  left: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                    width: 5
                  )
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.work, color: Theme.of(context).colorScheme.onSurface,),
                  const SizedBox(height: 20,),
                  Text(
                    title.label,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '12 Active Tasks',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            );
          },
        ),
    );
    
    // Row(
    //   children: [
        
    //     const SizedBox(width: 20,),
    //     Expanded(
    //       child: Container(
    //         padding: EdgeInsets.all(10.0),
    //         decoration: BoxDecoration(
    //           color: Theme.of(context).colorScheme.onTertiary,
    //           border: Border(
    //             left: BorderSide(
    //               color: Theme.of(context).colorScheme.onSurface,
    //               width: 5
    //             )
    //           ),
    //           borderRadius: BorderRadius.circular(12)
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Icon(Icons.person, color: Theme.of(context).colorScheme.onSurface,),
    //             const SizedBox(height: 20,),
    //             Text(
    //               'Personal',
    //               style: Theme.of(context).textTheme.headlineSmall,
    //             ),
    //             Text(
    //               '5 Active Tasks',
    //               style: Theme.of(context).textTheme.bodySmall,
    //             )
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}