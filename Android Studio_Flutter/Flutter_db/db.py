import pymysql
from flask import Blueprint, request
import json

#Blueprint를 통해 해당 파일의 이름 지정
member = Blueprint("member", __name__, template_folder="templates")
#member - 지정해준 파일 이름 

@member.route('/')
def test():
    return 'Hello world'


@member.route('/join')
def join():
    #1. db연결 
    db = pymysql.connect(host='localhost',user='root',password='1234', db='flutter_db', charset='utf8')

    if(db):
        print("succeess")
    else:
        print("fail")

    #id, pw, age, name 데이터를 받겠습니다!
    # 받는 쪽에서 데이터 타입 수정 -- age 타입을 flutter 쪽에서 int로 보냈어도 String으로 받게 됩니다!
    id = request.args.get('id')
    pw = request.args.get('pw')
    age = int(request.args.get('age'))
    name = request.args.get('name')

    #2. 데이터 접근 --> cursor객체 사용! 
    # connect이후 변수명(db) 안에 데이터 접근 할 수있는 cursor 객체가 존재 
    cursor =  db.cursor()

    #3. sql문 작성 
    #pymysql 포매팅 방식 %(변수명)s
    sql = 'insert into member values(%(id)s , %(pw)s, %(age)s, %(name)s)'

    #4. sql 실행  --> cursor 안에 execute()함수 사용!
    # execute(sql문장, dic구조 )
    # ㄴ dic구조는 생략 가능 --> 포매팅 했을 때만 필요
    # {'id':id ,~~}

    cursor.execute(sql, {'id':id, 'pw':pw, 'age':age, 'name':name})
    
    #4.5 정상으로 실행 되었는 확인 rowcount -insert, delete, update문 성공한 줄의 개수를 return 
    #cursor 안에 존재
    row = cursor.rowcount
   
    #5. commit
    db.commit()

    #6.db 닫아주기
    db.close()

    if row >0 :
        return "success"
    else:
        return "fail"


@member.route('/update')
def update():
    #값 받기
    id = request.args.get('id')
    pw = request.args.get('pw')
    name = request.args.get('name')
    #age - db상 int, 받아주는쪽에서 형 변환
    age = int(request.args.get('age'))

    #1. db 연결
    db = pymysql.connect(host='localhost',user='root',password='1234', db='flutter_db',charset='utf8')
    
    #2. 데이터 접근 객체 cursor -connect가 완료된 db 변수 안에
    cursor = db.cursor()    

    #3. sql 문 작성
    sql = 'update member set pw = %(pw)s,age = %(age)s, name = %(name)s where id = %(id)s'

    #4. sql 실행
    cursor.execute(sql, {"id":id,"pw":pw,"name":name,"age":age})

    #.4.5 rowcount 받기
    row = cursor.rowcount

    #5. commit & close
    db.commit()
    db.close()

    if row>0:
        return "success"
    else:
        return "fail"

@member.route("/login")
def login():
    #1.db 접속
    db = pymysql.connect(host='localhost', user = 'root', password='1234',db='flutter_db',charset='utf8')

    #2.데이터 접근
    cursor = db.cursor()

    #받은 데이터 변수 초기화
    id = request.args.get('id')
    pw = request.args.get('pw')

    #3.sql문 작성
    sql = "select * from member where id = %(id)s and pw = %(pw)s"

    #4. sql문 실행-- cursor
    cursor.execute(sql, {'id':id, 'pw':pw})

    #5. 값 받아주기 - fetchall(), fetchone(), fetchmany()
    #fetchall() - 모든 행 데이터 가지고 오기
    #fetchone() - 하나의 행만 가져오기
    #fetchmany(정수 n) - n개의 데이터 가져오기

    result = cursor.fetchall()
    # 튜플로 변환

    #튜플로 온 데이터를 -> Json으로 변환
    # --> json으로 변환하여 return 한후 플러터 쪽에서 파싱
    #json import

    #k-v
    # k : 컬럼명
    # v: select를 기반으로 가지고온 데이터

    #cursor.description 필드가 존재 
    # DB의 정보들을 가지고 옴!
    # name, type_code, display size, null_ok...
    # list형식 
    # 데이터의 컬럼명 - name 
    print(result)
    row_headers=[x[0] for x in cursor.description]

    print(row_headers)

    # k - row_headers v - result
    
    #새로운 list 생성
    json_data = [] #json으로 변환 될 데이터 
    #json_data에 들어갈 데이터 타입은 dict구조 
    #데이터가 여러개일 수 있으니까

    #zip()메소드 존재
    #zip(k가 될 변수, v가 될 변수)
    for rv in result:
        json_data.append(dict(zip(row_headers,rv)))

    #json.dumps() : list(안의 dict) -> json타입으로 변환 
    data = json.dumps(json_data)


    #db commit
    db.commit()
    #db close
    db.close()

    #return타입은 String이거나 Json형식으로 리턴이 되어야 함

    return data



# import pymysql
# from flask import Blueprint, request

# #Blueprint를 통해 해당 파일의 이름 지정
# member = Blueprint("member", __name__, template_folder="templates")
# #member - 지정해준 파일 이름 

# @member.route('/')
# def test():
#     return 'Hello World!'

# @member.route('/login')
# def login():
#     #1. db 연결
#     db = pymysql.connect(
#         host='localhost',
#         user ='root',
#         password='1234',
#         db = 'flutter_db',
#         charset='utf8'
#     )
#     if (db):
#         print("success")
#     else:
#         print('fail')

#         #id, pw, age, name 데이터를 받겠습니다!
    
#     id = request.args.get('id')
#     pw = request.args.get('pw')
#     age = request.args.get('age')
#     name = request.args.get('name')

#     #2. db 접근 ---> cursor객체 사용
#     #connect 이후 변수명(db) 안에 데이터 접근할 수 있는 cursor 객체가 존재
#     cursor= db.cursor()

#     #3. sql문 작성 
#     #pymysql 포매팅 방식 - %(변수명)s
#     sql = 'insert into values(%(id)s,%(pw)s,%(age)s,%(name)s)'

#     #4. sql문 실행 --> cursor 안에 execute()함수 사용!
#     #execute(sql문장, dic구조)
#     #ㄴdic구조는 생략 가능 --> 포매팅 했을 때만 필요
#     #{'id':id,~} : sql문 내의 변수명이 키 값, request.args.get으로 받아온 값이 밸류값
#     cursor.execute(sql, {'id':id,'pw':pw,'age':age,'name':name})

#     #4.5 정상으로 실행되었는지 확인 rowcount -insert, delete, update문 성공한 줄의 개수를 return
#     #cursor 안에 있음
#     row = cursor.rowcount #얘는 함수가 아니라 필드다.

#     #5. commit
#     db.commit()

#     #6. db 닫아주기
#     db.close()

#     if row>0 :
#         return 'success'
#     else:
#         return 'fail'