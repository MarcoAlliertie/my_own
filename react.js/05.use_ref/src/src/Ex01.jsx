import React from 'react'
import { useRef } from 'react';
import { useState } from 'react';

const Ex01 = () => {
  /*
  ref란?
  - 컴포넌트 내부의 저장공간
  - 특정 DOM 요소 접근 시 사용

  ref 특징
  - 화면이 리렌더링 시 , ref 값이 유지가 됨
    (리렌더링시 일반 변수는 초기화)
  - ref 값 변화, 컴포넌트 리렌더링이 일어나지는 x
    (state 값 변화시, 컴포넌트 리렌더링)

  ref 활용
  - 리렌더링 여부와 관계없이 컴포넌트 내부 데이터 유지가 필요할 경우 사용
  - 특정 DOM 요소 접근시 사용
    (ex. 포커싱 작업, 속성 변경 등)
  */
  let countVar = 0;
  const [countState, setCountstate] = useState(0);
  let countRef = useRef(0); //useState나 useRef 같은 건 자동완성으로 쓰면 자동으로 import해 준다.
  
  const varClick = () =>{
    countVar +=1;
    console.log('Var',countVar);
  }
  const stateClick = () =>{
    setCountstate(countState+1);
    console.log('state',countState);
  }
  const refClick = () =>{
    // console.log('countRef',countRef);
    countRef.current+=1;
    console.log('ref',countRef.current);
  }
  //ref의 값을 변경할 때는 ref.current = 변경값 으로 접근하면 됨
  return (
    <div>
        <p>var : {countVar}</p>
        <p>state : {countState}</p>
        <p>ref : {countRef.current}</p>
        <button onClick={varClick}>var+1</button>
        <button onClick={stateClick}>state+1</button>
        <button onClick={refClick}>ref+1</button>
    </div>
  )
}

export default Ex01