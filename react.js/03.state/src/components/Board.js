import React from 'react'

const board = ({name,imgSrc,score}) => {
  return (
    <div>
    <h4>나</h4>
    <img src={imgSrc}/>
    <div>
        <h4>
            현재 점수</h4>
        <h4>{score}점</h4>
    </div>
</div>
  )
}

export default board