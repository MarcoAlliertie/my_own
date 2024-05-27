const express =require('express');
const router = express.Router();

//메인 페이지
router.get('/',(req,res)=>{
    console.log('main page',req.session.nickname);
    res.render('main',{nickname:req.session.nickname});
})

//회원가입 페이지
router.get('/signup',(req,res)=>{
    console.log('signup page');

    res.render('signup');
})

//로그인 페이지
router.get('/signin',(req,res)=>{
    console.log('login page');
    res.render('signin');
})

//특정회원 검색 페이지
router.get('/search',(req,res)=>{
    res.render('search');
})

router.get('/delete',(req,res)=>{
    res.render('delete');
})

module.exports = router;