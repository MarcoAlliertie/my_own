import React, { useContext, useState } from 'react'
import {FaCheckCircle, FaRegCircle} from 'react-icons/fa'
import { TodoContext } from '../context/TodoContext'

//할일 완료체크기능
//할일 수정기능
//할일 삭제기능

const TodoItem = ({todo}) => {

    const {todos, setTodos}= useContext(TodoContext)

    const [edited,setEdited] = useState(false); //수정가능한 상태인지에 대한 정보
    const [newContent,setNewContent] = useState(todo.content);


    //할 일 완료 체크 기능
    const completeChange = () =>{

        //사용자가 체크한 할 일 정보를 가진 새로운 배열로 생성
    let updateList = todos.map((item)=>({
        ...item, //...이란 여기에 id:~,content:~,complete:~ 값을 그대로 복사해 와서 넣는다는 의미
        complete:todo.id===item.id? //위의 ...에 들어가는 값들 중 complete라는 값이 추가되는 게 아니라 기존 값이 변경
        !item.complete:item.complete
    }))
        setTodos(updateList)
        }
    //수정상태 변경 기능
    const editedChange = () => {
        setEdited(true)
    }


    //할 일 수정 기능
    const contentUpdate = () => {
        let updateList = todos.map((item)=>({
            ...item,
            content:todo.id===item.id?newContent : item.content
        }))
        setTodos(updateList)
        setEdited(false)
    }


    //할 일 삭제기능
    const contentDelete =(id) =>{
        if(window.confirm('정말 삭제하시겠습니까?')){
            console.log(id);
            let updateList = todos.filter((item)=>item.id !== id)
            setTodos(updateList)
            
        }
    }

  return (
    <li className='todo-item'>
        {todo.complete?
        (<FaCheckCircle style={{color:'green'}} className='todo-item-checkbox' onClick={completeChange}/>)
        :(<FaRegCircle className='todo-item-checkbox' onClick={completeChange}/>)}
        
        {/* edited 값에 따라 서로 다른 HTML요소 출력하기 */}
        {edited?
        (<input type='text' className='todo-item-edit-input' value={newContent} onChange={(e)=>setNewContent(e.target.value)}/>)
        :
        (<span className={`todo-item-content ${todo.complete?'todo-item-content-checked':''}`}>{todo.content}</span>)}
        {/* edited 값에 따라 서로 다른 버튼 출력하기 */}
        {edited?
        (<button className='todo-item-submit-btn' onClick={contentUpdate}>💥🔪</button>)
        :
        ( <button className='todo-item-edit-btn' onClick={editedChange}>💎</button>)
        }
        
       {/* 인자값을 함수에 넘겨줘야 할 경우 이벤트 호출은 아래와 같이 구현해야 한다. */}
        <button className='todo-item-delete-btn' onClick={()=>contentDelete(todo.id)}>🗑</button> 
    </li>
  )
}

export default TodoItem