const express = require('express');
const router = express.Router();
const path = require('path');


router.get('/',(req,res)=>{
    console.log('create server');
    res.sendFile(path.join(__dirname,'..','public'))//여기도 index.html이므로 생략할 수 있다.
})
router.post('/welcome',(req,res)=>{
    console.log('welcome!',req.body);
    res.render('welcome',req.body); //객체 형태로 렌더링해줘야 하는데 이 req.body 자체가 객체 형태로 넘어오므로 이렇게 해도 된다. 이 경우 그 안의 name을 직접 렌더링한 파일에서 쓸 수 있다.
})
router.post('/result',(req,res)=>{
    console.log('result page',req.body);
    //case 1. 라우터에서 조건식
    // const {userId,userPw} = req.body;
    // const result =
    // userId=== 'admin' && userPw ==='1234'
    // ?'성공':'실패';
    // res.render('result',{result:result});
    //이후 result.html에 하기 구문 작성
    //<h2>로그인 시도 결과 : {{result}}</h2>

    //case 2. 템플릿에서 조건식
    res.render('result',req.body);
    
})

module.exports = router;