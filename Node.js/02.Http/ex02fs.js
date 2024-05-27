//fs(file system) 모듈 : 파일 입출력 처리를 할 때 사용하는 모듈
const { log } = require('console');
const fs = require('fs');
fs.readFile('./file.txt',(err, data)=>{
    /*
    파일을 읽어올 때 실행되는 콜백 함수
    - 첫번째 인자 : 에러를 처리
    - 두번째 인자 : 파일 데이터를 처리
    */
   err
   ?console.log(err)
   :console.log(String(data));
})

//동기 방식으로 파일 읽어오기
const syncFs = fs.readFileSync('./file.txt')
console.log(syncFs);

//비동기 방식은 먼저 queue를 거쳤다 stack으로 오므로
//비록 비동기 방식이 위에 씌여졌다 하더라도 실행은 
//동기 방식이 먼저 되는 것.