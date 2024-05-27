import React from 'react'
import imgSrc from './img/image.gif'
import Like from './components/Like'
/*
    실습1) 좋아요 기능을 가진 페이지 구현
    1. 빈 하트 클릭하면 꽉찬 하트로 변경
    2. 좋아요 숫자를 1개로 변경
    3. 꽉찬 하트를 클릭하면 빈 하트로 변경
    4. 좋아요 숫자를 0개로 변경
*/


const Ex01 = () => {

  return (
    <div>
        <img src={imgSrc} alt="이미지 없다"/>
        <Like/>
    </div>
  )
}

export default Ex01