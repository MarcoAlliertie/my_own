void main() {

  //for문 - for(변수, 조건식, 가변치){}
  for(int i = 0; i<10; i++){
    print('${i+1} 번째 for문');
  }

  //for in문 - 파이썬 for문과 유사. 단 자료형 명시해주어야
List<int> list1 = [1,2,3,4,5];
  for(int i in list1){
    print(i);
  }

  // while
  int cnt = 0;
  while(cnt < 10){
    cnt++;
    print(cnt);
  }


  // do while
  do {
    cnt--;
    print(cnt);
  } while (cnt > 0);

}