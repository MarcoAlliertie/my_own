from flask import Flask, Blueprint, request
from werkzeug.utils import secure_filename #파일명 보안
import os #경로명 설정의 편의

imgFile = Blueprint('imgFile',__name__, template_folder='templates')

@imgFile.route('/test')
def test():
    return 'hello'

#POST로 보내고 있으므로 Methods = ['POST']를 써 주어야 함
#'GET'은 안 써줘도 되지만 그냥...
@imgFile.route('/oneUpload',methods =['GET','POST'])
def oneUpload():

    #form 태그로 보내고 있는 중
    #form 바탕으로 받아주기
    #request.form.get('K값')
    name = request.form.get('name')

    #file 받는 법
    #request.files['k값'] -> form에 담겨있든 말든 file
    f = request.files['image']
    file_name = secure_filename(f.filename)

    #서버에 이미지가 저장될 폴더 - static

    # 파일 저장 : 파일명.save
    f.save(os.path.join('static',file_name))

    return ''