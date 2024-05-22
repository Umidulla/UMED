import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  const DoctorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: const Color(0xff2260FF),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: const Text(
          'Shifokor info',
          style: TextStyle(
              fontSize: 24,
              color: Color(0xff2260FF),
              fontWeight: FontWeight.w600),
        ),
      ),
      body: const DoctorDetailPageContent(),
    );
  }
}

class DoctorDetailPageContent extends StatelessWidget {
  const DoctorDetailPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const <Widget>[
        DoctorDetailPageContentCard(),
      ],
    );
  }
}

class DoctorDetailPageContentCard extends StatelessWidget {
  const DoctorDetailPageContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xffA5FF84).withOpacity(.3),
            const Color(0xff44FF00).withOpacity(.6),
          ],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://photo-ideal.ru/upload/resize_cache/iblock/e9c/436_591_249dc9130545c5ea77856799b48f99ef6/xFPD_2558_2.jpg.pagespeed.ic.vBzZL5WJJm.jpg'),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xff2622FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
