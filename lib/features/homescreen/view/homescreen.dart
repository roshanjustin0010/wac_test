import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_test/features/homescreen/controller/provider/homeScreenProvider.dart';
import 'package:wac_test/features/homescreen/view/widgets/appText.dart';
import 'package:wac_test/features/homescreen/view/widgets/bannerSlider.dart';
import 'package:wac_test/features/homescreen/view/widgets/bottomNavigationBar.dart';
import 'package:wac_test/features/homescreen/view/widgets/categorySection.dart';
import 'package:wac_test/features/homescreen/view/widgets/customImage.dart';
import 'package:wac_test/features/homescreen/view/widgets/mostPopular.dart';
import 'package:wac_test/features/homescreen/view/widgets/spacearoundfield.dart';

import '../../../constants/imageConstants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  var height;

  var width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      context.read<HomeScreenProvider>().getHomeScreenData();
    });
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        leading: Image.asset(
          ImageConstants.leadingIcon,
        ),
        title: SizedBox(
          height: 50,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        actions: const [Icon(Icons.notifications_none)],
      ),
      body: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) {
          if (provider.isLoaded == true) {
            return SafeArea(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SpaceAroundField(
                        height: 10,
                      ),
                      BannerCarouselSlider(
                        bannerSlider: provider.bannerSlider,
                      ),
                      SpaceAroundField(
                        height: 20,
                      ),
                      MostPopular(
                        productContent: provider.bestSellerProducts,
                        title: 'Most Popular',
                      ),
                      SpaceAroundField(
                        height: 20,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CustomImage(
                            width: width,
                            height: 150,
                            image: provider.adBannerUrl ?? "",
                            boxFit: BoxFit.fill,
                          )),
                      SpaceAroundField(
                        height: 20,
                      ),
                      CategorySection(
                          categories: provider.categories, title: 'Categories'),
                      SpaceAroundField(
                        height: 20,
                      ),
                      MostPopular(
                        productContent: provider.mostPopularProducts,
                        title: 'Featured Products',
                      ),
                      SpaceAroundField(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ));
          } else if (provider.isError == true) {
            return SafeArea(
                child: Center(
              child: AppText(title: 'SomeThing Went Wrong'),
            ));
          } else {
            return const SafeArea(
                child: Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            ));
          }
        },
      ),
    );
  }
}
