import React from 'react'
import './App.css'
import { ColorContext } from './context/ColorContext'
import ColorList from './components/ColorList'
import ColorResult from './components/ColorResult'
import { useState } from 'react'


const Ex01 = () => {
  const [color,setColor] = useState('black');
  
  return (
    <div>
        <ColorContext.Provider value = {{color,setColor}}>
        <ColorList/>
        <br/><br/>
        <hr></hr>
        <br/><br/>
        <ColorResult/>
        </ColorContext.Provider>
    </div>
  )
}

export default Ex01