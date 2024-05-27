/* 
Template Engine
- 서버 측의 동적인 HTML을 생성하기 위한 도구
- Nunjucks, EJS, PUG,....
- HTML과 유사한 Nunjucks 사용

Nunjucks 사용 방법
(1) 설치
    npm i nunjucks chokidar
(2) nunjucks 가져오기
    const nunjucks = require('nunjucks');
(3) view engine 확장자 설정
    app.set('view engine','html')
    => 넌적스 확장자는? html!
(4) nunjucks 구성 설정
    nunjucks.configure(path,options({}))
    :옵션 설정 => 객체 형태로
    {express :app, watch : true}
    - express : app => express가 담겨 있는 객체(app) 연결
    - watch : true => html 변경 시 템플릿 엔진 리렌더링 
    cf) 리렌더링 : 변경 시 다시 불러와서 확인한다는 말.
*/

const express = require('express');
const app = express();
const nunjucks = require('nunjucks');
const indexRouter = require('./routes');

app.set('view engine','html');
nunjucks.configure('views',{
    express : app,
    watch : true
})

app.use('/',indexRouter);
app.set('port',process.env.PORT || 8000);
app.listen(app.get('port'),()=>{
    console.log(`Server is listening on ${app.get('port')}`);
})