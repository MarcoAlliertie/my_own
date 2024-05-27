import 'package:flutter/material.dart';

class ExImage extends StatelessWidget {
  const ExImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height:  150,
          color: Colors.grey,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Image.asset('image/ryan01.jpg'
                     ,
                    //fit : 이미지의 크기 처리를 위한 요소
                    fit:
                    //    BoxFit.none //Boxfit.none : 해당 이미지 원본 그 자체
                    // BoxFit.fill //Boxfit.fill : 비율에 상관 없이 해당 공간에 사진을 꽉 채움
                    // BoxFit.contain // 원본 비율을 유지하면서 컨테이너에 들어가도록 함. 이게 fit의 디폴트값.
                    //BoxFit.fitHeight // 세로 크기에 맞춰서 비율을 조정. 가로가 더 긴 이미지의 경우 가로 영역이 짤릴 수 있는 문제가 발생.
                    //BoxFit.fitWidth // 가로 크기에 맞춰서 비율을 조정. 세로가 더 긴 이미지의 경우 세로 영역이 짤릴 수 있는 문제가 발생.
                    BoxFit.cover // fitHeight와 fitWidth를 합친 것. 가로 세로 크기에 맞춰 비율을 조정하되 더 큰 쪽으로 맞춰줌.
                  ,),
                ),
              ),

              Expanded(
                child: Image.asset('image/ryan01.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}