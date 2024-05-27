import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App2';
// import App2 from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  // <React.StrictMode>
    <App /> //App2를 실행할 거면 이렇게. App을 실행할 거면 이름 바꿔줘야.
  // </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
