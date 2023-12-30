// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/components/stringstyle.dart';
import 'package:universal_html/html.dart' as html;
import 'package:login/components/home_model.dart';
import 'components/color.dart';
import 'components/stringfollowus.dart';



class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // color: Colors.green,
        // height: 400,
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Blog",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              axisDirection: AxisDirection.down,
              children: [
                ...List.generate(blogData.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 12,
                      right: 5,
                      bottom: 5,
                    ),
                    child: Material(
                      elevation: 10,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                                bottom: 0,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(blogData[index]["img"]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                            ),
                            ListTile(
                              title: SizedBox(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    blogData[index]["name"],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: Text(
                                blogData[index]["desc"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),

            // Add promotion
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Promotions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              axisDirection: AxisDirection.down,
              children: [
                ...List.generate(promotionData.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 12,
                      right: 5,
                      bottom: 5,
                    ),
                    child: Material(
                      elevation: 10,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                                bottom: 0,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(promotionData[index]["img"]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                            ),
                            ListTile(
                              title: SizedBox(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    promotionData[index]["name"],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),

            // Follow us
            Followus(),
            SocialMediaIcons(),
          ],
        ),
      ),
    );
  }
}


class Followus extends StatelessWidget {
  const Followus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 70),
        FittedBox(
          child: Text(
            AppStrings.follow,
            style: AppStyles.s32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.contactMsg,
          style: AppStyles.s18.copyWith(
    color: Color.fromARGB(255, 9, 66, 113), // Set the desired text color here
  ),
  softWrap: true,
),
        const SizedBox(height: 8),
      ],
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SocialMediaIconBtn(
          icon: FontAwesomeIcons.facebook,
          link: "https://www.facebook.com/petsbacker/",
          ),
          SocialMediaIconBtn(
          icon: FontAwesomeIcons.globe,
          link: "https://www.petbacker.com/s/pet-sitters/bangkok--thailand",
        ),
      ],
    );
  }
}


class SocialMediaIconBtn extends StatelessWidget {
  const SocialMediaIconBtn({super.key, required this.icon, this.link});
  final icon;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: () {
        if (link != null) {
          html.window.open(link!, '_blank');
        }
      },
      child: Icon(
        icon,
        color: AppColors.primaryColor,
        size: 32,
      ),
    );
  }
}
