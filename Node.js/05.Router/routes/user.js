const express = require('express');
const router = express.Router();

router.get('/',(req,res)=>{ //이미 app.js에서 user 라우터 주소로 /user를 등록해 놓았으므로 여기서는 그냥 기본 폴더 상태로 설정해 줘도 /user에서 작동한다
res.send(`
<html>
    <body>
        <h1>User Page</h1>
    </body>
</html>
`)
})

router.get('/:name',(req,res)=>{ //name을 그냥 써주면 변수. 하지만 앞에 콜론을 써 주면 라우트 매개변수 => 이 변수 하나로 여러 가지를 규정할 수 있다.
    console.log('라우트 매개변수',req.params);
    /*
    (mission) <h1>welcome name! 🧡</h1>
    */
   res.send(`<html>
   <body>
   <h1>Welcome ${req.params.name}</h1>`+  //이렇게 하나의 변수로 여러 경우에 쓸 수 있으므로 와일드 카드 역할이라고 한 것!
   `</body>
   </html>
   `)
})

module.exports = router;