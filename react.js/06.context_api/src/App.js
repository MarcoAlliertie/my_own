import { useState } from 'react';
import './App.css';
import { ThemeContext } from './context/ThemeContext';
import Page from './page/Page'
function App() {


  //각 컴포넌트에서 공통적으로 사용하는 state를 정의
  const [isDark,setIsDark] = useState(false);
  const [user,setUser] = useState('Justin');
  return (
    <ThemeContext.Provider value = {{isDark,setIsDark,user,setUser}}>
      <Page/>
    </ThemeContext.Provider>
  );
}

export default App;
