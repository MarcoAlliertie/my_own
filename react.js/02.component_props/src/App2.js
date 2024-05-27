import './App.css';
import BaseCard from './Components/BaseCard';
import CommentList from './Components/CommentList';

function App() {
    return(
        <div>
        <BaseCard team="KIA" player="강병우"/>
        <BaseCard team="SSG" player="김광현"/>
        <BaseCard team="두산" player="김동주"/>
        <BaseCard team="한화" player="문동주"/>

        {/*댓글목록*/}
        <CommentList/> 
        {/* 내 실수 : 이 안에 <comment/>를 넣어보려 했음. 원래 그렇게 적용되는 기능 아니다. 이미지 태그와 비슷하다고 생각하자.<img></img>사이에 뭐라고 쓴들 이미지 파일이 변화되지는 않는다. */}
        </div>
    )

}

export default App;