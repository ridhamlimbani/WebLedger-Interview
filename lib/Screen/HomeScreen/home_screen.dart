import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webledger_interview/Const/app_color.dart';
import 'package:webledger_interview/Const/app_string.dart';
import 'package:webledger_interview/Model/recipes_model.dart';
import 'package:webledger_interview/Screen/HomeScreen/home_screen_controller.dart';
import 'package:webledger_interview/Widget/common_rating_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenController homeScreenController =  Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      drawer: drawer(context: context),
      body: FutureBuilder(
          future: homeScreenController.fetchRecipesDetails(),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text("No data found"));
            } else{
              RecipesModel recipesModel = snapshot.data!;
              return ListView.builder(
                itemCount: recipesModel.recipes?.length ?? 0,
                itemBuilder: (context,index){
                  return recipesWidget(
                      index: index,
                      recipesModel: recipesModel
                  );
                },
              );
            }
          },
      ),
    );
  }

  Widget recipesWidget({required int index, required RecipesModel recipesModel}){
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.black
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  '${recipesModel.recipes?[index].name.toString() ?? '-'} ${recipesModel.recipes?[index].name.toString() ?? '-'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColor.primaryColor
                  ),
                ),
                CommonRatingBar(
                  rating: double.parse(recipesModel.recipes?[index].rating.toString() ?? '5.0'),
                )
              ],
            ),
          ),
          SizedBox(width: 20,),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        recipesModel.recipes?[index].image ?? ''
                    )
                )
            ),
          )
        ],
      ),
    );
  }

  Drawer drawer({required BuildContext context}){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      image.value,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${firstName.value} ${lastName.value}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
              homeScreenController.showLogoutDialog(context: context);
            },
          ),
        ],
      ),
    );
  }
}
