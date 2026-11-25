# Mission 01 학습 기록

[README로 돌아가기](README.md)

## 목차
- [설계 결정](#설계-결정)
- [핵심 코드 해설](#핵심-코드-해설)
- [수행 로그](#수행-로그)
- [시행착오](#시행착오)
- [배운 점](#배운-점)
- [용어 사전](#용어-사전)

## 설계 결정

### 1. 작업 환경은 WSL2(Ubuntu) + Docker Desktop
- 맥락: 내 PC는 Windows다. 명세는 리눅스 터미널로 실습하라고 하고, 명세의 OrbStack 안내는 서울캠퍼스(Mac)용이다.
- 결정: Windows 안에서 리눅스(Ubuntu)를 돌리는 WSL2를 쓰고, Docker Desktop을 WSL 2 백엔드로 연결했다 (사용자 단위 설치, Ubuntu WSL integration 켬).
- 결과: 얻은 것: 명세 예시와 같은 Ubuntu bash에서 실습할 수 있다. / 포기한 것: 설치 단계가 늘고, Windows와 Ubuntu 두 환경을 구분해야 한다.

### 2. 편집기는 VSCode 대신 Cursor
- 맥락: 명세는 VSCode에서 GitHub 로그인·저장소 연동 증거를 요구한다. 나는 평소 Cursor를 쓴다.
- 결정: Cursor로 연동 증거를 남긴다. Cursor는 VSCode를 바탕으로 만든 편집기라 GitHub 로그인·저장소 연동 기능이 같다.
- 결과: 얻은 것: 익숙한 도구로 작업한다. / 포기한 것: 명세와 이름이 달라서 평가자에게 대체 이유를 설명해야 한다.

### 3. 브랜치는 main + 작업 브랜치 mission01
- 맥락: 명세에 브랜치 규칙이 없다.
- 결정: 첫 커밋만 `main`에 하고, 이후 작업은 `mission01` 브랜치에서 한다. 끝나면 `main`에 합친다.
- 결과: 얻은 것: `main`에는 늘 완성된 상태만 남는다. / 포기한 것: 합치기 단계가 하나 더 생긴다.

### 4. Git은 PowerShell, 실습은 Ubuntu bash
- 맥락: Git 사용자 정보(이름, noreply 이메일, 기본 브랜치)가 Windows 쪽에 이미 설정돼 있고, Mission 03에서 PowerShell로 커밋해 봤다. 명세 예시는 Ubuntu bash다. Windows와 Ubuntu는 Git 설정을 따로 가진다.
- 결정: git 명령(설정·커밋·push)은 PowerShell에서, 터미널·권한·Docker 실습은 Ubuntu bash에서 한다.
- 결과: 얻은 것: Git 설정을 다시 하지 않고 익숙한 방식으로 커밋한다. / 포기한 것: 두 터미널을 오가야 하고, README 실행 환경에 둘을 나눠 적어야 한다. Ubuntu에서 git을 쓰면 이름·이메일이 다르게 찍힐 수 있으니 git은 PowerShell에서만 쓴다.

### 5. 로그는 LEARNING.md, 스크린샷은 images/
- 맥락: README는 100줄 안에서 1~2분에 읽혀야 하는데, 명세가 요구하는 명령+출력은 양이 많다. 명세는 별도 파일도 README에서 링크로 갈 수 있으면 된다고 한다.
- 결정: 명령+출력은 이 파일 '수행 로그'에, 스크린샷은 `images/` 폴더에 두고, README에는 요약과 링크만 둔다.
- 결과: 얻은 것: README가 짧고 읽기 쉽다. / 포기한 것: 증거를 보려면 링크를 한 번 더 눌러야 한다.

### 6. GitHub에 빈 저장소를 만들고 clone
- 맥락: GitHub에서 README나 .gitignore를 함께 만들면, 내 PC에서 만든 파일과 기록이 어긋나 첫 push에서 충돌이 날 수 있다.
- 결정: 체크 항목 없이 Public 빈 저장소를 만들고, `git clone`으로 내 PC에 가져왔다.
- 결과: 얻은 것: GitHub 연결 정보(origin)가 자동으로 설정된다. / 포기한 것: clone할 때 '빈 저장소' 경고가 뜬다 (정상).

## 핵심 코드 해설

<details><summary>.gitignore — 저장소에 올리지 않을 파일 목록</summary>

```gitignore
CLAUDE.md          # 작업 기준 파일. 교육자료 내용이 들어 있어 공개하면 안 된다
*.pdf              # 모든 PDF (미션 명세 PDF가 실수로 들어와도 막는다)
Mission_*.md       # 미션 명세 md 변환본
.env               # 토큰·비밀번호를 담는 파일
id_*               # SSH 키 파일 (보너스 5에서 만든다. 개인키는 절대 공개 금지)
*.pem              # 인증서·키 파일
Thumbs.db          # Windows가 사진 미리보기용으로 자동으로 만드는 파일
desktop.ini        # Windows가 폴더 설정용으로 자동으로 만드는 파일
```
- 위 블록은 해설용으로 줄 끝에 설명을 붙였다. 실제 `.gitignore`는 같은 줄 뒤의 `#`을 설명으로 알아보지 못해서, 설명을 윗줄에 따로 적었다.
- `*`는 '아무 글자나'라는 뜻이다. `*.pdf`는 이름이 무엇이든 끝이 `.pdf`인 파일 전부다.
- 여기 적힌 파일은 `git add .`를 해도 커밋 대상에 들어가지 않는다.

</details>

Dockerfile·웹 서버 코드 해설은 U7부터 추가한다.

## 수행 로그

### U1 · 작업 환경 준비
- WSL2(Ubuntu)와 Docker Desktop(Docker 29.9.3)을 설치했다. `docker --version`·`docker info`의 명령+출력은 U5에서 기록한다.

### U2 · Git 설정·저장소 만들기
```
PS> git --version                          → git version 2.54.0.windows.1
PS> git config --global user.name          → Clay-pieup
PS> git config --global user.email         → (GitHub noreply 주소, 공개 저장소라 가림)
PS> git config --global init.defaultBranch → main
(GitHub에서 Public 빈 저장소 Codyssey_AIO_Mission_01 생성)
PS> git clone https://github.com/Clay-pieup/Codyssey_AIO_Mission_01.git
Cloning into 'Codyssey_AIO_Mission_01'...
warning: You appear to have cloned an empty repository.
PS> cd Codyssey_AIO_Mission_01
PS> git status
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

## 시행착오
문제가 생길 때마다 '문제 → 원인 가설 → 확인 → 해결/대안' 순서로 적는다. (명세 요구: 2건 이상)

## 배운 점
- U2: (단위가 끝나면 내 말로 정리)

### 과제 목표, 내 말로
1. **절대 경로와 상대 경로의 차이** (U3)
2. **파일 권한 r/w/x와 755·644** (U4)
3. **기존 Dockerfile로 커스텀 이미지 만들기** (U7)
4. **포트 매핑이 필요한 이유** (U8)
5. **Docker 볼륨(영속 데이터)** (U9)
6. **Git과 GitHub의 역할 차이** (U2)

## 용어 사전
| 용어 | 쉬운 풀이 |
|---|---|
| 터미널(CLI) | 마우스 대신 글자로 명령을 입력해 컴퓨터를 다루는 창 |
| WSL2 | Windows 안에서 리눅스(Ubuntu)를 함께 돌릴 수 있게 해 주는 기능 |
| Docker | 프로그램과 실행에 필요한 것들을 상자(컨테이너)에 담아, 어느 컴퓨터에서든 똑같이 실행하게 해 주는 도구 |
| Git | 내 컴퓨터 안에서 파일이 바뀐 기록을 저장해 두는 프로그램. 게임의 세이브 포인트와 같다 |
| GitHub | Git 기록을 인터넷에 올려 두고 다른 사람과 함께 보는 웹사이트 |
| 저장소(Repository) | 프로젝트 파일과 변경 기록을 함께 담은 상자. GitHub에 있으면 원격, 내 PC에 있으면 로컬 저장소 |
| Public | 로그인하지 않은 사람도 누구나 볼 수 있는 공개 상태 |
| clone | 원격 저장소를 통째로 내 PC에 복사해 오는 명령. 원본과 연결이 유지된다 |
| origin | clone한 원본 저장소(GitHub)를 부르는 별명 |
| 커밋(commit) | 지금 파일 상태를 기록으로 한 번 저장하는 것 |
| push | 내 PC에 쌓은 커밋을 GitHub으로 올려 보내는 명령 |
| `--global` | 이 컴퓨터의 모든 저장소에 똑같이 적용하라는 Git 설정 옵션 |
| 기본 브랜치 | 저장소를 처음 만들 때 생기는 큰길의 이름. 보통 `main` |
| `cd` | 다른 폴더로 들어가는 명령 (change directory) |
| `.gitignore` | 저장소에 올리지 않을 파일 목록을 적어 두는 파일 |
