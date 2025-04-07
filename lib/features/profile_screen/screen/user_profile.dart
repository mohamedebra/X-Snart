import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile_controller.dart';
import '../../../core/constants/styles.dart';
import '../../../core/widget/custom_app_bar.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});
  final UserProfileController controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,)),

        title: Text('User Profile',style: robotoMedium.copyWith(color: Colors.white,fontSize: 20),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 30, color: Colors.grey),
                  ),
                  title: Text('Avatar'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  onTap: () {},
                ),
                Obx(() => ListTile(
                  title: Text('Nickname'),
                  subtitle: Text(
                    controller.nickname.value,
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  onTap: () => _showTextInputDialog('Enter Nickname', controller.nickname),
                )),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildListItem('Sex', controller.sex),
                _buildListItem('Age', controller.age),
                _buildListItem('Height', controller.height),
                _buildListItem('Weight', controller.weight),
                _buildListItem('Target step', controller.targetStep),
                _buildListItem('Weight unit', controller.weightUnit),
                _buildListItem('Height unit', controller.heightUnit),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, RxString value) {
    return Obx(() => ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value.value,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
      onTap: () => _showTextInputDialog('Enter $title', value),
    ));
  }

  void _showTextInputDialog(String title, RxString value) {
    TextEditingController textController = TextEditingController(text: value.value);
    Get.defaultDialog(
      title: title,
      content: TextField(
        controller: textController,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          value.value = textController.text;
          Get.back();
        },
        child: Text('Save'),
      ),
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }
}
