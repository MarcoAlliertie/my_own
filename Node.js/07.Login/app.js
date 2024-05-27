const express = require('express');
const app = express();
const nunjucks = require('nunjucks');
const indexRouter = require('./routes');
const bodyParser = require('body-parser');

//모듈들 설정

app.use(express.static(__dirname+'/public'));

app.use(bodyParser.urlencoded({extended:true}));

//기본 라우팅 설정

app.use('/',indexRouter);

//넌적스 설정

app.set('view engine','html');
nunjucks.configure('views',{
    express:app,
    watch:true   
})

//포트번호 설정
app.set('port', process.env.PORT || 8000);
app.listen(app.set('port'),()=>{
    console.log(`Server is listening on ${app.set('port')}`);
})