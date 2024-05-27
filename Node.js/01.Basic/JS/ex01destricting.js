/*
Destructing assingnment(구조 분해 할당)
구조 분해 할당 구문은 배열이나 객체의 속성을 해체하여
그 값을 개별 변수에 담을 수 있게 하는 JavaScript 표현식
*/

//배열 형태

const [num1, num2] = [1,2];
//const num1 = 1; const num2 = 2;를 배열 형태로 만들어 준 것
console.log(num1,num2);


const array = [3,4];
const [num3, num4] = array;
console.log(num3, num4);

//객체 형태

const {num5, num6} = {num5: 5, num6:6};
//어느 한 쪽의 num5, num6 순서를 다르게 하더라도 변수에 잘 들어간다.
console.log(num5,num6);

const object = {num7 : 7, num8 : 8};
const {num7, num8} = object;
//위 라인이 바로 구조분해하는 것.
console.log(num7, num8);