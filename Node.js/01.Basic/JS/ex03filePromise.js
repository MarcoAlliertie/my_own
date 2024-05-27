const fs = require('fs').promises;

//promise 함수로 가져온 것이므로 함수 문법에 맞게 콜백함수를 연결
fs.readFile('./file.txt')
.then((data) =>{
    console.log(String(data));
})
.catch((err)=>{
    console.log(err);
})