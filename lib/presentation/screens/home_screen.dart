import 'package:capstone_design/presentation/components/card/custom_card_transmetro.dart';
import 'package:capstone_design/presentation/components/card/custom_card_wisata.dart';
import 'package:capstone_design/presentation/components/card/custom_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      return Scaffold(
          body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      (isLight)
                          ? 'assets/splashscreen/logo.png'
                          : 'assets/splashscreen/logo_dark.png',
                      width: 128,
                    ),
                    SvgPicture.asset(
                      'assets/icon/bell-Bold.svg',
                      color: (isLight) ? bPrimary : bTextPrimary,
                      height: 25,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                                viewportFraction: 0.9,
                                aspectRatio: 350 / 180,
                                autoPlay: true),
                            items: ['assets/splashscreen/image1.webp'].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(i));
                                },
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: screenSize.width - 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/icon/news.png',
                                  width: 90,
                                ),
                                Image.asset(
                                  'assets/icon/umkm.png',
                                  width: 90,
                                ),
                                Image.asset(
                                  'assets/icon/wisata.png',
                                  width: 90,
                                ),
                                Image.asset(
                                  'assets/icon/transport.png',
                                  width: 90,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Berita',
                                  style: bHeading7.copyWith(
                                      color:
                                          (isLight) ? bPrimary : bTextPrimary),
                                ),
                                Text(
                                  'Show all',
                                  style: bBody1,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomNewsCard(
                            img:
                                'https://static.remove.bg/remove-bg-web/669d7b10b2296142983fac5a5243789bd1838d00/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png',
                            title:
                                "Prabowo Atau Anies, Siapa Capres yang Paling Kuat?",
                            writer: "Udin Saparudin",
                            date: "Jumat, 13 Mei 2022",
                            onTap: () {
                              print("Container clicked");
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomNewsCard(
                            img:
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            title:
                                "Prabowo Atau Anies, Siapa Capres yang Paling Kuat?",
                            writer: "Udin Saparudin",
                            date: "Jumat, 13 Mei 2022",
                            onTap: () {
                              print("Container clicked");
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomNewsCard(
                            img:
                                'https://static.remove.bg/remove-bg-web/669d7b10b2296142983fac5a5243789bd1838d00/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png',
                            title:
                                "Prabowo Atau Anies, Siapa Capres yang Paling Kuat?",
                            writer: "Udin Saparudin",
                            date: "Jumat, 13 Mei 2022",
                            onTap: () {
                              print("Container clicked");
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomNewsCard(
                            img:
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            title:
                                "Prabowo Atau Anies, Siapa Capres yang Paling Kuat?",
                            writer: "Udin Saparudin",
                            date: "Jumat, 13 Mei 2022",
                            onTap: () {
                              print("Container clicked");
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Wisata',
                                  style: bHeading7.copyWith(
                                      color:
                                          (isLight) ? bPrimary : bTextPrimary),
                                ),
                                Text(
                                  'Show all',
                                  style: bBody1,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 257,
                            // width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'UMKM',
                                  style: bHeading7.copyWith(
                                      color:
                                          (isLight) ? bPrimary : bTextPrimary),
                                ),
                                Text(
                                  'Show all',
                                  style: bBody1,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 257,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                CardWisata(
                                  img:
                                      "https://akcdn.detik.net.id/visual/2020/03/12/2049bba1-49a2-4efb-a253-82825d9c1f2d_169.jpeg?w=650",
                                  rating: "4.5",
                                  title: "Gedung Sate",
                                  timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                                  isFavourited: false,
                                  description:
                                      "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                                  onTap: () {
                                    print("Container clicked");
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Transport',
                                  style: bHeading7.copyWith(
                                      color:
                                          (isLight) ? bPrimary : bTextPrimary),
                                ),
                                Text(
                                  'Show all',
                                  style: bBody1,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: width,
                            child: TabBar(
                              indicator: BoxDecoration(
                                  color: (isLight) ? bPrimary : bTextPrimary,
                                  borderRadius: BorderRadius.circular(8)),
                              labelColor:
                                  (isLight) ? bTextPrimary : bTextSecondary,
                              unselectedLabelColor:
                                  (isLight) ? bTextSecondary : bTextPrimary,
                              tabs: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Stasiun', style: bSubtitle3),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Terminal',
                                    style: bSubtitle3,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 285,
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    CardTransmetro(
                                      img:
                                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                                      title: "Trans Metro Bandung",
                                      rute: "Cibiru – Cibeureum",
                                      time: "07.00 WIB -16.00 WIB",
                                      onTap: () {
                                        print("Container clicked");
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CardTransmetro(
                                      img:
                                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                                      title: "Trans Metro Bandung",
                                      rute: "Cibiru – Cibeureum",
                                      time: "07.00 WIB -16.00 WIB",
                                      onTap: () {
                                        print("Container clicked");
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CardTransmetro(
                                      img:
                                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                                      title: "Trans Metro Bandung",
                                      rute: "Cibiru – Cibeureum",
                                      time: "07.00 WIB -16.00 WIB",
                                      onTap: () {
                                        print("Container clicked");
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CardTransmetro(
                                      img:
                                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                                      title: "Trans Metro Bandung",
                                      rute: "Cibiru – Cibeureum",
                                      time: "07.00 WIB -16.00 WIB",
                                      onTap: () {
                                        print("Container clicked");
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CardTransmetro(
                                      img:
                                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                                      title: "Trans Metro Bandung",
                                      rute: "Cibiru – Cibeureum",
                                      time: "07.00 WIB -16.00 WIB",
                                      onTap: () {
                                        print("Container clicked");
                                      },
                                    ),
                                    CardTransmetro(
                                      img:
                                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                                      title: "Trans Metro Bandung",
                                      rute: "Cibiru – Cibeureum",
                                      time: "07.00 WIB -16.00 WIB",
                                      onTap: () {
                                        print("Container clicked");
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    });
  }
}
