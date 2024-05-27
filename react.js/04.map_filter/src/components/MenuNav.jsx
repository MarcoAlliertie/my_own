import React from 'react'
import Nav from 'react-bootstrap/Nav';

const MenuNav = ({whenClick}) => {
    let navItems = ['All', '커피', '디저트', '에이드', '베이커리'];
    return (
        <Nav>
            {navItems.map((item, index)=>(
                <Nav.Item key={index}>
                    <Nav.Link eventKey="disabled" onClick={whenClick}>{item}</Nav.Link>
                </Nav.Item>
            ))}
        
        </Nav>
    )
}

export default MenuNav