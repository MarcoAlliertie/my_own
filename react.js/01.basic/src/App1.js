
import './App.css';

//라이브서버 동작하듯 수정하는대로 실시간으로 웹페이지에 반영
//JS 문법 쓸 땐 중괄호를 쓰면 된다.
//JSX 문법
//HTML과 JS를 하나의 파일에 작성할 수 있는 문법

//JSX 문법 특징
//1. 반드시 하나의 요소만 return할 수 있다.

//2. 자바스크립트 문법은 표현식으로 사용(return문 안에서)
//   표현식 → {변수명} or {값} or {조건관련문법}

//3. React에서는 class 속성이 아닌 className 속성으로 정의
//   onclick -> onClick으로 정의
//   <a>...</a>  -> <A>(컴포넌트로 인식)
//HTML문법 내 내용이 없어도 끝태그는 반드시 작성!

//4. React에서 스타일 적용 시, 객체형태로 정의
//스타일 속성을 정의할 때 ‘-’은 작성하지 않는다. 대신 두번째 단어의 첫 글자를 대문자로 작성
//ex) css문법 font-size 
// ⇒  JS문법 fontSize

function App() {

  let msg = "React 첫 수업!";
  let num = 11;
  let style = {
    // 스타일속성 : 값
    backgroundColor:"black",
    color:"white"
  }
  let result ="";

  if(num===10){
    console.log('num은 10이다.');
    result = "num은 10이다";
  }else if(num===11){
    result = "num은 11이다";
  }else if(num===12){
    result = "num은 12이다.";
  }

  return (
    <>
    <div style={style}>
      Hello React!!!!!! {"React 첫 수업!!!!"}

      {/* 조건부 렌더링 방식 3가지 */}

      {/* 조건이 하나일 때 */}
      {/* 조건이 0이면 0만 출력 */}
      {/* 조건이 true(==1)이면 && 오른쪽의 값을 출력 */}
      {/* 조건이 false면 값을 출력 x */}

      { 0 && "환영합니다!" }
      { 1 && "환영 안 해"}
      {false && "환영이 뭐임"}

      {/* 조건이 두 개일 때 */}
      {/*삼항연산자 이용 :return문 안에서는 if문 쓸 수 없다.*/}
      {/* 조건에 따른 값을 출력할 때 값 또는 HTML 문법을 정의할 수 있다. */}
      {num===10?"num은"+num+"이다.":<h1 className="txt">num은 {num}이겠지.</h1>}

      {/* 조건이 세 개 이상일 때 => return 바깥쪽에 조건문을 만들고 결과값을 출력하는 형태로 구성해야 */}
      {result}
    </div>
    <div>
      Haloo React!! {msg}
    </div>
    </>
  );
}

export default App;
