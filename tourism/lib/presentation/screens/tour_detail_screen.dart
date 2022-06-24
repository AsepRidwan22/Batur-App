// import 'package:capstone_design/login.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TourDetailScreen extends StatefulWidget {
  const TourDetailScreen({Key? key}) : super(key: key);

  @override
  State<TourDetailScreen> createState() => _TourDetailScreenState();
}

class _TourDetailScreenState extends State<TourDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width - 40;
    return BlocBuilder<ThemeManagerBloc, ThemeManagerState>(
        builder: (context, state) {
      Brightness screenBrightness = MediaQuery.platformBrightnessOf(context);
      bool isLight = (state.isDark == ThemeModeEnum.darkTheme)
          ? false
          : (state.isDark == ThemeModeEnum.lightTheme)
              ? true
              : (screenBrightness == Brightness.light)
                  ? true
                  : false;
      Color colorOne = (state.isDark == ThemeModeEnum.darkTheme)
          ? bDarkGrey
          : (state.isDark == ThemeModeEnum.lightTheme)
              ? bPrimary
              : (screenBrightness == Brightness.light)
                  ? bPrimary
                  : bDarkGrey;
      Color colorTwo = (state.isDark == ThemeModeEnum.darkTheme)
          ? bGrey
          : (state.isDark == ThemeModeEnum.lightTheme)
              ? bPrimaryVariant1
              : (screenBrightness == Brightness.light)
                  ? bPrimaryVariant1
                  : bGrey;
      Color colorThree = (state.isDark == ThemeModeEnum.darkTheme)
          ? bGrey
          : (state.isDark == ThemeModeEnum.lightTheme)
              ? bSecondaryVariant1
              : (screenBrightness == Brightness.light)
                  ? bSecondaryVariant1
                  : bGrey;
      Color colorFour = (state.isDark == ThemeModeEnum.darkTheme)
          ? bDarkGrey
          : (state.isDark == ThemeModeEnum.lightTheme)
              ? bSecondary
              : (screenBrightness == Brightness.light)
                  ? bSecondary
                  : bDarkGrey;
      return Scaffold(
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                const CustomAppBar(
                    title: "Tour Detail Screen", hamburgerMenu: false),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      CustomCardDetailTourScreen(
                        img:
                            'https://majalahpeluang.com/wp-content/uploads/2021/03/584ukm-bandung-ayobandung.jpg',
                        title: 'Contrary to popular belief',
                        rating: '4,5',
                        isFavourited: false,
                        description:
                            'Stasiun Bandung, juga dikenal sebagai Stasiun Hall, adalah stasiun kereta api kelas besar tipe A yang terletak di Jalan Stasiun Timur dan Jalan Kebon Kawung, di Kebonjeruk, Andir, tepatnya di perbatasan antara Kelurahan Pasirkaliki, Cicendo dan Kebonjeruk, Andir, Kota Bandung, Jawa Barat.',
                        address: 'Jl. Trunojoyo No. 64 Bandung',
                        telephone: '(022) 4208757',
                        onTap: () {
                          print("Container clicked");
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (state.isDark == ThemeModeEnum.darkTheme)
                                ? bDarkGrey
                                : (state.isDark == ThemeModeEnum.lightTheme)
                                    ? bTextPrimary
                                    : (screenBrightness == Brightness.light)
                                        ? bTextPrimary
                                        : bDarkGrey,
                            boxShadow: [
                              BoxShadow(
                                color: bStroke,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jadwal',
                              style: bHeading7.copyWith(
                                color: (isLight) ? bPrimary : bTextPrimary,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Senin',
                                  style: bSubtitle3.copyWith(
                                    color: (isLight) ? bPrimary : bTextPrimary,
                                  ),
                                ),
                                Text(
                                  '07.00 - 16.00',
                                  style: bSubtitle3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Selasa',
                                  style: bSubtitle3.copyWith(
                                    color: (isLight) ? bPrimary : bTextPrimary,
                                  ),
                                ),
                                Text(
                                  '07.00 - 16.00',
                                  style: bSubtitle3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rabu',
                                  style: bSubtitle3.copyWith(
                                    color: (isLight) ? bPrimary : bTextPrimary,
                                  ),
                                ),
                                Text(
                                  '07.00 - 16.00',
                                  style: bSubtitle3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'kamis',
                                  style: bSubtitle3.copyWith(
                                    color: (isLight) ? bPrimary : bTextPrimary,
                                  ),
                                ),
                                Text(
                                  '07.00 - 16.00',
                                  style: bSubtitle3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jumat',
                                  style: bSubtitle3.copyWith(
                                    color: (isLight) ? bPrimary : bTextPrimary,
                                  ),
                                ),
                                Text(
                                  '07.00 - 16.00',
                                  style: bSubtitle3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sabtu',
                                  style: bSubtitle3.copyWith(
                                    color: (isLight) ? bPrimary : bTextPrimary,
                                  ),
                                ),
                                Text(
                                  '07.00 - 16.00',
                                  style: bSubtitle3,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 15, left: 20, right: 20),
                        child: CustomTextIconButton(
                          icon: "assets/icon/map-marker.svg",
                          color: colorTwo,
                          width: width,
                          text: "Petunjuk Arah",
                          onTap: () {
                            // Navigator.pop(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const Login(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextIconButton(
                          icon: "assets/icon/coupon.svg",
                          color: colorFour,
                          width: width,
                          text: "Dapatkan Tiket",
                          onTap: () {
                            // Navigator.pop(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const Login(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
