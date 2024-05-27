const express = require('express');
const router = express.Router(); //라우팅 기능만 쓸 거니까 express 전체 호출할 필요 없이 라우터만 호출
const path = require('path');
router.get('/',(req, res)=>{ //ex02와는 달리 app이 존재하지 않으므로 app을 router로 바꿔준다!
    console.log('create server!');
    //(mission) ex02.html 응답하기
    //res.sendFile(__dirname+'../public/ex02.html');routes 폴더로 이사해서 경로가 달라짐. 수정!
    res.sendFile(path.join(__dirname,'..','public/ex02.html')) //join : 매개변수들을 합쳐서 경로로 만들어 주는 함수. 
})

// express GET

// 데이터 가져오는 방법 => req.query

router.get('/get',(req,res)=>{
    console.log('get success!', req.query); //번거롭게 파싱 같은 거 안 해도 객체 형태로 가져올 수 있는 게 express 쓰는 이유
    const {sat, sun} = req.query; //구조분해할당 해주기. 키값이 여러 개일 때 각각을 분해해주는 것.
    res.send(`
    <html>
        <body>
            <h1>토요일의 활동 : ${req.query.sat}</h1> `//위에서 구조분해할당 했으므로 달러표시{sat}으로 쓸 수 있다
            +`<h1>일요일의 활동 : ${req.query.sun}</h1> `// 위에서 구조분해할당 했으므로 달러표시{sun}으로 쓸 수 있다.
            +`</body>
    </html>
    `)
})


router.post('/post',(req,res)=>{
    console.log('post success!', req.body);
    
    // mission) 아이디 admin, 비밀번호 1234
    //             일치 => ex02postSuccess.html
    //             불일치 => ex02postFail.html
    
   //express를 썼으므로 번거로운 파싱 필요성 없이 바로 값을 받아왔다!
   const {userId, password}= req.body; //구조분해할당
   userId=='admin' && password=='1234'
    //?res.sendFile(__dirname+'../public/ex02postSuccess.html')여기도 주소 path 함수 써서 수정해 줘야 정상적으로 작동
    ?res.sendFile(path.join(__dirname,'..','public/ex02postSuccess.html'))
    //:res.sendFile(__dirname+'../public/ex02postFail.html');
    :res.sendFile(path.join(__dirname,'..','public/ex02postFail.html'));
})

module.exports = router;