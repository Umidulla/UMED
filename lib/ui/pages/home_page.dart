import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import 'package:flutter_application_1/domain/data.dart';

import 'package:flutter_application_1/ui/router/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/Heart.png',
            width: 50,
            height: 50,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settings);
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xffCAD6FF)),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      bottomNavigationBar: FloatingNavbar(
        currentIndex: 0,
        borderRadius: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        selectedBackgroundColor: Colors.transparent,
        selectedItemColor: const Color(0xff00278C),
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xff48BE7E),
        onTap: (int val) {},
        items: [
          FloatingNavbarItem(
            icon: Icons.home,
          ),
          FloatingNavbarItem(
            icon: Icons.message,
          ),
          FloatingNavbarItem(
            icon: Icons.calendar_month,
          ),
          FloatingNavbarItem(
            icon: Icons.person,
          ),
        ],
      ),
      body: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(2, (index) {
      return MainPageHeaderBtn(
        btnText: index == 1 ? 'Bolalar hastaliklari' : 'Kattalar hastaloklari',
        isActive: currentPage == index ? true : false,
      );
    });

    return DefaultTabController(
      initialIndex: currentPage,
      length: 2,
      child: Column(
        children: <Widget>[
          TabBar(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
            tabs: items,
          ),
          const SizedBox(height: 16),
          MainPageView(
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}

class MainPageView extends StatelessWidget {
  final int currentPage;
  const MainPageView({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const MainPageViewAdults(),
      const MainPageViewChild(),
    ];
    return Expanded(
      child: pages[currentPage],
    );
  }
}

class MainPageViewAdults extends StatelessWidget {
  const MainPageViewAdults({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainPageViewCarousel(
          data: AppData.adultData,
        ),
        const SizedBox(height: 16),
        const MainPageSearchField(),
        const SizedBox(height: 16),
        const MainPageDoctorsCategoriesAdult(),
      ],
    );
  }
}

class MainPageViewCarousel extends StatelessWidget {
  final List data;
  const MainPageViewCarousel({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xffF0FBEC),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => MainPageViewCarouselItem(
          item: data[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: data.length,
      ),
    );
  }
}

class MainPageViewCarouselItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const MainPageViewCarouselItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item['img'],
              width: 60,
              height: 60,
            ),
            const Spacer(),
            SizedBox(
              height: 36,
              child: Text(
                item['title'],
                textAlign: TextAlign.center,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ));
  }
}

class MainPageViewChild extends StatelessWidget {
  const MainPageViewChild({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        MainPageViewCarousel(data: AppData.childData),
        SizedBox(height: 16),
        MainPageSearchField(),
        SizedBox(height: 16),
        MainPageDoctorsCategoriesChild(),
        MainPageDoctors(),
      ],
    );
  }
}

class MainPageHeaderBtn extends StatelessWidget {
  final String btnText;
  final bool isActive;
  const MainPageHeaderBtn({
    super.key,
    this.btnText = '',
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          isActive ? const Color(0xff48BE7E) : const Color(0xffE3EDEE),
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Color(0xff48BE7E),
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: isActive ? Colors.white : const Color(0xff48BE7E),
        ),
      ),
    );
  }
}

class MainPageSearchField extends StatelessWidget {
  const MainPageSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Color(0xffCFFEE4),
            filled: true,
            contentPadding:
                EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
            hintText: 'Qaysi shifokor maslahati kerak?',
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
            suffixIcon: Icon(
              Icons.search,
              color: Color(0xff2260FF),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            )),
      ),
    );
  }
}

class MainPageDoctorsCategoriesAdult extends StatefulWidget {
  const MainPageDoctorsCategoriesAdult({super.key});

  @override
  State<MainPageDoctorsCategoriesAdult> createState() =>
      _MainPageDoctorsCategoriesAdultState();
}

class _MainPageDoctorsCategoriesAdultState
    extends State<MainPageDoctorsCategoriesAdult> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items =
        List.generate(AppData.doctorCategoriesAdult.length, (index) {
      return Container(
        width: 120,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: activePage == index ? Colors.white10 : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            )),
        child: Text(
          AppData.doctorCategoriesAdult[index],
          maxLines: 1,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff0D0AB6),
          ),
        ),
      );
    });

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF0FBEC),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: DefaultTabController(
        length: AppData.doctorCategoriesAdult.length,
        child: TabBar(
          onTap: (index) {
            setState(() {
              activePage = index;
            });
          },
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          tabAlignment: TabAlignment.start,
          indicatorPadding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          isScrollable: true,
          tabs: items,
        ),
      ),
    );
  }
}

class MainPageDoctorsCategoriesChild extends StatefulWidget {
  const MainPageDoctorsCategoriesChild({super.key});

