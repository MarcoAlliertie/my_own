const express = require('express');
const router = express.Router();
/*
세션(Session)
- 서버가 클라이언트에게 암호화된 아이디(session ID)를 부여
- 쿠키와의 차이점?
    >세션은 서버의 자원을 사용, 너무 많은 세션을 낭비하지 않는 게 좋음
    >브라우저 종료시 세션 자동 삭제
- 로그인, 로그아웃

(1) 세션 생성하기 : req.session.key = value;
(2) 세션 확인하기 : req.session.key; //value
(3) 세션 삭제하기 : req.session.key = ""; //하나만 삭제
                    req.session.destroy(); //전체 삭제

*/

//(1) 세션 생성하기
router.get('/setSession',(req,res)=>{
    req.session.nickname = '라이언'; //cookie와는 생성방법이 다름에 주의
    res.send(`<html>
        <body>
            <h3>세션 생성</h3>
            <a href='/session/getSession'>세션 확인</a>
        </body>
    </html>`);
})

//(2) 세션 확인하기
router.get('/getSession',(req,res)=>{
    res.send(`<html>
        <body>
            <h3>세션 생성</h3>
            <p>닉네임 : ${req.session.nickname}</p>
        </body>
    </html>`);
})

//(3) 세션 삭제하기 - 삭제하면 session 폴더 내에 있는 세션 json 파일이 삭제된다.
router.get('/delSession',(req,res)=>{
    // req.session.nickname = ""; //데이터 하나만 삭제시
    req.session.destroy(); //전체 삭제시
    res.send(
    `<html>
        <body>
            <h3>세션 삭제</h3>
        </body>
    </html>`)
});

module.exports = router;