const http = require('http');
const fs = require('fs').promises;
const url = require('url');
const qs = require('querystring');

http.createServer(async(req, res)=>{
    const file = await fs.readFile('./practice.html');
    let body = '';
    req.on('data',(data)=>{
        body+=data;
    })
    req.on('end',()=>{
        let parseQs = qs.parse(body);
        
    })
}).listen(8000,()=>{
    console.log('Server is listening on port 8000');
})