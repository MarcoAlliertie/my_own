const express = require('express');
const app = express();
const indexRouter = require('./routes/index') //파일명을 index로 지었으면 여기서 index라는 파일명 생략하고 routes 폴더로만 써도 된다.

/*
body-parser => POST 방식 응답 데이터 추출 모듈 -> 이거 없으면 undefined 응답만 온다
urlencoded() => req.body 속성 추가
extended:true => 객체 안의 객체를 파싱
*/

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({extended:true})); //extended:true는 객체 안의 객체 파싱해 줄 때 필요한 것. 지금 예제에선 그런 게 없으므로 false로 해도 되지만 일단...

app.set('port',process.env.PORT || 8000);
app.use(express.static(__dirname+'/public'));

app.use('/',indexRouter);

/* 이 부분 너무 길기 때문에 ./routes/index.js로 옮겨준다!
app.get('/',(req, res)=>{ 
    console.log('create server!');
    //(mission) ex02.html 응답하기
    res.sendFile(__dirname+'/public/ex02.html');
})

express GET

데이터 가져오는 방법 => req.query

app.get('/get',(req,res)=>{
    console.log('get success!', req.query); //번거롭게 파싱 같은 거 안 해도 객체 형태로 가져올 수 있는 게 express 쓰는 이유
    const {sat, sun} = req.query; //구조분해할당 해주기
    res.send(`
    <html>
        <body>
            <h1>토요일의 활동 : ${req.query.sat}</h1> //위에서 구조분해할당 했으므로 달러표시{sat}으로 쓸 수 있다
            <h1>일요일의 활동 : ${req.query.sun}</h1> // 위에서 구조분해할당 했으므로 달러표시{sun}으로 쓸 수 있다.
        </body>
    </html>
    `)
})


app.post('/post',(req,res)=>{
    console.log('post success!', req.body);
    
    mission) 아이디 admin, 비밀번호 1234
                일치 => ex02postSuccess.html
                불일치 => ex02postFail.html
    
   //express를 썼으므로 번거로운 파싱 필요성 없이 바로 값을 받아왔다!
   const {userId, password}= req.body; //구조분해할당
   userId=='admin' && password=='1234'
    ?res.sendFile(__dirname+'/public/ex02postSuccess.html')
    :res.sendFile(__dirname+'/public/ex02postFail.html');
})
*/
app.listen(app.get('port'),()=>{
    console.log('server is listening on 8000');
})