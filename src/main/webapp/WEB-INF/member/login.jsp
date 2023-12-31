<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ko">
<%
  String result = request.getParameter("result");
  pageContext.setAttribute("result", result);
%>
<head>
<%--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
  <title>Title</title>
  <link href="/css/memberCSS/login.css" rel="stylesheet">
  <link href="./css/common.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"/>
<%--<div class="jumbotron">--%>
<%--  <div class="container">--%>
<%--    <h1 class="display-3">로그인</h1>--%>
<%--  </div>--%>
<%--</div>--%>

<%--<div class="container">--%>
<%--  <div class="row">--%>
<%--    <div class="col-md-9">--%>
<%--      <h3 class="form-signin-heading">Please sign in</h3>--%>
<%--      <form class="frmlogin" action="/login" method="post">--%>
<%--        <div class="form-group">--%>
<%--          <label for="memberId" class="sr-only">User Id</label>--%>
<%--          <input type="text" name="memberId" id="memberId" class="form-control" placeholder="ID" required autofocus>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--          <label for="passwd" class="sr-only">Password</label>--%>
<%--          <input type="password" name="passwd" id="passwd" class="form-control" placeholder="Password" autoComplete="off" required>--%>
<%--        </div>--%>
<%--        <button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>--%>
<%--        <button class="btn btn btn-lg btn-success btn-block"><a href="/register.member?action=register" style="text-decoration-line: none; color: white">회원가입</a></button>--%>
<%--      </form>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
<div class="login-movie-container">
  <main>
    <section>
      <div class="login-container">
        <!--       맨 위             -->
        <div class="top-container">
          <h2>로그인</h2>
        </div>
        <!--       아이디 비밀번호             -->
        <form class="frmlogin" action="/login" method="post">
          <div class="input-container">
            <input type="text" placeholder="아이디" name="memberId">
            <input type="text" placeholder="비밀번호" name="passwd">
          <c:if test="${result != null}">
            <span>ID나 비밀번호가 일치하지 않습니다</span>
          </c:if>
          </div>
          <div class="login-btn-container">
            <button type="submit">로그인</button>
          </div>
        </form>
        <div class="register-container">
          <span>아직 계정이 없으신가요?&nbsp;</span>
          <a class="register-link" href="/register.member?action=register">회원가입하기</a>
        </div>
      </div>
    </section>
  </main>
</div>
</body>
</html>
