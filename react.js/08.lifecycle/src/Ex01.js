import React, { useEffect, useState } from 'react'
import axios from 'axios' //axios는 자동완성 안 되므로 직접 써주자
//fetch와 비슷하지만 비동기통신에선 axios를 더 많이 쓴다
//이것도 fetch와 마찬가지로 이어서 이어서 쓰는 거지만 async await으로 간단하게 할 수 있다.

const Ex01 = () => {

    const [weather, setWeather] = useState(null)

    //현재 위치정보(위,경도)를 가져올 수 있는 함수. 브라우저 객체(BOM)이므로 import 안 해도 쓸 수 있다.
    const getCurrentLocation = () => {
        navigator.geolocation.getCurrentPosition((position)=>{
            // console.log(position);

            let lat = position.coords.latitude;
            let lon = position.coords.longitude;
            getCurrentWeather(lat,lon);

        }) 
    }

    //현재 위치의 날씨 정보를 가져오는 함수
    const getCurrentWeather = async(lat, lon) =>{
        const API_KEY='36bbebdbaa3dbbc1d8c6b3d5277ee3ab';
        let weather_url =`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
        let response = await axios.get(weather_url);
        console.log(response.data);
        setWeather(response.data);
    }

    useEffect(() =>{
        //위치 정보 받아오기
        console.log(getCurrentLocation());

    },[])
  return (
    <div>
        <h1>2024.02.14</h1>
        <div>
            <img src={`https://openweathermap.org/img/wn/${weather?.weather[0].icon}@2x.png`}/>
        </div>
        <div> 
            {/* 비동기통신이므로 값을 당장 못 읽어와서 오류 남. 이럴 때는 조건을 걸어줘서 값이 있을 때만 렌더링하도록 설정 잡아주자 */}
            {/* 현재 {weather && weather.name}은 {weather && weather.main.temp}℃ 입니다. */} 
            현재 {weather?.name}은 {weather?.main.temp}℃ 입니다. 
        </div>
    </div>
  )
}

export default Ex01