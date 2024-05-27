import React from 'react'

const BaseCard = ({team,player}) => {
    let bb_style = {
        border:"2px black solid",
        margin:"10px",
        textAlign:"center",
    }
  return (
    <div style={bb_style}>
    <h3>{team}</h3>
    <p>{player}</p>
    </div>
  )
}

export default BaseCard