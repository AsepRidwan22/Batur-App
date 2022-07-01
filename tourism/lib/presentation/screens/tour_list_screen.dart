import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourism/presentation/components/custom_tour_card_list.dart';
import 'package:tourism/presentation/screens/tour_detail_screen.dart';

enum TourListScreenProcessEnum {
  loading,
  loaded,
  failed,
}

class TourListScreen extends StatefulWidget {
  const TourListScreen({Key? key}) : super(key: key);

  @override
  State<TourListScreen> createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {
  TextEditingController controller = TextEditingController();
  String find = '';
  // State for loading
  TourListScreenProcessEnum process = TourListScreenProcessEnum.loading;

  final RefreshController _refreshControllerTour =
      RefreshController(initialRefresh: false);

  void _onRefreshTour() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshControllerTour.refreshCompleted();
  }

  void _onLoadingTour() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshControllerTour.loadComplete();
  }

  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        process = TourListScreenProcessEnum.loaded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    if (process == TourListScreenProcessEnum.loading) {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _buildAppBar(),
          ];
        },
        body: Scaffold(
          body: Center(
            child: LoadingAnimationWidget.horizontalRotatingDots(
              color: Theme.of(context).colorScheme.tertiary,
              size: 50.0,
            ),
          ),
        ),
      );
    } else if (process == TourListScreenProcessEnum.failed) {
      return const ErrorScreen(
        title: "AppLocalizations.of(context)!.oops",
        message: "Failed",
      );
    } else {
      return _buildSuccess(screenSize);
    }
  }

  Widget _buildSuccess(Size screenSize) {
    if (screenSize.width < 300.0 || screenSize.height < 600.0) {
      return const ErrorScreen(
        // Text wait localization
        title: "Eror",
        message: "Eror",
      );
    } else if (screenSize.width > 500.0) {
      // Mobile Mode
      return Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500.0),
            child: _buildLoaded(screenSize),
          ),
        ),
      );
    } else {
      // Mobile Mode
      return Scaffold(
        body: _buildLoaded(screenSize),
      );
    }
  }

  Widget _buildAppBar() {
    return CustomSliverAppBarTextLeadingAction(
      // Text wait localization
      title: "Wisata",
      leadingIcon: "assets/icon/regular/chevron-left.svg",
      leadingOnTap: () {
        Navigator.pop(
          context,
        );
      },
      actionIcon: "assets/icon/regular/map.svg",
      actionOnTap: () {
        Navigator.pop(
          context,
        );
      },
    );
  }

  Widget _buildLoaded(Size screenSize) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: <Widget>[
        _buildAppBar(),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: screenSize.width - 90.0,
                    margin: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.search,
                      ),
                      style: bSubtitle1.copyWith(color: bGrey),
                      onChanged: (text) {
                        setState(() {
                          // Use for Search
                          find = text;
                        });
                      },
                    )),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icon/regular/search.svg",
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: CustomSmartRefresh(
            refreshController: _refreshControllerTour,
            onLoading: _onLoadingTour,
            onRefresh: _onRefreshTour,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  // Use Data Tour
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: CustomTourCardList(
                      img:
                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                      rating: "4.5",
                      title: "Gedung Sate",
                      timeOpen: "Buka (07.00 WIB -16.00 WIB)",
                      isFavourited: true,
                      description:
                          "Lorem ipsum It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            curve: Curves.easeInOut,
                            type: PageTransitionType.bottomToTop,
                            // Navigate to detail with parameter
                            child: const TourDetailScreen(),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
