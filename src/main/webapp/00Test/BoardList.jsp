<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<style>
    .list-group-item{border: none; color: blue;}
      thead{
        border-top: 2px solid black;
        border-bottom: 2px solid black;
      }
      th{        
        border-left: 1px solid white;
        border-right: 1px solid white;
      }
      tr{text-align: center;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="javascript:void(0)">
        <img src="https://tjoeun.co.kr/images/logo.gif?v=20190918" alt="">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mynavbar">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">자유게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">자료실</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">방명록</a>
          </li>
          <li class="nav-item">
            <div class="btn-group">
                <button type="button" class="btn nav-link
                dropdown-toggle" data-bs-toggle="dropdown" style="border-width: 0;">
                드롭다운
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">SubMenu1</a>
                    <a class="dropdown-item" href="#">SubMenu2</a>
                    <a class="dropdown-item" href="#">SubMenu3</a>
                </div>
            </div>
          </li>
          <li>
              <form class="d-flex">
                <input class="form-control" type="text" placeholder="Search">
                <button class="btn btn-warning " type="button"><i class="bi bi-search"></i></button>
              </form>
          </li>
        </ul>
        <ul class="navbar-nav ">
            <li class="nav-item">
              <a class="nav-link" href="javascript:void(0)"><i class="bi bi-person-plus-fill"></i>회원가입</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#"><i class="bi bi-person-lines-fill"></i>회원정보수정</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="javascript:void(0)"><i class="bi bi-box-arrow-in-right"></i>로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="javascript:void(0)"><i class="bi bi-box-arrow-right"></i>로그아웃</a>
            </li>
      </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 mt-2">
          <div class="rounded-2 mt-2 text-center" style="height: 100px; background-color: #858585; color: white; font-size: 22px; line-height: 100px;">
            웹사이트 제작
          </div>
 
          <div class="list-group list-group-vertical">
            <a href="#" class="btn list-group-item list-group-item-action">회원정보변경</a>
            <a href="#" class="btn list-group-item list-group-item-action active">로그아웃</a>
            <a href="#" class="btn list-group-item list-group-item-action">마이페이지</a>
            <div class="btn-group-vertical dropend">
              <button type="button" class="btn dropdown-toggle list-group-item list-group-item-action "
              data-bs-toggle="dropdown">드롭다운</button>
              <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">SubMenu1</a>
                  <a class="dropdown-item" href="#">SubMenu2</a>
                  <a class="dropdown-item" href="#">SubMenu3</a>
              </div>
            </div>        
          </div>
 
        </div>
        <div class="col-lg-9">
            <div style="font-size: 28px; margin: 10px;">
              게시판목록 <span style="font-size: 26px;">- 자유게시판</span>
            </div>
            <form class="d-flex" style="float:right; margin-bottom: 10px;">
              <input class="form-control" type="text" style="width: 80px;" placeholder="제목">
              <input class="form-control" type="text" placeholder="" style="width: 200px;">
              <button class="btn btn-warning " type="button"><i class="bi bi-search"></i></button>
            </form>
 
            <table class="table table-striped">
              <thead>
                <tr class="text-light" style="background-color: #858585;">
                  <th style="width: 5%;">번호</th>
                  <th>제목</th>
                  <th style="width: 10%;">작성자</th>
                  <th style="width: 10%;">작성일</th>
                  <th style="width: 8%;">조회수</th>
                  <th style="width: 5%;">첨부</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-pin-angle-fill"></i></td>
                </tr>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-file-earmark-image"></i></td>
                </tr>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-pin-angle-fill"></i></td>
                </tr>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-file-earmark-image"></i></td>
                </tr>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-pin-angle-fill"></i></td>
                </tr>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-file-earmark-image"></i></td>
                </tr>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-pin-angle-fill"></i></td>
                </tr>
                <tr>
                  <td>100</td>
                  <td style="text-align: left;"><a href="">제목</a></td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
                  <td><i class="bi bi-file-earmark-image"></i></td>
                </tr>
              </tbody>
            </table>
 
            <form class="list-group list-group-horizontal" style="float: right; margin-bottom: 15px;">
              <button type="button" class="btn">Basic</button>
              <button type="button" class="btn btn-primary">글쓰기</button>
              <button type="button" class="btn btn-secondary">수정하기</button>
              <button type="button" class="btn btn-success">삭제하기</button>
              <button type="button" class="btn btn-info">답글쓰기</button>
              <button type="button" class="btn btn-warning">리스트보기</button>
              <button type="button" class="btn btn-danger">전송하기</button>
              <button type="button" class="btn btn-dark">Reset</button>
              <button type="button" class="btn btn-light">Light</button>
              <button type="button" class="btn btn-link">Link</button>
            </form>
 
            <div style="clear: both;">
              <ul class="pagination justify-content-center">
                <li class="page-item"><i class="page-link bi bi-skip-backward-fill"></i></li>
                <li class="page-item"><i class="page-link bi bi-skip-start-fill"></i></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><i class="page-link bi bi-skip-end-fill"></i></li>
                <li class="page-item"><i class="page-link bi bi-skip-forward-fill"></i></li>
              </ul>
            </div>
    </div>
</div>  
  <div class="row copyright" style="border-top: 2px solid black;">
    <div class="col-lg-3 copy_logo mt-2" style="float: left;">
        <img src="https://tjoeun.co.kr/images/logo.gif?v=20190918"
            alt="더조은 copyright">
    </div>
    <div class="col-lg-9 copy_info text-center mt-2" style="font-size: 12px;">
        (주)더조은컴퓨터아카데미(153-759) &nbsp;&nbsp;
        서울시 종로구 관철동 &nbsp;&nbsp;
        대표이사 : 이무개 <br>
        사업자등록번호 : 123-45-67890
        TEL : 02-1234-5678 &nbsp;&nbsp;
        FAX : 02-9876-5432 <br>
        E-mail : master@tjoeun.co.kr <br>
        Copyright (C) 2010 TJOEUN. All rights reserved.
    </div>
  </div>
</body>
</html>