let userName = prompt('이름을 말해주세요?');
function App2(){

    //날짜 관련 정보를 가진 객체
    let date = new Date();

    //년 월 일 정보 가져오기
    let day = date.getDate(); //getDay는 요일을 0~6까지의 숫자로 반환하는 함수
    let month = date.getMonth()+1;
    let year = date.getFullYear();

    //현재날짜를 반환하는 함수
    console.log(date.toLocaleDateString());

    let season = "";
    if (3<=month && month<=5){
        season="봄";
    }else if(6<=month&& month<=8){
        season="여름";
    }else if(9<=month&& month<=11){
        season="가을";
    }else{
        season="겨울";
    }
        console.log(day);
    return(
        <>
        {/* <h2>{year}.{month}.{day}</h2> */}
        <h2>{date.toLocaleDateString()}</h2>
        <hr></hr>
        <div>{userName}님 지금은 {season}입니다.</div>
        </>
    )

}

export default App2;