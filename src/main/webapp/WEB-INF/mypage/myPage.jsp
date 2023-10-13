<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <link href="/css/myPageCSS/myPage.css" rel="stylesheet">
  <title>마이 페이지</title>

</head>
<body>
<jsp:include page="../header.jsp"/>

<div class="profile">
  <h3 class="display-5"> <%-- 프로필 --%>
    <a class="profile-link" href="/modify.member?action=modify&memberId=${loginInfo.memberId}">프로필 <input type="button" value="프로필 수정" class="button"></a>
  </h3>
  <form name="frmMypage" action="/modify.mypage?action=mypage" method="post">
    <div class="profileInfo">
      <label class="col-sm-2">아이디 ${loginInfo.memberId}</label>
      <label class="col-sm-2">이름 ${loginInfo.name}</label>
      <label class="col-sm-2">닉네임 ${loginInfo.nickName}</label>
      <label class="col-sm-2" id="zzim"><p>찜 &nbsp;</p>
        <i class="fa-solid fa-heart fa-1x heart"></i> &nbsp;<p>${loginInfo.zzimCnt}</p>
      </label>
    </div>
  </form>
</div>
<div class="tab-item">
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="mytab-link active" href="#tab1">내가 쓴 글</a>
    </li>
    <li class="nav-item">
      <a class="mytab-link" href="#tab2">내가 쓴 댓글</a>
    </li>
    <li class="nav-item">
      <a class="mytab-link" href="#tab3">내가 쓴 리뷰</a>
    </li>
    <li class="nav-item">
      <a class="mytab-link" href="#tab4">내가 찜한 영화</a>
    </li>
  </ul>

  <!-- Tab content for "내가 쓴 글" -->
  <div class="tab-content" id="tab1">
    <div class="myContent">
      <div class="button1">
        <!-- 기능 편의 버튼 -->
        <input type="button" class="btn-checkAll1" value="전체 선택">
        <input type="button" class="comment btn-removeAll1"  value="전체 삭제">
        <input type="button" class="comment btn-selected1"  value="선택 삭제">
      </div>
        <form name="frmRemoveSelected1" action="./get.board?action=get&contentNo=${boardDTO.contentNo}" method="post"> <!-- Adjust the action URL -->
          <ul class="list-group-1">
            <c:forEach var="boardDTO" items="${boardDTOList}" varStatus="status">
              <li>
                <div class="flex_my">
                <form action="#" >
                  <!--label태그는 체크박스를 누르지 않아도 연결된 체크박스를 체크해줌-->
                  <label for="chk${boardDTO.contentNo}">
                    <input type="checkbox" name="selectedItems1" class="button chkButton" value="${boardDTO.contentNo}" id="chk${boardDTO.contentNo}">
                    <i class="circle"></i>
                  </label>
                </form>
                    <a href="get.board?action=get&contentNo=${boardDTO.contentNo}" class="text-decoration-none" type="hidden">
                      <p class="myList" > ${boardDTO.title}
                          ${boardDTO.addDate}
                          ${boardDTO.nickName}
                          ${boardDTO.hit}
                        <a href="./remove.board?action=remove&contentNo=${boardDTO.contentNo}" onclick="return confirm('정말 삭제하시겠습니까?');"
                           class="remove-btn" style="font-size: 30px">X</a>
                      </p>
                    </a>
                </div>
              </li>
            </c:forEach>
          </ul>
        </form>
    </div>
  </div>

  <!-- Tab content for "내가 쓴 댓글" -->
  <div class="tab-content" id="tab2">
    <div class="myComment">
      <div class="button1">
        <!-- 기능 편의 버튼 -->
        <input type="button" class="btn-checkAll2"  value="전체 선택">
        <input type="button" class="comment btn-removeAll"  value="전체 삭제">
        <input type="button" class="comment btn-selected2" value="선택 삭제">
      </div>
        <form name="frmRemoveSelected2" action="./get.board?action=get&contentNo=${boardDTO.contentNo}" method="post"> <!-- Adjust the action URL -->
          <ul class="list-group-2">
            <c:forEach var="commentDTO" items="${commentDTOList}" varStatus="status">
              <li>
                <div class="flex_my">
                <form action="#" >
                  <!--label태그는 체크박스를 누르지 않아도 연결된 체크박스를 체크해줌-->
                  <label for="chk${commentDTO.commentNo}">
                    <input type="checkbox" name="selectedItems2" class="button chkButton" value="${commentDTO.commentNo}" id="chk${commentDTO.commentNo}">
                    <i class="circle"></i>
                  </label>
                </form>
                    <a href="get.board?action=get&contentNo=${commentDTO.contentNo}" class="text-decoration-none" >
                       <p class="myList"> ${commentDTO.commentNo}
                           ${commentDTO.addDate}
                           ${commentDTO.nickName}
                      <a href="./remove.board?action=remove&contentNo=${commentDTO.commentNo}" onclick="return confirm('정말 삭제하시겠습니까?');"
                         class="remove-btn" style="font-size: 30px">X</a>
                       </p>
                    </a>
                  </div>
              </li>
            </c:forEach>
          </ul>
        </form>
    </div>
  </div>

  <!-- Tab content for "내가 쓴 리뷰" -->
  <div class="tab-content" id="tab3">
    <div class="myReview">
      <div class="button1">
        <!-- 기능 편의 버튼 -->
        <input type="button" class="btn-checkAll3"  value="전체 선택">
        <input type="button" class="comment btn-removeAll" value="전체 삭제">
        <input type="button" class="btn-selected3"  value="선택 삭제">
      </div>
        <form name="frmRemoveSelected3" action="/view.movie?action=view&movieNo=${commentDTO.movieNO}" method="post"> <!-- Adjust the action URL -->
          <ul class="list-group-3">
            <c:forEach var="reviewDTO" items="${reviewDTOList}" varStatus="status">
              <li>
                <div class="flex_my">
                <form action="#">
                  <!--label태그는 체크박스를 누르지 않아도 연결된 체크박스를 체크해줌-->
                  <label for="chk${reviewDTO.movieNo}">
                    <input type="checkbox" name="selectedItems3" class="button chkButton" value="${reviewDTO.movieNo}" id="chk${reviewDTO.movieNo}">
                    <i class="circle"></i>
                  </label>
                </form>
                    <a href="view.movie?action=view&movieNo=${reviewDTO.movieNo}" class="text-decoration-none" >
                      <p class="myList"> ${reviewDTO.review}
                          ${reviewDTO.addDate}
                          ${commentDTO.nickName}
                        <a href="./remove.board?action=remove&contentNo=${reviewDTO.movieNo}" onclick="return confirm('정말 삭제하시겠습니까?');"
                           class="remove-btn" style="font-size: 30px">X</a>
                      </p>
                    </a>
                  </div>
              </li>
            </c:forEach>
          </ul>
        </form>
      </div>
  </div>

  <div class="tab-content" id="tab4">
    <!-- "내가 찜한 영화" -->
    <div class="Zzim">
        <c:forEach var="movieDTO" items="${zzimMovieList}" varStatus="status">
            <li class="list-group-zzim">
              <a href="view.movie?action=view&movieNo=${movieDTO.movieNo}" class="text-decoration-4" >
                    <img src="${movieDTO.poster}" alt="영화 이미지">
              <p>   ${movieDTO.movieName}
                    ${movieDTO.mo}
                    ${movieDTO.avgScore}
              </p>
              </a>
            </li>
          </c:forEach>
    </div>
  </div>
