2019_12_12 강의 내용 정리



### 가상환경 구축

- 'python -m venv 가상환경 이름 (오늘은 venv로 설정)' : 가상환경 만드는 명령어
- 'source venv/Scripts/activate' : 가상환경으로 들어가기 위해 사용하는 명령어
- 'deactivate' : 가상환경에서 나올 때 사용하는 명령어
- 가상환경으로 들어가고 나오는 것을 빨리 하기 위한 절차
  1. vi ~/.bashrc 입력
  2. i를 입력하여 끼워넣기 상태로 바꾸고, ' alias activate="source venv/Scripts/activate" ' 라고 입력, 그리고 ' :wq '를 입력한 후 나온다.
  3. source ~/.bashrc를 입력하여 activate만 입력해도 가상환경으로 들어갈 수 있도록 설정한다. 



### 'gitignore.io'

> Github에 push 할 목록에서 뺄 때 봐야 하는 사이트

- 활용 절차
  1. 이 사이트에서 해당 내용을 검색한 후 전부 복사한다.
  2. vi.gitignore로 들어가서 shift + insert 한 후 :wq 하고 나간다.
  3. ls-a 를 입력하여 .gitignore가 있는지 확인한다.



#### 참고1) (가상환경에서 )'pip freeze > requirements.txt'

> 깔려있는 패키지 list를 txt로 보여준다.




#### 참고2) 'pip install -r requirements.txt'

> requirements.txt에 있는 패키지를 설치하기 위해 사용하는 명령어 [협업할 때 용이하다]



### Flask 란?

> 웹 서버를 구축하는데 쓰이는 framework

- ' app.py ' 파일을 만들고 그 안에서 quickstart 를 해 본다. 구체적 소스는 다음과 같다.

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

- 템플릿을 추가하기 위해서 ' render_template ' 라이브러리를 사용한다.
- ' templates ' 폴더를 만들어 해당 html 파일을 저장한다.
- `http://127.0.0.1:5000/` 에 접속하여 Flask 서버가 정상적으로 구동되는지 확인한다.