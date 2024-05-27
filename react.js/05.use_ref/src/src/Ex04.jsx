import React, { useState } from 'react'
import { useRef } from 'react'

/*
(1) 사용자가 input 태그 안에 입력한 값을 가져오기
(2) 그 값에 따라서 해당하는 경로로 이미지 src 속성 변경하기
*/

const Ex04 = () => {
    const textRef = useRef();
    const imgRef = useRef();
    const imgList = [
        {name : '판다', src:"https://www.greenpeace.org/static/planet4-korea-stateless/2019/07/23bc50e0-23bc50e0-gettyimages-183415880.jpg"},
        {name : '사막여우', src :'https://thumbnews.nateimg.co.kr/view610///onimg.nate.com/orgImg/ns/2006/07/02/2006-07-02T111527Z_01_NOOTR_NISIDSP_2_120060702105304440.JPG'},
        {name : '강아지', src : 'https://image.newsis.com/2021/11/19/NISI20211119_0018172677_web.jpg'}
    ]
    
    const [states,setStates] = useState('');

    const imgChange = () => {
      // console.log(textRef.current.value); 
      // switch(textRef.current.value){
        // case imgList[0].name : imgRef.current.src = imgList[0].src; break;
        // case imgList[1].name : imgRef.current.src = imgList[1].src; break;
        // case imgList[2].name : imgRef.current.src = imgList[2].src; break;
      
      imgList.forEach(item=>{
        textRef.current.value === item.name && (imgRef.current.src = item.src);
      })

      //input 입력값 비워주기
      textRef.current.value = '';

      //input 오토포커싱
      textRef.current.focus();
      }
     
    
  return (
    <div>
        <p>어떤 사진을 원하시나요?</p>
        <input type="text" ref={textRef}/>
        <button onClick={imgChange}>변경</button>
        <br/><br/>
        <img src={states} width="250px" ref={imgRef} alt="" />
        

    </div>
  )
}

export default Ex04