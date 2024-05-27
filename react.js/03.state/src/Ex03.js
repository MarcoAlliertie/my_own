import Board from "./components/Board";
import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import Button from "react-bootstrap/Button";
import React, { useState } from "react";

//여러 이미지를 접근해야 할 경우 public폴더 내 img 폴더 생성
//경로는 '/img/파일명.확장자'로 접근

/*
실습 3) 주사위 게임 페이지 구현
1. 사용자가 "던지기" 버튼을 누른다.
2. 주사위 눈이 랜덤으로 출력된다.
3. 사용자와 컴퓨터의 주사위 눈을 비교한다.
    -무승부 : alert("무승부!")
    -사용자 또는 컴퓨터가 이긴 경우 : 각각 점수+1
4. 초기화 버튼을 누르면 모든 내용을 초기화한다.

[만들어야 할 state]
1. 점수, 이미지경로, 주사위눈 => 사용자, 컴퓨터

[만들어야 할 컴포넌트]
- Board.js
*/

const Ex03 = () => {
  const [user, setUser] = useState({
    score: 0,
    diceNum: 0,
    imgSrc: "/img/dice1.png",
  });
  const [computer, setComputer] = useState({
    score: 0,
    diceNum: 0,
    imgSrc: "/img/dice1.png",
  });

  //주사위 던지기 함수
  const throwDice = () => {
    let userDiceNum = parseInt(Math.random() * 6) + 1;
    let comDiceNum = parseInt(Math.random() * 6) + 1;
    let userScore = user.score;
    let comScore = computer.score;
    if (userDiceNum === comDiceNum) {
      alert("무승부!");
    } else if (userDiceNum > comDiceNum) {
      userScore += 1;
    } else {
      comScore += 1;
    }
    //사용자, 컴퓨터 state값 변경
    //객체로 된 값을 변경할 때 전개연산자를 이용해서 변경한다.
    //...을 이용해서 위에 입력한 값과 동일한 값 입력 가능
    //...즉 밑의 setUser, setComputer에서 최초 값은 위에 const한 때의 값과 동일
    setUser({
      ...user,
      score: userScore,
      diceNum: userDiceNum,
      imgSrc: `/img/dice${userDiceNum}.png`,
    });
    setComputer({
      ...computer,
      score: comScore,
      diceNum: comDiceNum,
      imgSrc: `/img/dice${comDiceNum}.png`,
    });
  };
  console.log(user);
  return (
    <div className="container">
      <h1>주사위 게임</h1>
      <div className="button-area">
        <Button variant="secondary" onClick={throwDice}>
          던지기
        </Button>{" "}
        <Button variant="danger">초기화</Button>{" "}
      </div>
      <div className="board-area">
      {/* <div>
          <h4>나</h4>
          <img src={user.imgSrc} />
          <div>
            <h4>현재 점수</h4>
            <h4>{user.score}점</h4>
          </div>
        </div>
        <div>
          <h4>컴퓨터</h4>
          <img src={computer.imgSrc} />
          <div>
            <h4>현재 점수</h4>
            <h4>{computer.score}점</h4>
          </div>
        </div> => board.js에 넘겨줌*/}               
        <Board name="나" imgSrc={user.imgSrc} score={user.score} />
        <Board name="컴퓨터" imgSrc={computer.imgSrc} score={computer.score} />
      </div>
    </div>
  );
};

export default Ex03;
