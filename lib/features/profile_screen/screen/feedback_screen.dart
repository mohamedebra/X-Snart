import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text_field.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feedback")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "We value your feedback!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Please share your thoughts and suggestions with us."),
            const SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //     labelText: "Your Name",
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            CustomTextField(hintText: 'Your Name',borderRadius: 5,),
            const SizedBox(height: 10),
            CustomTextField(hintText: 'Your Feedback',borderRadius: 5,maxLines: 5,),
            const SizedBox(height: 20),
            CustomButton(
              radius: 5,
              width: MediaQuery.of(context).size.width / 2,
              buttonText: 'Submit',onPressed: (){
              // Get.back();

            },),

          ],
        ),
      ),
    );
  }
}
