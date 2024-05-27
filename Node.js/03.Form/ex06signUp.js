const http = require('http');
const fs = require('fs').promises;
const qs = require('querystring');

http.createServer(async(req,res)=>{
    console.log('create server');
const file = await fs.readFile('./ex06signUp.html');

let body = '';
req.on('data',(data)=>{
    body += data;    
})
req.on('end',()=>{
 
 const parseQs = qs.parse(body);
    console.log(parseQs);
    res.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});
    
    req.url === '/' && res.write(file);
   if(req.url === '/welcome'){
    if(parseQs.userId === '' || parseQs.userPw ===''){
        //ID나 PW가 입력되지 않았을 때 실행될 로직
        res.write(`<script>
        alert('필수값을 입력하시오(아이디, 패스워드)');
        location.href='/'; 
        </script>`)
        //location.href : 페이지를 이동하는 것. 여기서는 원래 페이지로 돌아오기 위해 사용.
    }else if(parseQs.userPw !== parseQs.pwCheck){
        //비밀번호와 비밀번호 확인이 일치하지 않을 때 실행될 로직
        res.write(`<script>
        alert('비밀번호가 일치하지 않습니다');
        window.history.back();
        </script>`)
        //window.history.back() -> 앞 페이지로 돌아오는 것. 
    }else{
        let bloodType = '';
        switch(parseQs.bloodType){
            case 'aType':bloodType = 'A형';break;
            case 'bType':bloodType = 'B형';break;
            case 'oType':bloodType = 'O형';break;
            case 'abType':bloodType = 'AB형';break;
        }
        let gender = '';
        switch(parseQs.gender){
            case 'male':gender = '남자';break;
            case 'female':gender = '여자';break;
        }
    let data = `<html><body>
    <h1>${parseQs.userId}님 환영합니다.</h1>
    <p>${bloodType}의 ${gender}시군요!</p>
    </body></html>`
    res.write(data);}
        }
        res.end(); 
   
    
})


}).listen(8000,()=>{
    console.log('Server is listening on port 8000');
})


