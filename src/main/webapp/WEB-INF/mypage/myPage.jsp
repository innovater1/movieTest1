<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
  <link href="/css/myPageCSS/myPage.css" rel="stylesheet">
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

  <!-- Tab content for "내가 쓴 글" -->
  <div class="tab-content" id="tab1">
    <!-- 기능 편의 버튼 -->
    <input type="button" class="checkAll1 btn-checkAll" value="전체 선택">
    <input type="button" class="uncheckAll1 btn-uncheckAll" value="전체 해제">
    <input type="button" class="comment btn-removeAll" value="전체 삭제">
    <input type="button" class="comment btn-selected1" value="선택 삭제">
    <form name="frmRemoveSelected1" action="./get.board?action=get&contentNo=${boardDTO.contentNo}" method="post"> <!-- Adjust the action URL -->
      <ul class="list-group-1">
        <c:forEach var="boardDTO" items="${boardDTOList}" varStatus="status">
          <li>
            <input type="checkbox" name="selectedItems" value="${boardDTO.contentNo}">
              ${boardDTO.title}
              ${boardDTO.addDate}
              ${boardDTO.nickName}
              ${boardDTO.hit}
            <a href="./remove.board?action=remove&contentNo=${boardDTO.contentNo}" onclick="return confirm('정말 삭제하시겠습니까?');" class="remove-btn">삭제</a>
          </li>
        </c:forEach>
      </ul>
    </form>
  </div>

  <!-- Tab content for "내가 쓴 댓글" -->
  <div class="tab-content" id="tab2">
    <!-- 기능 편의 버튼 -->
    <input type="button" class="checkAll2 btn-checkAll" value="전체 선택">
    <input type="button" class="uncheckAll2 btn-uncheckAll" value="전체 해제">
    <input type="button" class="comment btn-removeAll" value="전체 삭제">
    <input type="button" class="comment btn-selected2" value="선택 삭제">

    <form name="frmRemoveSelected2" action="./get.board?action=get&contentNo=${boardDTO.contentNo}" method="post"> <!-- Adjust the action URL -->
      <ul class="list-group-2">
        <c:forEach var="commentDTO" items="${commentDTOList}" varStatus="status">
          <li>
            <input type="checkbox" name="selectedItems" value="${commentDTO.commentNo}">
              ${commentDTO.commentNo}
              ${commentDTO.addDate}
              ${commentDTO.nickName}
            <a href="./remove.board?action=remove&contentNo=${commentDTO.commentNo}" onclick="return confirm('정말 삭제하시겠습니까?');" class="remove-btn">삭제</a>
          </li>
        </c:forEach>
      </ul>
    </form>
  </div>

  <!-- Tab content for "내가 쓴 리뷰" -->
  <div class="tab-content" id="tab3">
    <!-- 기능 편의 버튼 -->
    <input type="button" class="checkAll3 btn-checkAll" value="전체 선택">
    <input type="button" class="uncheckAll3 btn-uncheckAll" value="전체 해제">
    <input type="button" class="comment btn-removeAll" value="전체 삭제">
    <input type="button" class="comment btn-selected3" value="선택 삭제">

    <form name="frmRemoveSelected3" action="/view.movie?action=view&movieNo=${commentDTO.movieNO}" method="post"> <!-- Adjust the action URL -->
      <ul class="list-group-3">
        <c:forEach var="commentDTO" items="${commentDTOList}" varStatus="status">
          <li>
            <input type="checkbox" name="selectedItems" value="${commentDTO.commentNo}">
              ${commentDTO.commentNo}
              ${commentDTO.addDate}
              ${commentDTO.nickName}
            <a href="./remove.board?action=remove&contentNo=${commentDTO.commentNo}" onclick="return confirm('정말 삭제하시겠습니까?');" class="remove-btn">삭제</a>
          </li>
        </c:forEach>
      </ul>
    </form>
  </div>

  <div class="tab-content" id="tab4">
    <!-- "내가 찜한 영화" -->
        <c:forEach var="movieDTO" items="${zzimMovieList}" varStatus="status">
            <li class="list-group-4">
              <a href="view.movie?action=view&movieNo=${movieDTO.movieNo}" class="text-decoration-4" >
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
  // Handle "전체 선택" and "전체 해제" buttons
  const checkAllButtons = document.querySelectorAll('.btn-checkAll');
  const uncheckAllButtons = document.querySelectorAll('.btn-uncheckAll');
  checkAllButtons.forEach((checkAllButton, index) => {
    checkAllButton.addEventListener('click', function() {
      const checkboxes1 = document.querySelectorAll(`.tab-content:nth-child(${index + 1}) input[type="checkbox"]`);
      checkboxes1.forEach((checkbox) => {
        checkbox.checked = true;
      });
    });

    uncheckAllButtons[index].addEventListener('click', function() {
      const checkboxes2 = document.querySelectorAll(`.tab-content:nth-child(${index + 1}) input[type="checkbox"]`);
      checkboxes2.forEach((checkbox) => {
        checkbox.checked = false;
      });
    });
  });

  // Handle "선택 삭제" buttons
  const removeSelectedButtons = document.querySelectorAll('.btn-removeSelected');
  removeSelectedButtons.forEach((removeSelectedButton, index) => {
    removeSelectedButton.addEventListener('click', function() {
      const checkboxes = document.querySelectorAll(`.tab-content:nth-child(${index + 1}) input[type="checkbox"]`);
      const form = document.forms[`frmRemoveSelected${index + 1}`];
      const selectedItems = [];

      checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
          selectedItems.push(checkbox.value);
        }
      });

      if (selectedItems.length > 0) {
        // Add the selected items to the form as a hidden input
        const selectedItemsInput = document.createElement('input');
        selectedItemsInput.type = 'hidden';
        selectedItemsInput.name = 'selectedItems';
        selectedItemsInput.value = selectedItems.join(',');

        form.appendChild(selectedItemsInput);
        form.submit();
      } else {
        alert('삭제할 컨텐츠를 클릭해주세요.');
      }
    });
  });
</script>
</body>
</html>