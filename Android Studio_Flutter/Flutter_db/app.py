#flask 서버 구축

from flask import Flask, request, Blueprint
#Blueprint : 파일 관리를 위한 모듈
import pymysql

#from py파일명 import 변수명으로 Blueprint 연결
from db import member
from image_picker import imgFile

app = Flask(__name__)
app.register_blueprint(member,url_prefix = '/member')
app.register_blueprint(imgFile,url_prefix = '/imgFile')

@app.route('/')
def test():
    return 'Hello World'

@app.route('/test')
def test1():
    # 데이터를 받는 방법
    # flask 내부에 request
    # request.args.get(키값)
    req_id = request.args.get('id')
    return req_id


#db 연동 방법 : pymysql.connect(host,user,password,db스키마,charset)
@app.route('/db_test')
def db_test():
    db = pymysql.connect(host='localhost',user='root', 
                    password='1234',
                    db='flutter_db',
                    charset='utf8')

    if(db):
        return 'success'
    else:
        return 'fail'

if __name__ == '__main__':
    app.run('222.102.104.239',port=8005)