</div>
<jsp:include page="../footer.jsp"/>
<script>
  // 초기 tab-content hidden 설정
  const allTabContents = document.querySelectorAll(".tab-content");
  allTabContents.forEach((content) => {
    content.style.display = "none";
  });

  // 탭 링크로 변경함
  const tabs = document.querySelectorAll(".mytab-link");

  // 탭링크 클릭시 함수
  tabs.forEach((tab) => {
  tab.addEventListener("click", (event) => {
    event.preventDefault();

    // 탭링크 초기화
    tabs.forEach((t) => {
      t.style.borderBottom = "none";
    });

    // 클릭시  탭 부분 경계 강조
    tab.style.borderBottom = "5px solid white";

    // 탭 컨텐츠 토글 적용 경우
    const targetTabId = tab.getAttribute("href").substring(1);
    const targetTabContent = document.getElementById(targetTabId);

    if (targetTabContent.style.display === "block") {
      targetTabContent.style.display = "none";
    } else {
      // 다른 탭 컨텐츠 안보이게 적용
      const allTabContents = document.querySelectorAll(".tab-content");
      allTabContents.forEach((content) => {
        content.style.display = "none";
      });

      // 선택 탭 컨텐츠 보이게 적용
      targetTabContent.style.display = "block";
    }
  });
});
</script>
<script>
  // "전체 선택" button click 핸들 1번
  function checkAll1(checked1) {
    const checkboxes = document.querySelectorAll('.list-group-1 input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
      checkbox.checked = checked1;
    });
  }

  // "전체 선택" button1 정의
  const checkAllButton1 = document.querySelector('.btn-checkAll1');

  //  "전체 선택" button1
  checkAllButton1.addEventListener('click', function () {
    const checked1 = this.value === '전체 선택';
    checkAll1(checked1);

    // Toggle the button text
    this.value = checked1 ? '전체 해제' : '전체 선택';
  });
</script>
<script>
  // "전체 선택" button click 핸들 2번
  function checkAll2(checked2) {
    const checkboxes = document.querySelectorAll('.list-group-2 input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
      checkbox.checked = checked2;
    });
  }

  // "전체 선택" button2 정의
  const checkAllButton2 = document.querySelector('.btn-checkAll2');

  // "전체 선택" button2
  checkAllButton2.addEventListener('click', function () {
    const checked2 = this.value === '전체 선택';
    checkAll2(checked2);

    // Toggle the button text
    this.value = checked2 ? '전체 해제' : '전체 선택';
  });
</script>
<script>
  // "전체 선택" button click 핸들 3번
  function checkAll(checked3) {
    const checkboxes = document.querySelectorAll('.list-group-3 input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
      checkbox.checked = checked3;
    });
  }

  // "전체 선택" button3 정의
  const checkAllButton3 = document.querySelector('.btn-checkAll3');

  // "전체 선택" button3
  checkAllButton3.addEventListener('click', function () {
    const checked3 = this.value === '전체 선택';
    checkAll(checked3);

    // Toggle the button text
    this.value = checked3 ? '전체 해제' : '전체 선택';
  });
</script>

</body>
</html>