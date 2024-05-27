const express = require('express');
const router = express.Router();

router.get('/',(req,res)=>{
    console.log('Main Page');
    //res.render(file)
    //=> views 내의 파일
    res.render('main',{namek:'plains'}); //확장자 없이 이름만 써 주면 된다
})


// /mypage => mypage.html

router.get('/mypage',(req,res)=>{
    res.render('mypage');
})

module.exports = router;