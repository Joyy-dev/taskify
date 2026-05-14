import 'package:flutter/material.dart';

class FocusContainer extends StatelessWidget {
  const FocusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceTint,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Focus'.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 10,),
          Text(
            'Refine Product\nStrategy',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 10,),
          Text(
            'Synthesize Q3 feedback into actionable roadmap items for the engineering sprint.',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 50,),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child: Text(
                    'Start Now',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000767),
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      )
                    )
                  ),
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}