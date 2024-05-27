import { createContext } from "react";


/*
 1.Context
  - React 컴포넌트 간에 state를 공유할 수 있게 도와주는 기능
 2.Context 사용 방법 
  - 최상위 컴포넌트에서 공통적으로 사용할 state를 정의
    ㄴ context.provider의 value 속성에 설정

  - 하위 컴포넌트에는 useContext(Context정보)로 state, 함수를 접근할 수 있다.
    => props로 매번 state를 전달할 필요가 없다.

*/

export const ThemeContext = createContext(null);
