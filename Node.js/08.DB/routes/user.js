const express = require("express");
const router = express.Router();
const conn = require("../config/database");

//회원가입 기능
router.post("/handleSignUp", (req, res) => {
  console.log("signup data : ", req.body);
  const { userId, userPw, userNick } = req.body;

  //회원 중복 검사
  const sql2 = `select id from nodejs_member where id=?`;
  conn.query(sql2, [userId], (err, rows) => {
    if (rows.length > 0) {
      res.send(`<script>
        alert('이미 사용중인 아이디입니다');
        location.href='/signup';
        </script>`);
    } else {
      // conn.query(sql, (values), callback)
      // const sql = `
      // insert into nodejs_member
      // values ("userId", "userNick", "userPwd")`;
      // const sql = `insert into nodejs_member values
      //             ("testId", "testNick", "testPwd")`;
      const sql = `insert into nodejs_member values 
                (?,?,?)`;
      conn.query(sql, [userId, userPw, userNick], (err, rows) => {
        //  console.log("rows", rows);
        //  console.log("error", err);
        if (rows) {
          console.log("회원가입 성공");
          res.redirect("/");
        } else {
          console.log("회원가입 실패");
          res.send(`<script>alert("회원가입 실패"); 
            location.href='/signup';
            </script>`);
          //alert는 브라우저 내에 내장된 기능인데 node.js는 브라우저 밖에서 작업하는 것이므로 alert를 실행하기 위해 script 태그를 보내주는 것
        }
      });
    }
  });
});
//로그인 기능
router.post("/handleSignIn", (req, res) => {
  console.log("signin data", req.body);
  const { userId, userPw } = req.body;
  const sql = `select id, nick from nodejs_member where
                id =? and pw=?`;
  conn.query(sql, [userId, userPw], (err, rows) => {
    console.log("err", err);
    console.log("rows", rows);
    if (rows.length > 0) {
      console.log("로그인 성공");
      req.session.nickname=rows[0].nick;
      // res.redirect("/"); //서버 단에서 작동하는 것 세션 작업 후에는 잘 작동 안 되므로 클라이언트 측에서 작동하는 JS형태의 location.href 명령어 써 주자
      res.send(`<script>location.href='/'</script>`);
      
    } else {
      console.log("로그인 실패");
      res.send(`<script>
            alert('로그인 실패');
            location.href = '/signin';
            </script>
            `);
    }
  });
});

//회원목록 기능
router.get("/showList", (req, res) => {
  console.log("showList data", req.query);
  if (req.query.userId) {
    //특정회원 검색
    const sql = `select id, nick from nodejs_member
        where id =?`;
    conn.query(sql, [req.query.userId], (err, rows) => {
      console.log("err", err);
      console.log("rows", rows);
      res.render("list", {rows: rows});
    })
  } else {
    //전체회원 검색
    const sql = `select id, nick from nodejs_member`;
    conn.query(sql, (err, rows) => {
      console.log("err", err);
      console.log("rows", rows);
      res.render("list", {rows: rows});
    })
  }
})

//회원탈퇴 기능
router.post('/handleDelete',(req,res)=>{
    console.log('delete data',req.body);
    const {userId,userPw} = req.body;
    const sql = `delete from nodejs_member where id=? and pw=?`
    conn.query(sql,[userId,userPw],(err,rows)=>{
        console.log('rows',rows);
        if(rows.affectedRows>0){
            res.redirect('/');
        }else{
            res.send(`<script>
            alert('존재하지 않는 회원정보입니다.');
            location.href='/delete';
            </script>`);
        }
    })
})

//로그아웃 기능
router.get('/signOut',(req,res)=>{
  req.session.destroy();
  res.redirect('/'); //세션 다 삭제되었으므로 redirect 명령어가 잘 작동됨
})


module.exports = router;
