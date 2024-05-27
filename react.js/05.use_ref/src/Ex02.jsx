import React from 'react'
import { useRef } from 'react';

const Ex02 = () => {
    const inputRef = useRef();
    const jsClick =() =>{
        const inputJS = document.querySelector('.inputJS');
        console.log(inputJS.value);
    }
    const refClick = ()=>{
        console.log(inputRef); //ref
        console.log(inputRef.current); //input
        console.log(inputRef.current.value); //input 입력값
        }
  return (
    <div>
            <input type="text" className='inputJS'/>
            <button onClick={jsClick}>JS</button>
            <input type="text" ref={inputRef}/>
            <button onClick={refClick}>React</button>      
    </div>
    )
}

export default Ex02