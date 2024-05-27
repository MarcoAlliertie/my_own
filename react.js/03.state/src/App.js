import './App.css';
import {useState} from 'react';

/*
state(상태)
  - 컴포넌트 내부에서 사용하는 데이터
  - 상태값이 변화하면 React에서 감지하고 이후에 
    변경된 값을 화면에 반영(리렌더링 후 값을 반영하는 방식)

state 사용방법
1. 생성
  const [state이름, set함수 이름] = useState(초기값);
  - state이름 : 컴포넌트 내부에서 사용한 데이터
  - set함수 이름 : state를 변경하는 함수
  * state를 직접적으로 수정하지는 않음. 반드시 함수를 통해서
    변경해야.
2. state를 사용할 때 state이름으로 접근
3. state를 변경할 때 set 함수로 변경
4. 반드시 state가 페이지 상단에 import 되어있는지 체크
   import {useState} from 'react';
*/


function App() {
  let count = 0;
  let [count2, setCount2] = useState(0); //useState:리액트에서 지원하는 스테이트 관리하는 함수
  //useState(0)의 0은 state 초기값. 초기값은 설정하기 나름. 배열로도 객체로도 정의할 수 있다. count2는 state 상태값을 담는 변수. setCount2는 count2 상태값을 변경하는 함수.
  const handleClick =()=>{
    console.log("클릭");
    count+=1; //작동하지 않는다!
    console.log(count);//콘솔상으로는 수치 증가
  }

  const handleClick2=()=>{
    setCount2(count2+1); //콘솔상의 카운트 값은 증가x
    //그 즉시 반영하는 것이 아니라 React에서 감지하고 리렌더링 후 나중에. 
  }
  
  return (
    <div>
      <p>숫자:{count}</p>
      <p>state:{count2}</p>
      <button onClick={handleClick}>클릭</button>
      <button onClick={handleClick2}>클릭</button>
    </div>
  );
}

export default App;
