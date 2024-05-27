// import React, { useState } from 'react'
// import Content from '../components/Content'
// import Header from '../components/Header'
// import Footer from '../components/Footer'

// const Page = () => {

//     // const [isDark, setIsDark] = useState(false);

//   return (
//     <div className='page'>
//         <Header mode={isDark}/>
//         <Content mode={isDark}/>
//         <Footer setIsDarks={setIsDark} mode={isDark}/> 
//         {/* 헤더, 컨텐트와는 달리 푸터에서는 버튼을 누르는 작용이 있으므로 함수를 넘겨준다 */}
//     </div>
//   )
// }


// export default Page


////////////////////////////////////////////////////////

import React from 'react'
import Content from '../components/Content'
import Header from '../components/Header'
import Footer from '../components/Footer'

const Page = () => {

    // const [isDark, setIsDark] = useState(false);

  return (
    <div className='page'>
        <Header />
        <Content />
        <Footer/> 
    </div>
  )
}

export default Page