  @override
  State<MainPageDoctorsCategoriesChild> createState() =>
      _MainPageDoctorsCategoriesChildState();
}

class _MainPageDoctorsCategoriesChildState
    extends State<MainPageDoctorsCategoriesChild> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items =
        List.generate(AppData.doctorCategoriesChild.length, (index) {
      return Container(
        width: 120,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: activePage == index ? Colors.white10 : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            )),
        child: Text(
          AppData.doctorCategoriesChild[index],
          maxLines: 1,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff0D0AB6),
          ),
        ),
      );
    });

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF0FBEC),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: DefaultTabController(
        length: AppData.doctorCategoriesChild.length,
        child: TabBar(
          onTap: (index) {
            setState(() {
              activePage = index;
            });
          },
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          tabAlignment: TabAlignment.start,
          indicatorPadding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          isScrollable: true,
          tabs: items,
        ),
      ),
    );
  }
}

class MainPageDoctors extends StatelessWidget {
  const MainPageDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: ScrollController(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => const MainPageDoctorsItem(),
      itemCount: 10,
    );
  }
}

class MainPageDoctorsItem extends StatelessWidget {
  const MainPageDoctorsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xffA5FF84).withOpacity(.3),
              const Color(0xff44FF00).withOpacity(.3),
            ],
          ),
        ),
        child: ListTile(
          onTap: () {
            showFlexibleBottomSheet(
              bottomSheetBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              maxHeight: .8,
              initHeight: .4,
              context: context,
              builder: (context, controller, factor) => MainPageDoctorsItemMenu(
                controller: controller,
              ),
            );
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          contentPadding: const EdgeInsets.all(8),
          leading: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey.shade300,
          ),
          title: const Text(
            'Axmedova Nilufar Raxmatullaevna',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff0D0AB6),
            ),
          ),
          subtitle: const Text('Terapevt'),
        ),
      ),
    );
  }
}

class MainPageDoctorsItemMenu extends StatelessWidget {
  final ScrollController controller;
  const MainPageDoctorsItemMenu({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Center(
            child: MainPageDoctorsItemMenuBtns(),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // padding: const EdgeInsets.all(16),
            children: <Widget>[
              const MainPageDoctorsItemMenuHeader(),
              Center(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MainPageDoctorsItemMenuBtn(btnAction: () {}),
                        const SizedBox(width: 20),
                        MainPageDoctorsItemMenuBtn(btnAction: () {}),
                        const SizedBox(width: 20),
                        MainPageDoctorsItemMenuBtn(btnAction: () {}),
                        const SizedBox(width: 20),
                        MainPageDoctorsItemMenuBtn(btnAction: () {}),
                      ],
                    )),
              ),
              const MainPageDoctorsItemMenuBody(),
            ],
          ),
        ],
      ),
    );
  }
}

class MainPageDoctorsItemMenuBtns extends StatelessWidget {
  const MainPageDoctorsItemMenuBtns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        width: 34,
        height: 4,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}

class MainPageDoctorsItemMenuHeader extends StatelessWidget {
  const MainPageDoctorsItemMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageUrl:
                  'https://photo-ideal.ru/upload/resize_cache/iblock/e9c/436_591_249dc9130545c5ea77856799b48f99ef6/xFPD_2558_2.jpg.pagespeed.ic.vBzZL5WJJm.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const SizedBox(
          width: 220,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ahmedova Nilufar Raxmatullaevna',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0D0AB6),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Terapevt',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff303030),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}

class MainPageDoctorsItemMenuBody extends StatelessWidget {
  const MainPageDoctorsItemMenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: const <Widget>[
        MainPageDoctorsItemMenuBodyItem(),
        MainPageDoctorsItemMenuBodyItem(),
        MainPageDoctorsItemMenuBodyItem(),
        MainPageDoctorsItemMenuBodyItem(),
      ],
    );
  }
}

class MainPageDoctorsItemMenuBodyItem extends StatelessWidget {
  const MainPageDoctorsItemMenuBodyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Shifokor haqida:',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff2260FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb /ncccccccccccccccccccccccccccc/nddddddddddddddddddddddddddddddd/neeeeeeeeeeeeeeeeeeeeeeeee/nfffffffffffffffffffffffffffffff/nggggggggggggggggg",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff303030),
          ),
        )
      ],
    );
  }
}

class MainPageDoctorsItemMenuBtn extends StatelessWidget {
  final Function btnAction;
  final Color splashColor;
  const MainPageDoctorsItemMenuBtn(
      {super.key, required this.btnAction, this.splashColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => btnAction,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(16),
        ),
        overlayColor: MaterialStatePropertyAll(splashColor.withOpacity(0.5)),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
      child: const Icon(
        Icons.call,
        size: 48,
        color: Color(0xff0FA12F),
      ),
    );
  }
}
