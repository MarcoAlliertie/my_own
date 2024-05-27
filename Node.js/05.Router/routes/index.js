const express = require('express');
const router = express.Router();

router.get('/',(req,res)=>{
    console.log('Main page');
    res.send(`<html>
        <body>
            <h1>Main Page</h1>
            <a href="/user">User Page</a>
            <a href="/login">Login Page</a>
        </body>
    </html>`);
})
router.get('/login',(req,res)=>{
    res.send(`<html>
    <body>
        <h1>Login Page</h1>
        <a href="/user/ki">교인 로그인</a>
        <a href="/user/sj">성재 로그인</a>
        <a href="/user/ym">용묵 로그인</a>
        <a href="/user/sc">승철 로그인</a>
    </body>
</html>
    `)
})
//user페이지에 대한 작업은 별도의 user.js 파일 만들어 해줄 것
module.exports = router;