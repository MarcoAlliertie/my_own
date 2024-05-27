const increase = (number, callback) => {
    setTimeout(()=>{
        const result = number +10;
        if(callback){
            callback(result)
        }
    },1000)
}

//1초 뒤에 10을 반환
increase(0,(result)=>{
    console.log(result); //10초 뒤 10
    increase(result, (result)=> {
        console.log(result);//10초 뒤 20
        increase(result,(result)=>{
            console.log(result);//30
            increase(result,(result)=>{
                console.log(result);//40
                increase(result,(result)=>{
                    console.log(result);//50
                    increase(result,(result)=>{
                        console.log(result);//60
                        increase(result,(result)=>{
                            console.log(result);//70
                            increase(result,(result)=>{
                                console.log(result);//80
                                increase(result,(result)=>{
                                    console.log(result);//90
                                    increase(result,(result)=>{
                                        console.log(result); //100
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    })
})

//너무 보기 복잡! promise가 나온 이유