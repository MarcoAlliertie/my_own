/*
모듈 : Node.js에서 만들어 놓은 기능들의 단위
모듈을 내보내기 => module.exports
모듈 가져오기 => require('모듈이름')
*/

const variable = require('./ex02var');
console.log(variable);

// const {odd, even} = require('./ex02var')
// console.log(odd, even);

let num = 5;
// let result = num%2===1? odd : even
let result = num%2===1? variable.odd : variable.even
// variable로 가져왔을 때는 위처럼 써야 한다
console.log(result);