import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExGallery extends StatefulWidget {
  const ExGallery({super.key});

  @override
  State<ExGallery> createState() => _ExGalleryState();
}

//이미지 하나만 선택
//ImagePicker 객체 생성
final picker = ImagePicker();
XFile? oneImage;
List<XFile?> image_list = [];


//이미지 여러 장 선택
List<XFile?> multiImage=[];

class _ExGalleryState extends State<ExGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    //갤러리 접근해서 파일로 읽어주기
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 5)
                          ],
                        ),
                        child: IconButton(
                            onPressed: () async{
                              //갤러리 접근을 위해 camera -> gallery - 하나의 이미지
                              //oneImage = await picker.pickImage(source: ImageSource.gallery);

                              //다중 이미지 접근을 하려면?
                              multiImage = await picker.pickMultiImage();


                              // if(oneImage != null){
                              //   setState(() {
                              //     image_list.add(oneImage);
                              //   });
                              // }

                              //여러 이미지는 addAll
                              if(multiImage != null){
                                setState(() {
                                  image_list.addAll(multiImage);
                                });
                              }

                            },
                            icon: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 30,
                              color: Colors.white,
                            ))),
                  ],
                ),
                Container(
                  //Image.file(File(pick_image!.path,))
                  margin: EdgeInsets.all(10),
                  //단독으로 띄우기
                  //child: Container(width: 300,height: 300, child: Image.file(File(pick_image!.path,))),

                  //gridview로 관리하기
                  child: GridView.builder(
                    itemCount: image_list.length,
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true, // gridview 안에 있는 만큼만 크기를 채워라
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //1 개의 행에 보여줄 사진 개수
                      childAspectRatio: 1 / 1, //사진 의 가로 세로의 비율
                      mainAxisSpacing: 10, //수평 Padding
                      crossAxisSpacing: 10, //수직 Padding
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // 사진 오른 쪽 위 삭제 버튼을 표시하기 위해 Stack을 사용함
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image:
                                  DecorationImage(// container에 데코레이션 지정할 수 있는 위젯
                                      fit: BoxFit.cover, //사진을 크기를 상자 크기에 맞게 조절
                                      image: FileImage(//파일을 이미지로 디코딩 해주는 작업
                                          File(image_list[index]!.path) // File객체(dart.io 임포트)를 통해 이미지의 주소 작성!
                                        //                                ㄴ 이미지의 주소 아는 방법 --> XFile.path

                                      )
                                  )
                              )

                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),

                            //삭제 버튼
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              // constraints: BoxConstraints(),
                              icon: Icon(Icons.close,
                                  color: Colors.white, size: 15),
                              onPressed: () {

                                //리스트를 remove
                                setState(() {
                                  image_list.removeAt(index);
                                });
                              },
                            ),
                            width: 25,
                            height: 25,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
