import React from 'react'
import {useState} from 'react'
/* 
    실습2) 랜덤 숫자 맞추는 페이지 구현
    1. 사용자가 1~3 사이의 버튼을 클릭한다.
    2. 랜덤숫자를 생성한다.(1~3)
    3. 사용자가 누른 숫자의 값과 랜덤숫자를 비교한다.
      - 두 숫자가 일치하면 "정답입니다"
      - 두 숫자가 다르다면 "오답입니다"
 
*/

const Ex02 = () => {
    const [userNum,setUserNum] = useState(0);
    const [computerNum,setComputerNum] = useState(0);
    const [result,setResult] = useState('');


    const handleNum = (e) => {
        console.log(e.target.innerText); 
        const user = parseInt(e.target.innerText);
        //event 객체 중에 target에 있는 innerText를 고르는 것. 
        //event 객체의 상세에 대해서는 브라우저의 
        //개발자 모드에 들어가 보면 확인할 수 있다.
        //innerText는 HTML요소의 내용을 문자열로 가져오는 속성. 
        //이렇게 가져올 수도 있고 대입하는 데 쓸 수도 있다.
        
        const computer = parseInt(Math.random()*3)+1
        console.log("랜덤숫자:",computer);
        setUserNum(user);
        setComputerNum(computer);
        if(user === computer){ //만약 user, computer가 아니라 userNum, computerNum으로 비교하면 다 반영되기 전에 값을 비교하게 되므로 결과가 이상하게 나옴.
          //정답입니다!
           setResult("정답입니다!");
        }else{
          //오답입니다.
          setResult("오답입니다");
        }
    }
   
   
  return (
    <div>
        <div>
        <button onClick={handleNum}>1</button>
        <button onClick={handleNum}>2</button>
        <button onClick={handleNum}>3</button>
    </div>
    <div><p>내가 입력한 숫자 : {userNum}</p></div>
    <div><p>랜덤한 숫자 : {computerNum}</p></div>
    {/* <div><p>{result}</p></div> */}
    {userNum === computerNum?<p>정답입니다!</p>:<p>오답입니다.</p>} 
    {/* 이렇게 리턴문 마지막에 결과를 써 주면 다 반영되고 나서 반영된 변수값 가지고 처리하는 거라 제대로 나옴 */}
    </div>
  )
}

export default Ex02
