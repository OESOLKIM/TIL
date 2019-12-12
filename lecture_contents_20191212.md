1) html, css 관련 내용



2) 가상환경

가상환경 만드는 명령어:

'python -m venv 가상환경 이름(오늘은 venv로 설정)'



가상환경으로 들어가는 명령어:

source venv/Scripts/activate



가상환경에서 나오려면:

deactivate 명령어 사용



가상환경으로 들어가고 나오는걸 빨리 하기 위해서

#vi ~/.bashrc 입력하고

#i를 통해 끼워넣기 상태로 바꾸고, alias['가명'이라는 뜻을 갖고 있음] activate="source venv/Scripts/activate" 입력하고 :wq하고 나온다.

#그 후 source ~/.bashrc를 입력하여 activate만 입력해도 가상환경으로 들어갈 수 있도록 설정한다.



깃허브에 push하는 목록에서 뺄 때 봐야하는 사이트

'gitignore.io'



거기에 검색한 후 ctrl+a해서 복사하고

vi .gitignore로 들어가서 shift + insert한 후 :wq하고 나간다.

그 후 ls -a를 입력하여 .gitignore가 있는지 확인한다.



가상환경에서 pip freeze > requirements.txt

(깔려있는 패키지 list를 txt로 보여준다.)



pip install -r requirements.txt

(requirements.txt에 있는 패키지를 설치하기 위해 사용하는 명령어) [협업할 때 용이함]



Flask: 웹 서버를 구축하는데 쓰이는 프레임워크

변경사항 자동 저장: 





http://artii.herokuapp.com/make?text=키워드



