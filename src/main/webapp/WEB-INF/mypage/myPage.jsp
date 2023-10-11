<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
  <link href="/css/myPageCSS/myPage.css" rel="stylesheet">
  <link href="./css/common.css" rel="stylesheet">
  <title>마이 페이지</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">마이 페이지1</h1>
  </div>
</div>

<div class="profile">
  <h3 class="display-5"> <%-- 프로필 --%>
    <a class="profile-link" href="/modify.member?action=modify&memberId=${loginInfo.memberId}">프로필 <input type="button" value="프로필 수정" class="button"></a>
  </h3>
  <form name="frmMypage" action="/modify.mypage?action=mypage" method="post">
    <div class="profileInfo">
      <label class="col-sm-2">아이디 ${loginInfo.memberId}</label>
      <label class="col-sm-2">이름 ${loginInfo.name}</label>
      <label class="col-sm-2">닉네임 ${loginInfo.nickName}</label>
      <label class="col-sm-2">찜 ${loginInfo.zzimCnt}</label>
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

  <div class="tab-content" id="tab1">
    <!-- 기능 편의 버튼 -->
    <a href="#" class="btn btn-primary" id="checkAll">전체 선택</a>
    <a href="#" class="btn btn-primary" id="uncheckAll">전체 해제</a>
    <a href="#" class="content btn-removeAll">비우기</a>
    <a href="#" class="content btn-selected">선택삭제</a>
    <!-- "내가 쓴 글" -->
    <c:forEach var="boardDTO" items="${boardDTOList}" varStatus="status">
      <%-- 현재시간 , 작성시간 구하기 --%>
      <fmt:parseNumber value="${currentTime.time / (1000*60*60)}" integerOnly="true" var="currentFmtTime" scope="request"/>
      <fmt:parseNumber value="${boardDTO.addDate.time / (1000*60*60)}" integerOnly="true" var="addFmtTime" scope="request"/>
      <li class="list-group-1">
        <a href="get.board?action=get&contentNo=${boardDTO.contentNo}" class="text-decoration-1" type="hidden">
          <p> ${boardDTO.title}
              ${boardDTO.addDate}
              ${boardDTO.nickName}
              ${boardDTO.hit}
              <input type="checkbox" value="check">
            <a href="./remove.board?action=remove&contentNo=${boardDTO.contentNo}" onclick="return confirm('정말 삭제하시겠습니까?');" class="remove-btn">삭제 </a>
          </p>
        </a>
      </li>
    </c:forEach>
  </div>

  <div class="tab-content" id="tab2">
    <!-- 기능 편의 버튼 -->
    <a href="#" class="btn btn-primary" id="checkAll">전체 선택</a>
    <a href="#" class="btn btn-primary" id="uncheckAll">전체 해제</a>
    <a href="#" class="comment btn-removeAll">비우기</a>
    <a href="#" class="comment btn-selected">선택삭제</a>
    <!--"내가 쓴 댓글"-->
    <c:forEach var="commentDTO" items="${commentDTOList}" varStatus="status">
      <li class="list-group-2">
        <a href="get.board?action=get&contentNo=${commentDTO.contentNo}" class="text-decoration-2" >
          <p> <input type="checkbox" value="check">
              ${commentDTO.commentNo}
              ${commentDTO.addDate}
              ${commentDTO.nickName}
              <a href="./remove.board?action=remove&contentNo=${boardDTO.commentNo}" onclick="return confirm('정말 삭제하시겠습니까?');" class="remove-btn">삭제 </a>
          </p>
        </a>
      </li>
    </c:forEach>
  </div>

  <div class="tab-content" id="tab3">
    <!-- 기능 편의 버튼 -->
    <a href="#" class="btn btn-primary" id="checkAll">전체 선택</a>
    <a href="#" class="btn btn-primary" id="uncheckAll">전체 해제</a>
    <a href="#" class="review btn-removeAll">비우기</a>
    <a href="#" class="review btn-selected">선택삭제</a>
    <!--"내가 쓴 리뷰"-->
    <c:forEach var="reviewDTO" items="${reviewDTOList}" varStatus="status">
      <li class="list-group-3">
        <a href="view.movie?action=view&movieNo=${reviewDTO.movieNo}" class="text-decoration-3" >
          <p> <input type="checkbox" value="check">
              ${reviewDTO.score}
              ${reviewDTO.review}
              ${reviewDTO.nickName}
              ${reviewDTO.addDate}
              <a href="./remove.movie?action=view&movieNo=${reviewDTO.reviewNo}" onclick="return confirm('정말 삭제하시겠습니까?');" class="remove-btn">삭제 </a>
          </p>
        </a>
      </li>
    </c:forEach>
  </div>

  <div class="tab-content" id="tab4">
    <!-- "내가 찜한 영화" -->
        <c:forEach var="movieDTO" items="${zzimMovieList}" varStatus="status">
            <li class="list-group-4">
              <a href="view.movie?action=view&movieNo=${movieDTO.movieNo}" class="text-decoration-4" >
                <p> <input type="checkbox" value="check">
                    ${movieDTO.movieName}
                    <img src="${movieDTO.poster}" alt="영화 이미지">
                    ${movieDTO.mo}
                    ${movieDTO.avgScore}

                </p>
              </a>
            </li>
          </c:forEach>
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

<script> // 전체 삭제
  document.addEventListener('DOMContentLoaded', function () {
    const btnRemoveAll = document.querySelector(".btn-removeAll");
    btnRemoveAll.addEventListener('click', function () {
      if (confirm('정말 삭제하시겠습니까?')) {
        location.href = './board/boardList.jsp';
      }
    });
  });
</script>
<script> // 선택 삭제 (선택한 내가 작성한 글)
  const btnRemoveSelected = document.querySelector(".btn-selected");
  const tabContent = document.querySelector('.tab-content');
  btnRemoveSelected.addEventListener('click', function() {
    if (confirm('정말 삭제하시겠습니까?')) {
      tabContent.action = '../board/boardList.jsp';
      tabContent.submit();
    }
  });
</script>
<script>
  // 선택 삭제 (선택한 내가 작성한 글)
  const btnRemoveSelected = document.querySelector(".btn-selected");

  btnRemoveSelected.addEventListener('click', function() {
    if (confirm('정말 삭제하시겠습니까?')) {
      // Find the currently active tab
      const activeTabLink = document.querySelector(".mytab-link.active");
      if (activeTabLink) {
        const activeTabId = activeTabLink.getAttribute("href").substring(1);
        const tabContent1 = document.querySelector(`#${activeTabId} form[name=tabContent1]`);
        tabContent1.action = '../board/boardList.jsp';
        tabContent1.submit();
      }
    }
  });
</script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const cartTable = document.getElementById('cartTable');
    const checkAllButton = document.getElementById('checkAll');
    const uncheckAllButton = document.getElementById('uncheckAll');

    checkAllButton.addEventListener('click', function() {
      const checkboxes = cartTable.querySelectorAll('input[type="checkbox"]');
      checkboxes.forEach(function(checkbox) {
        checkbox.checked = true;
      });
    });

    uncheckAllButton.addEventListener('click', function() {
      const checkboxes = cartTable.querySelectorAll('input[type="checkbox"]');
      checkboxes.forEach(function(checkbox) {
        checkbox.checked = false;
      });
    });
  });
</script>
</body>
</html>