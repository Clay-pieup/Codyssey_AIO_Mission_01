# Mission 01 · 내 컴퓨터에 개발자용 '작업실' 꾸미기
> 한 줄 요약: 터미널·Docker·Git을 직접 설치하고 다뤄, 누가 실행해도 같은 결과가 나오는 개발 작업실(워크스테이션)을 만든 기록

> [!NOTE]
> 코디세이 AI 올인원 1기 · 1주차 · 상태: 진행 중

## 무엇을 했나
- 리눅스 터미널로 파일·폴더·권한을 다루고, Docker로 컨테이너를 실행·관리한다.
- 직접 쓴 Dockerfile로 웹 서버 이미지를 만들고, 포트 매핑·바인드 마운트·볼륨을 실행 결과로 검증한다.
- Git·GitHub로 작업 기록을 관리한다.
- 결과 화면: (U8에서 브라우저 접속 화면 추가)

## 실행 환경
| 항목 | 값 |
|---|---|
| OS | Windows + WSL2 Ubuntu (버전은 U10에서 기록) |
| 셸·터미널 | 실습: Ubuntu bash / Git: PowerShell (Cursor 터미널) → [이유](LEARNING.md#4-git은-powershell-실습은-ubuntu-bash) |
| Docker | Docker Desktop · Docker 29.9.3 (WSL 2 백엔드) |
| Git | 2.54.0.windows.1 |
| 편집기 | Cursor (VSCode 기반) → [이유](LEARNING.md#2-편집기는-vscode-대신-cursor) |

## 실행 방법
```powershell
git clone https://github.com/Clay-pieup/Codyssey_AIO_Mission_01.git
cd Codyssey_AIO_Mission_01
```
- Docker 실습을 따라 하는 명령은 단위마다 추가한다 (U5~U9).

## 체크리스트
**필수 (완료 5/13)**
| # | 항목 | 상태 | 증거·해설 |
|---|---|---|---|
| 1 | 공개 저장소 + README 기본 구성 | 🔶 진행중 | [수행 로그](LEARNING.md#u2--git-설정저장소-만들기) |
| 2 | 터미널 조작 로그 | ✅ 완료 | [수행 로그](LEARNING.md#u3--터미널-조작-로그) |
| 3 | 권한 실습 | ✅ 완료 | [수행 로그](LEARNING.md#u4--권한-실습) |
| 4 | Docker 설치·점검 | ✅ 완료 | [수행 로그](LEARNING.md#u5--docker-점검기본-운영-명령) |
| 5 | Docker 기본 운영 명령 | ✅ 완료 | [수행 로그](LEARNING.md#u5--docker-점검기본-운영-명령) |
| 6 | 컨테이너 실행 실습 (hello-world·ubuntu·attach/exec) | ✅ 완료 | [hello-world](LEARNING.md#u5--docker-점검기본-운영-명령) · [ubuntu·attach/exec](LEARNING.md#u6--ubuntu-컨테이너attachexec-관찰) |
| 7 | Dockerfile 커스텀 이미지 | ⬜ 대기 | — |
| 8 | 포트 매핑 접속 증거 | ⬜ 대기 | — |
| 9 | 바인드 마운트 반영 | ⬜ 대기 | — |
| 10 | 볼륨 영속성 | ⬜ 대기 | — |
| 11 | Git 설정 + GitHub·편집기 연동 | 🔶 진행중 | [수행 로그](LEARNING.md#u2--git-설정저장소-만들기) |
| 12 | 트러블슈팅 2건 이상 | 🔶 진행중 | [시행착오](LEARNING.md#시행착오) (5건, U10에서 최종 정리) |
| 13 | 보안·재현성 점검 | ⬜ 대기 | — |

**보너스 (완료 0/5)**
| # | 항목 | 상태 | 증거·해설 |
|---|---|---|---|
| 1 | Compose 기초 | ⬜ 대기 | — |
| 2 | Compose 멀티 컨테이너 | ⬜ 대기 | — |
| 3 | Compose 운영 명령어 | ⬜ 대기 | — |
| 4 | 환경 변수 활용 | ⬜ 대기 | — |
| 5 | GitHub SSH 키 | ⬜ 대기 | — |

## 진행 기록
### 2026-11-26 · 주중 세션
- U6 추가: ubuntu 컨테이너 진입(ls·echo·os-release), attach와 exec 차이 관찰(exit 뒤 Exited vs Up) · 변경: 필수 6 완료
- U5 추가: Docker 점검(--version·info), hello-world, 이미지 받기·목록, 컨테이너 실행·logs·stats·중지·목록, 트러블슈팅 4·5 · 변경: 필수 4·5 완료, 6 진행중 · 수정: WSL integration 켬

<details><summary>이전 기록</summary>

- 11-25 U4 추가: 권한 실습(파일 644→755, 폴더 755→700, 거부 확인 후 복구), 트러블슈팅 3 · 변경: 필수 3 완료
- 11-25 U3 추가: 터미널 조작 로그(위치·목록·이동·생성·복사·이름변경·삭제·내용 확인·빈 파일, 절대/상대 경로) · 변경: 필수 2 완료
- 11-25 U2 추가: Public 저장소, README·LEARNING·.gitignore 뼈대, 첫 커밋·push, `git config` 기록, 트러블슈팅 2건(설정 출처 확인 포함) · 변경: 필수 1·11·12 진행중, 브랜치는 main 하나로
- 11-15 U1 추가: WSL2 Ubuntu + Docker Desktop 설치, 편집기 Cursor로 결정 · 변경: 필수 4 진행중

</details>

## 더 보기
- [학습 기록](LEARNING.md) — 설계 결정 · 수행 로그(명령+출력) · 시행착오(트러블슈팅) · 배운 점 · 용어 사전
- 스크린샷: `images/` 폴더 (단위마다 추가)
- 발표 슬라이드: (필수 과제 완료 후 추가)
