<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구매 페이지</title>
    <style>
    body, html {
      height: 100%;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f0f0f0;
    }
    .container {
      width: 300px;
      padding: 20px;
      background-color: white;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
    #payment-button { 
      width: 100%; 
      padding: 15px; 
      background-color: #3065AC; 
      color: white; 
      border-radius: 3px; 
      font-size: 16px; 
      border: none; 
      margin-top: 10px;
    }
    .title {
      margin: 0 0 4px;
      font-size: 24px;
      font-weight: 600;
      color: #4e5968;
    }
    img {
      max-width: 100%;
      height: auto;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
    <div class="container">
    <!-- 상품 정보 영역-->
    <div class="title">${list.car_title}</div>
    <p>${list.car_rank}급</p>
    <img src="stroller/${list.car_file}" alt="유모차 이미지"/>
    <p>결제 금액: ${list.car_price}</p>
  	<p>구매자아이디: ${list.id}
    <hr>	
  
    <!-- 결제 방법 영역-->
    <div class="title">결제 방법</div>
    <div id="payment-method"></div>
    <div id="agreement"></div> 
    <button id="payment-button">결제하기</button>
  </div>

    
    
</body>
</html>