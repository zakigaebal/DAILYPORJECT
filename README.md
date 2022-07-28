# read.me

# 주제 : 
OCR을 활용한 영수증데이터 차트시각화 웹서비스

## 1. 서비스 목표 : 영수증 업로드, 차트 달력 시각화 조회

## 2. 데이터 범주 설정

사용자정보 : 사용자 아이디, 사용자 이름, 사용자 비밀번호

영수증 정보 : 상호, 날짜, 금액, 시간, 사용자 아이디

자산 정보 : 사용자아이디, 자산금액, 지출목표금액

## 3. 개발환경

- html, css, js
- jsp, servlet
- python
- oracle
- java
- flask
- tomcat server
- aparche echrat

# 화면구성

- 메인페이지
- 영수증페이지
- 차트페이지
- 달력페이지

# 기능설명

## 메인페이지

- 사용자는 로그인과 회원가입을 할수있다
- 회원가입을 할경우 사용자 아이디와 비밀번호, 이름을 입력하면 데이터에 저장이 된다
- 로그인하지 않는 사용자는 서비스소개 페이지에만 접근 가능하다
- 로그인한 사용자는 영수증업로드, 차트시각화페이지, 자기의 영수증데이터를 달력으로 볼수 있다.
- 로그인을 실패할경우 로그인을 다시 할수 있게 한다
- 로그인한 사용자는 세션으로 데이터가 저장이 된다

## 영수증업로드

(메인페이지)톰캣 → 플라스크(업로드페이지) → 톰캣(차트페이지)

영수증업로드

- 결제수단, 영수증업로드등록, 카테고리, 메모 입력후 업로드 버튼 클릭시
- 테서렉트  OCR 프로그램이 구동하며 이미지 텍스트 데이터를 메모장 형식으로 파일을 세이브합니다.
- 이 텍스트 안에있는 날짜, 금액에 해당하는 정규식을 이용하여 데이터를  추출하고
- 상호명 등 의 텍스트 발견시 해당라인 데이터를 전부추출후 전처리 과정을 통해 테이터를 추출한다
- 카테고리, 결제수단, 메모, 사용자 아이디와 추출한 데이터를 하나의 리스트로 저장하여
- 오라클 데이터 베이스에 저장한다.
- flask서버에 있는 데이터를 데이터베이스에 저장하고  영수증 데이터를 보여줄 tomcat서버에 들어간다

- 영수증을 업로드하면 텍스트를 전처리과정을 통해 원하는 데이터로 뽑힌다.
- 원하는 스마트영수증을 가지고와서 자기만의 카테고리설정과 간단한 메모를 할 수 있다
- 영수증페이지에서 업로드를 누르면 OCR을 적용하여 데이터를 처리하고 flask서버로 들어간다.

## 차트 페이지

- 아파치 이차트에서 일별, 주별, 월별 데이터를 잘 보여줄 수 있는 차트를 선택한다.
- 아파치 홈페이지에서 제공하는 코드를 복사해온다.
- 이클립스에서 데이터베이스에 저장된 영수증데이터를 일별, 주별, 월별 데이터로 뽑아 온다.
- 날짜에 맞게 데이터를 삽입하여 차트로 시각화된 데이터를 사용자에게 보여준다.

## 달력 페이지

- 데이터베이스에 카테고리별로 저장된 일별 지출 정보를 총합해서 가져온다.
- 날짜에 맞게 데이터를 삽입하고 달력으로 시각화해준다.

****기간 : 14.07.10 - 17.09.09****

# 담당

![image](https://user-images.githubusercontent.com/86054791/181439456-98f5a52a-137f-4c3f-964e-3d0ebf96dca3.png)


# 웹페이지 구현

- ui/ux적 디자인구성
    - 모바일환경도 고려해서 영수증페이지의 컨텐츠들을 ui측면으로 제작
    - 모든페이지에서 사용자가 다시 메인페이지에 갈수 있도록 로고를 클릭하면  메인페이지로 돌아갈수있다
    - 톤앤매너를 주황색으로 지정했으며 모든페이지를 톤앤매너 맞출려고 한다
- html을 활용한 페이지 레이아웃 구현
    - 메인페이지, 영수증페이지, 로그인페이지, 회원가입페이지, 차트페이지
- CSS, Bootstrap을 활용한 페이지 구현
    - 메인페이지, 영수증페이지, 로그인페이지, 회원가입페이지, 차트페이지
- JS를 활용한 동적 페이지 구현
    - 메인페이지, 영수증페이지, 로그인페이지, 회원가입페이지, 차트페이지
- 로그인한후 세션아이디를 메인페이지에 구현




# 📌프로젝트 개요

- 프로젝트 명 : Daily
- 개발 인원 : 3명
- 수행 기간 :  2021.07.11 - 2022.07.22

# 💪프로젝트 목표

- ocr을 활용한 영수증데이터 확보후 aprche echart 시각화

# ⛑개발 환경 및 언어

- Java
- Javascript
- html
- css
- oracle

# 🔖주요 구현 기능

- ocr
- echart

# 🙋‍♀️담당 역할

## 프로젝트 기획 파트

- 데이터 베이스 설계
- ERD 작성

## 회원가입 파트

- 회원가입 기획/프론트/백엔드 구현

## 영수증 업로드 파트

- 업로드 페이지 기획

# 🛠오류 발생 및 해결 내역
![image](https://user-images.githubusercontent.com/86054791/181439855-081a99ee-d0ef-4245-8c71-5aecfade7ce0.png)
![image](https://user-images.githubusercontent.com/86054791/181439886-d6c3c411-be7b-4d4b-b654-974a4578d9cf.png)
![image](https://user-images.githubusercontent.com/86054791/181439929-0e29ef39-e918-4bb7-9cf3-b7d987c6a159.png)




# ✍️프로젝트 소감 및 향후 발전 방향

<aside>
💡 티끌을 모아도 티끌이지만 더 커다란 먼지는 될 수 있다!

</aside>

<aside>
💡 멘탈과 자존감만 있다면 어떤 코딩도 해낼 수 있다!

</aside>

- 이번 프로젝트는 앞으로 배울 것은 무궁무진하고 내 지식은 정말 자그마하다는 것을 계속해서 깨닳아가는 과정이었습니다.
- 그와 동시에, 이렇게 배울 것이 많기 때문에 앞으로 꾸준히 공부한다면 발전할 가능성도 무궁무진 하다는 설레임을 느끼게 해주었습니다.
- 개발자는 함께하는 팀원과의 소통도 중요하지만, 나 자신과의 끊임없는 소통도 정말 중요한 직업이라는 것을 깨닳았습니다.
- 개발자를 업으로 삼는 모든 시간동안 부딪혀야하는 지식의 산은 수도 없을 텐데, 그 과정동안 좌절하지 않고 계속해서 스스로에게 질문하고 복돋아주는 방법을 찾을 수 있었습니다.

![Untitled](read%20me%20b16650e008174a53bf27930f8b94114d/Untitled%205.png)

# 📇아쉬운 점

```java
- Git 협업을 제대로 진행해보지 못한 것
- Aws 로 웹서비스 연결을 해보지 못한 것 입니다.
- Maven 형태로 작업하지 않은것입니다.
```

때문에 이후 개인적으로  aws 를 이용해 게시판을 구현하고자 합니다.


플라스크 코드는 [f]를 참조하시면 됩니다.  
[f]: https://github.com/yongseong-kim9/pyweb

