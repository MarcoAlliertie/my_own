import React from 'react'

const Comment = ({name,comm}) => {
    const cStyle = {
        container:{
            display:"flex",
            border:"1px solid gray",
            margin:"10px"
        },
        img:{
            width:50,
            height:50
        },
        content:{
            display:"flex",
            flexDirection:"column",
            justifyContent:"center"
        }
    }
  return (
        <div style={cStyle.container}>
            <div>
            <img style={cStyle.img} src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtBuBSGksXPsAaZeCbOIDYpVtG0vFGW8Aepw&usqp=CAU"
                alt="이미지 없음"/>
            </div>
            <div style={cStyle.content}> 
                <span>{name}</span>
                <span>{comm}</span>
            </div>
        </div>
        // 새로운 요소를 할당할 때는 div를 새로 열어주는 습관을 들이는 게 좋다.
  )
}

export default Comment