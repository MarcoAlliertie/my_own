const http = require('http') //서버 생성을 위한 모듈 불러오기
const fs = require('fs').promises; // 파일 읽어오기 위한 모듈 불러오기

http
//서버 생성
//await은 async 안에서만 쓸 수 있다.
.createServer(async (req,res)=>{
    const data = await fs.readFile('./index.html');
    //응답 받아오려면 우선 헤더 만들어 줘야
    res.writeHead(200,{'Content-Type':'text/html; charset=utf-8' });
    res.write(data);
    res.end();
})
//포트 번호 설정
.listen(8000,()=>{
    console.log('서버 대기중');
});
