# Push & Pull 워크 플로우

> 다른 사람과 협업할 때 활용하는 시나리오



### (1) `git push`

> github에 파일을 업로드하기 위해 사용하는 명령어

```bash
$ git push origin master
```

- 여기서, origin은 원격 저장소 이름이다.
- master는 현재 사용하는 컴퓨터의 브랜치 이름이다.



### (2) `git pull`

> github에 있는 파일을 해당 컴퓨터에 가져오기 위해 사용하는 명령어

```bash
$ git pull origin master
```

- 주의할 점: pull을 하기 전에 `git status` 를 통해 깔끔한 상태인지 확인한다. (성급하게 pull 하지 말 것 !!)



##### # 참고1) git clone

- 맨 처음에만 사용한다. 
- 그 다음 구조가 만들어지면 `git pull` 을 사용한다.

##### # 참고2) touch

- 파일을 생성하는 커맨드

##### # 참고3) git diff
 - 변화 사항을 볼 수 있다.

##### # 참고4) cat

- 내용물을 볼 수 있다.