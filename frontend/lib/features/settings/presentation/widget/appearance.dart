import 'package:flutter/material.dart';
import 'package:taskify/shared/widgets/custom_container.dart';
import 'package:taskify/shared/widgets/special_container.dart';

class Appearance extends StatelessWidget {
  const Appearance({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.color_lens_outlined),
              const SizedBox(width: 5,),
              Text(
                'Appearance',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: SpecialContainer(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        color: Color(0xFF131b2e),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        'Dark',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  )
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: SpecialContainer(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        color: Color(0xFFfcf8ff),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        'Light',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  )
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: SpecialContainer(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF131b2e),
                              Color(0xFFfcf8ff)
                            ]
                          )
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        'System',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  )
                ),
              )
            ],
          )
        ],
      )
    );
  }
}