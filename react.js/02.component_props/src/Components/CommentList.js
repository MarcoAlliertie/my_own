import React from 'react'
import Comment from './Comment';
const CommentList = () => {
   return (
    <div>
    <h2>댓글 목록</h2>
    <div>
            <Comment name="행인1" comm="test"/>
            <Comment name="행인1" comm="test"/>
            <Comment name="행인1" comm="test"/>
            <Comment name="행인1" comm="test"/>
    </div>
    </div>
  )
}

export default CommentList