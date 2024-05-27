const express = require('express');
const router = express.Router();

/*
쿠키 (Cookie)
- 클라이언트 웹 브라우저에 저장되는 정보
- 쿠키는 서버의 자원이 아닌 클라이언트의 자원을 사용
- 놀이공원에서 손님이 들고 다니는 자유이용권 같은 것
- 쿠키는 사용자가 브라우저를 종료하더라도 그 기록이 남아 있음
- 그 만료 시기 또한 지정하여 저장 가능
- 보안 측면에서 상대적으로 취약
- 장바구니, 로그인 시 아이디 기억 등 보안에 덜 민감한 기능 사용 가능

(1) 쿠키 저장하기 : res.cookie(key,value)
(2) 쿠키 확인하기 : req.cookies.key //value값 확인
(3) 쿠키 삭제하기 : req.clearCookie(key)

*/

//(1) 쿠키 저장하기
router.get('/setCookie',(req,res)=>{
    console.log('the cookie that i made 🍪');

    //res.cookie(key,value) : 쿠키도 key와 value 값으로 되어 있다.
    res.cookie('nickname','춘식이'); //서버가 nickname이 춘식이인 쿠키를 클라이언트에 준 것

    //쿠키 만료 설정 방법 1: maxAge
    //쿠키의 수명을 밀리초(1/1000초) 단위로 설정
    res.cookie('coffee', '아메리카노',{
        maxAge:3000 //setCookie 페이지 새로고침 후 3초 경과 후에 getCookie 페이지 가서 새로고침하면 쿠키가 만료되었으므로 아메리카노란 값이 뜨지 않는다.
        
    });

    //쿠키 만료 설정 방법 2: expires
    // - 쿠키의 수명을 만료 날짜로 설정
    res.cookie('football','손흥민',{
        expires:new Date(Date.now()+1000*60*60*24*3) //현재 날짜 +3일. 보통 시간으로 쓸 때는 setAge를, 날짜로 지정할 때는 expires를 쓴다.
    })

    res.send(`<html>
    <body>
        <h3>쿠키 생성 완료</h3>
        <a href='/cookie/getCookie'>쿠키 확인하기</a>
        <a href='/cookie/clearCookie'>쿠키 삭제하기</a>
    </body>
    </html>`);
})

//(2) 쿠키 확인하기
router.get('/getCookie',(req,res)=>{
    console.log('🍪',req.cookies);
    res.send(`<html>
    <body>
        <h3>쿠키 확인</h3>
        <p>닉네임 : ${req.cookies.nickname}</p>
        <p>좋아하는 커피 : ${req.cookies.coffee}</p>
        <p>좋아하는 축구선수 : ${req.cookies.football}</p>
    </body>
    </html>`);
})

//(3) 쿠키 삭제하기
router.get('/clearCookie',(req,res)=>{
    res.clearCookie('nickname');
    res.send(`
    <html>
        <body>
            <h3>쿠키 삭제</h3>
        </body>
    </html>`)
});

module.exports = router;