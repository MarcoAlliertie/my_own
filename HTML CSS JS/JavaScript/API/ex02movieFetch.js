let date = prompt('날짜를 입력하세요','YYYYMMDD')
let movieUrl = `http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=${date}`;
document.querySelector('button')
.addEventListener('click',()=>{
    console.log('fetch click');
    fetch(movieUrl)
    .then((res)=>{return res.json()})
    .then((data) =>{
        //성공
        
        console.log(data);
        console.log(data.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
        let movieList = data.boxOfficeResult.dailyBoxOfficeList;
        let table = `
        <table>
        <tr>
        <th>순위</th>
        <th>영화제목</th>
        <th>개봉일</th>
        </tr>
        `
        movieList.forEach(item =>{
            table +=
          `
        <tr>
        <td>${item.rank}</td>
        <td>${item.movieNm}</td>
        <td>${item.openDt}</td>
        </tr>`
    })
        table+=
        `</table>`
        document.querySelector('div').innerHTML = table;
        

    })
    .catch(error=>console.log(error));
})