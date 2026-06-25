import 'package:flutter/material.dart';
import 'package:taskify/shared/widgets/custom_container.dart';

class AuthOption extends StatelessWidget {
  const AuthOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomContainer(
                height: 65,
                child: TextButton(
                  onPressed: () {}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_mobiledata),
                      Text('Google')
                    ],
                  )
                )
              ),
            ),
            const SizedBox(width: 15,),
            Expanded(
              child: CustomContainer(
                height: 65,
                child: TextButton(
                  onPressed: () {}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple),
                      Text('Apple')
                    ],
                  )
                )
              ),
            )
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),                
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              'Or Continue With Email'.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),                
              ),
            )
          ],
        )
      ],
    );
  }
}