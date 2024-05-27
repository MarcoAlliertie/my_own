/*
라우터
- 특정 URL 경로 요청에 대한 함수를 등록하여
  해당 요청이 들어왔을 때 어떤 동작을 수행할지를 정의
  ex) www.naver.com/news => 뉴스 페이지
      www.naver.com/webtoon => 웹툰 페이지

라우트 매개변수
- 특정 값을 가지는 경로에서 그 값을 매개변수로 추출하여 
  서버에서 활용할 수 있음
- /:name 문자 그대로('name')을 의미하는 것이 아니라
    : 뒤에 내가 작성한 값이 매개변수로 기능함
- localhost:8000/user/ki => name:ki로 값이 넘어옴
  req.params.name // ki
*/
const express = require('express');
const app = express();
const path = require('path');
const indexRouter = require('./routes'); //index는 파일명 생략 가능!
const userRouter = require('./routes/user'); //index가 아니므로 파일명 생략 불가

//기본 라우터
app.use('/',indexRouter);

//user 라우터
app.use('/user',userRouter); //여기서 user 페이지에서 쓴다고 설정해 놓았으므로 user.js에서는 그냥 기본 폴더('/')로 설정해 주면 user 페이지에서 작동한다.

app.set('port', process.env.PORT || 8000);
app.listen(app.get('port'), ()=>{
    console.log(`Server is listening on ${app.get('port')} `);
})
