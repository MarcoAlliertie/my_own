import React from 'react'
import {useState} from 'react'
const Like = () => {

  let [heart, setHeart] = useState('🤍');
  const [count, setCount] = useState(0);
  const handleLike =()=>{
    console.log("클릭");
    // heart==='🤍'?setHeart(heart='🧡'):setHeart(heart='🤍'); 내가 푼 것. 이 방식으로 하면 heart를 const가 아닌 let으로 정의해야 한다.
    // count===0?setCount(count+1):setCount(count-1);
    if(count===0){
      setCount(1);
      setHeart('🧡');
    }else{
      setCount(0);
      setHeart('🤍')
    }

  }
  
  return (
    <div>
        <span onClick={handleLike}>{heart}</span>
        <span>좋아요 {count}개</span>
        </div>
  )
}

export default Like