/*

Express
- Node.js를 위한 빠르고 개방적인 간결한 웹 프레임워크
- 단순(서버 생성, 요청, 응답) => 복잡(DB연결, 라우팅 작업 등)

사용방법
(1) npm init -y ( -y를 입력하지 않으면 계속 사용자에게 의사를 물어볼 것. y는 이에 대해 전부 yes로 응답한다는 의미.)
    : package.json 파일 생성
    => 현재 프로젝트 관련 정보 및 설치 모듈 관리
    => package.json: 프로젝트 정보 정의, 의존하는 패키지 버전 정보 비교적 간단하게 명시
    => package-lock.json : 패키지의 정확한 버전 정보 명시

(2) npm install express
    cf) install 대신 그냥 i 써도 됨
    : node_modules 폴더 생성
    => express 제공 모듈 사용

(3) 분업화 폴더 및 메인js 파일 생성
    - 일반적으로 메인 이름으로 app.js 사용(리액트 App.js와 구분할 것 주의!)
    - 수업 예제 많으므로 편의상 ex01.js, ex02.js, ....

분업화

- middleware : 사용자의 요청에 따른 기능을 정의
- config : 환경변수 정보 저장해 주는 공간(DB 연결, API 키 값 등...)
- public : 정적인 파일(CSS, Image 등) 저장 
- routes : 라우팅 파일 저장
- views : 동적인 html 파일 저장
- 상기 4개의 폴더를 분업화를 위해 생성

-app.method(path, callback)
ex) app.get('/',(req, res)=>{~})
=> 지정된 경로에서 HTTP 요청을 해당하는 콜백 함수로 라우팅

- app.set('title','mySite') 타이틀이나 마이사이트는 예시로 든 임의의 값임
=> express 객체 안에 저장 가능

-app.get('title') // mySite
- 두 app.get은 서로 다른 함수!

- express.static(root)
  => 정적 파일을 제공하기 위한 내장 미들웨어 함수
  => _dirname : 현재 파일이 위치한 디렉토리의 절대경로까지를 가져옴
  **정적인 파일을 클라이언트에게 상대 경로로 바로 응답 X
    미들웨어를 하나 거치고 절대 경로로 응답
*/

//(1) express 불러오기
const express = require('express');

//(2) express 실행하기
const app = express();

//포트번호 설정
// const port = 8000;
app.set('port',process.env.PORT || 8000); //express로 포트번호 설정. 환경변수에서 지정해준 포트번호 가져오고 지정한 게 없으면 8000번 가져오겠다는 의미


app.use(express.static(__dirname+'/public')) //정적인 파일의 경로를 절대경로로 설정해 주기

//(3) 서버 생성
app.get('/',(req, res)=>{  //연결 get방식으로 : path 정보, 콜백함수
    console.log('create server!');

    //Case 1. 단순 문자열 응답 : send
    // res.send('Hello World!');
    
    //Case 2. HTML 문서 응답 : 
    // res.sendFile('C:/Users/smhrd/Desktop/Study/Node.js/04.Express/public/ex01.html');  //미들웨어가 클라이언트에게 상대경로로 바로 응답해 주는 게 아니라 절대경로로 바꿔서 전송하는 식으로 작동하므로 절대경로를 불러와야 작동. 근데 너무 길어 불편! _dirname 쓰자!
    res.sendFile(__dirname+'/public/ex01.html');
})

//(4) 포트번호 지정
app.listen(app.get('port'),()=>{ //http 통신방식 get과는 달리 등록해둔 값을 name:string의 형식으로 가져오는 get
    console.log('Server is listening on port 8000');
})