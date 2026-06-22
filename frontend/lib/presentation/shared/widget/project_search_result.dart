import 'package:flutter/material.dart';
import 'package:taskify/presentation/shared/widget/custom_container.dart';

class ProjectSearchResult extends StatelessWidget {
  const ProjectSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.folder_shared_rounded),
                const SizedBox(width: 5,),
                Text(
                  'Projects',
                  style: Theme.of(context).textTheme.headlineLarge,          
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(
                '1 Results'.toUpperCase()
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        CustomContainer(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Qa Initiatives'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFffb783),
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(
                  'Q4 Roadmap Presentation',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                trailing: CircleAvatar(
                  child: Icon(Icons.train_outlined, size: 30,),
                ),
              ),
              const SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress'
                      ),
                      Text(
                        '75%',
                        style: TextStyle(
                          color: Color(0xFFffb783),
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  LinearProgressIndicator(
                    value: 0.75,
                    valueColor: AlwaysStoppedAnimation(Color(0xFFffb783)),
                    backgroundColor: Color(0xFF0b1326),
                  ),
                ],
              )
            ],
          )
        )
      ],
    );
  }
}