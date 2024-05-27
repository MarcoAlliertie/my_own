import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App2';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  // <React.StrictMode>  점검 차 두 번 실행시킴. 이거 때문에 function 안에 작성한 구문은 두 번 실행됨. 이거 주석처리하면 한 번만 실행.
    <App />
  // </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
