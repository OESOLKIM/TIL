# 2019_12_11 강의 내용 정리



### 코드 관리의 목적

1. 문제 상황 해결 
2. 이력(버전) 관리



####  (1) `git rm --cached`

> `git add` 명령어를 실행한 후 staging area에서 일부를 빼고 싶을 때 사용하는 명령어



#### `(2) git commit --amend`

> - `git commit` 명령어를 실행했는데 메시지를 잘못 입력해서 수정하고 싶을 때 사용하는 명령어
> - **i** **(끼워넣기)** 누르고 수정 -> 그 후 'esc' 누르고 '**:wq**'  입력하면 저장하고 창에서 나간다.



#### `(3) git reset --hard 마지막 commit 된 숫자`

> 마지막 commit 으로 되돌릴 때 사용하는 명령어



#### (4) `git checkout`

> 특정 파일을 빼내기 위해 사용하는 명령어

- git checkout 브랜치 이름 : 브랜치를 이동할 때 사용하는 명령어

  (ex. 'git checkout master' 명령어를 입력하면 다시 원래대로 돌아옴)

- git checkout -b 새로운 브랜치 이름 : 새로운 브랜치를 만들고 그 브랜치로 이동할 때 사용하는 명령어

  ('git branch 새로운 브랜치' && 'git checkout 새로운 브랜치' 한 번에 하기)



#### (5) `git branch`

> 가지를 확인할 때 사용하는 명령어

- git branch 새로운 브랜치 이름 : 새로운 브랜치를 만들 때 사용하는 명령어
- git branch -d 브랜치 이름 (브랜치가 비어있는 경우에 사용)
- git branch -D 브랜치 이름 (브랜치에 무언가 있는 경우에 사용)



#### `(6) git merge`

> 브랜치끼리 합치기 위해 사용하는 명령어

- 브랜치를 merging 하고 지울 것인지 git bash에서 물어본다.
- git merge 합칠 브랜치
- git log --oneline --graph를 통해 merging 과정을 그래프로 한 눈에 볼 수 있다.
- merge 시나리오

1. fast-forward merge 
2. auto merge (다른 파일을 작업했을 때 (= 충돌되는 이력이 없을 때 ) git이 자동으로 merge 해주는 것)
3. merge 시 conflict 발생 (같은 파일을 작업했을 때)



## requests, BeautifulSoup 이용한 웹 스크래핑

- 'pip install 패키지 이름' 을 통해 설치하고 싶은 패키지를 설치한다.

  (이를 통해 requests, bs4 설치)

- pip list 명령어를 입력하여 설치된 패키지를 확인한다.

- get 또는 post 명령어를 통해 html 파일을 가져온다.

- BeautifulSoup 라이브러리를 통해 가져온 html 파일을 parsing 한다.

- 가져온 css selector 태그를 select한다.

