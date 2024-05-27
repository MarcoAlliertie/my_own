import 'package:ex07listview/model/baemin_model.dart';
import 'package:ex07listview/screen/baemin_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExBaemin extends StatefulWidget {
  const ExBaemin({super.key});

  @override
  State<ExBaemin> createState() => _ExBaeminState();
}

class _ExBaeminState extends State<ExBaemin> {
  @override
  Widget build(BuildContext context) {
    var brandImage = [
      'image/60.jpg',
      'image/bbq.jpg',
      'image/bhc.jpg',
      'image/goobne.png',
      'image/haha.jfif',
      'image/kyochon.jpg',
      'image/nene.png',
      'image/norang.jpg',
      'image/puradak.jpg',
    ];
    var brandName = [
      '60계 치킨',
      'BBQ',
      'BHC',
      '굽네치킨',
      '후라이드 참 잘하는 집',
      '교촌치킨',
      '네네치킨',
      '노랑통닭',
      '푸라닭',
    ];
    var score = [5,4.8,5,4.8,5,4.9,5,5,5];
    var description = ['60계 치킨은 크크크가 제일 맛있어요.','bbq는 황금올리브가 제일 맛있어요.','bhc치킨은 뿌링클이 제일 맛있어요.'
      ,'굽네치킨은 고추바사삭이 인기가 많아요.','후라이드 참 잘하는 집은 기본이 제일 맛있어요.','교촌치킨은 허니콤보가 제일 맛있죠'
      ,'네네치킨은 잘 안먹어서 잘 모르겠습니다.','노랑통닭 알싸한 마늘통닭을 제일 좋아합니다.','푸라닭은 콘소메이징이 제일 맛있습니다.'];
    var tips = ['배달팁 3,000원','배달팁 3,000원','배달팁 3,000원','배달팁 3,000원','배달팁 3,000원','배달팁 3,000원','배달팁 3,000원','배달팁 3,000원','배달팁 3,000원'];
    var orders = ['12,000원','12,000원','12,000원','12,000원','12,000원','12,000원','12,000원','12,000원','12,000원'];
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: brandName.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => baeminDetail(
                bae: Baemin(brandName[index], brandImage[index], index),
              ),
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        child: Image.asset(
                          brandImage[index],
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            brandName[index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text('${score[index]}'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${description[index]}',
                                style: TextStyle(color: Colors.grey[500]),
                              )
                            ],
                          ),
                          Text('${tips[index]}',),
                          Text('최소금액 ${orders[index]}')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
