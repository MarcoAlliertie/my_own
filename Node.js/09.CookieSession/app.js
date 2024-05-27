const express = require("express");
const app = express();

const cookieRouter = require('./routes/cookie');
const sessionRouter = require('./routes/session');

/*
Cookie
(1) cookie-parser 설치 : npm install cookie-parser
    => 쿠키를 확인할 수 있도록 하는 모듈
(2) cookieParser 호출
(3) cookie 미들웨어 등록 : 미들웨어를 라우팅된 위치에서도 쓸 수 있어야 하므로 라우팅 먼저! 

Session
(1) express-session, session-file-store 설치
    : npm install express-session session-file-store
    express-session => 세션 기능
    session-file-store => 세션 저장소
(2) express session, file store 호출
(3) session 미들웨어 등록 : 쿠키와 마찬가지로 미들웨어를 라우팅된 위치에서도 쓸 수 있어야 하므로 라우팅 먼저!
*/

const cookieParser = require('cookie-parser');
const session = require('express-session');
const fileStore = require('session-file-store')(session); //session에서 사용하는 파일스토어라는 뜻으로 뒤에 (session) 붙여줘야

//미들웨어인 cookieParser를 먼저 실행시켜 줘야 쿠키 라우터에서도 작동
app.use(cookieParser());
app.use('/cookie',cookieRouter);

app.use(session({
    httpOnly : true, //HTTP 프로토콜을 통한 접근만 가능
    resave : false, //불필요한 세션 저장 방지
    secret : 'secret',//암호화 키
    store : new fileStore()//세션 저장소
}));
app.use('/session',sessionRouter); //쿠키와 마찬가지로 express-session을 실행시켜줘야 라우터 사용 가능


app.set('port',process.env.PORT || 8000);
app.listen(app.get('port'),()=>{
    console.log(`Server is listening on port ${app.get('port')}`);
})