<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link href="/css/memberCSS/register.css" rel="stylesheet">
  <link href="./css/common.css" rel="stylesheet">
  <script src="/js/memberJS/register.js" defer></script>
  <title>회원 가입</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<%--<div class="jumbotron">--%>
<%--  <div class="container">--%>
<%--    <h1 class="display-3">회원 가입</h1>--%>
<%--  </div>--%>
<%--</div>--%>

<%--<div class="container">--%>
<%--  <form name="frmMember" action="/register.member?action=register" method="post">--%>
<%--    <div class="form-group row">--%>
<%--      <label class="col-sm-2">아이디</label>--%>
<%--      <div class="col-sm-3">--%>
<%--        <input type="text" name="memberId" class="form-control">--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="form-group row">--%>
<%--      <label class="col-sm-2">비밀번호</label>--%>
<%--      <div class="col-sm-3">--%>
<%--        <input type="text" name="passwd" class="form-control">--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="form-group row">--%>
<%--      <label class="col-sm-2">비밀번호 확인</label>--%>
<%--      <div class="col-sm-3">--%>
<%--        <input type="text" name="passwd-re" class="form-control">--%>
<%--        <span class="passwdCheck"></span>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="form-group row">--%>
<%--      <label class="col-sm-2">이름</label>--%>
<%--      <div class="col-sm-3">--%>
<%--        <input type="text" name="name" class="form-control">--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="form-group row">--%>
<%--      <label class="col-sm-2">닉네임</label>--%>
<%--      <div class="col-sm-3">--%>
<%--        <input type="text" name="nickName" class="form-control">--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="form-group row">--%>
<%--      <div class="col-sm-10">--%>
<%--        <input type="submit" class="btn btn-primary" value="등록">--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </form>--%>
<%--</div>--%>
<main>
  <section>
    <div id="register-title">
      <span>회원가입</span>
    </div>
    <form name="frmMember" action="/register.member?action=register" method="post">
      <div id="register-container">
        <div id="register-input-container">
          <div class="register-input">
            <div class="register-input-div">
              <input id="register-input-id" type="text" placeholder="아이디" name="memberId">
              <div id="register-id-check"><i class="fa-solid fa-check fa-lg"></i></div>
            </div>
            <span>영문 또는 영문, 숫자 조합 4~12 자리<br></span>
            <span id="id-warn-span"></span>
          </div>

          <div class="register-input">
            <div class="register-input-div">
              <input id="register-input-pw" type="password" placeholder="비밀번호" name="passwd">
              <div id="register-pw-check"><i class="fa-solid fa-check fa-lg"></i></div>
            </div>
            <span>영문, 숫자, 특수문자(~!@#$%^&*) 조합 8~15 자리<br></span>
            <span id = pw-warn-span></span>
          </div>

          <div class="register-input">
            <div class="register-input-div">
              <input id="register-input-pw-re" type="password" placeholder="비밀번호 확인">
              <div id="register-pwRe-check"><i class="fa-solid fa-check fa-lg"></i></div>
            </div>
            <span id = pw-re-warn-span></span>
          </div>

          <div class="register-input">
            <div class="register-input-div">
              <input id="register-input-name" type="text" placeholder="이름" name="name">
              <div id="register-name-check"><i class="fa-solid fa-check fa-lg"></i></div>
            </div>
            <span id="name-warn-span"></span>
          </div>

          <div class="register-input">
            <div class="register-input-div">
              <input id="register-input-nick" type="text" placeholder="닉네임" name="nickName">
              <div id="register-nick-check"><i class="fa-solid fa-check fa-lg"></i></div>
            </div>
            <span id="nick-warn-span"></span>
          </div>
        </div>
      </div>

      <div id="register-buttons">
        <input type="button" id="submit-btn" value="등록">
        <input type="button" onclick=window.location.href="login" value="취소">
      </div>

    </form>
  </section>
</main>
</body>
</html>