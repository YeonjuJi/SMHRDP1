<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.project.entity.DealEntity"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시글 수정</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="resources/assetsBoard/css/main.css" />
    <link rel="stylesheet" href="resources/assetsBoard/css/board.css" />
    <style>
        .file-item {
            display: flex; /* Flexbox로 설정 */
            align-items: center; /* 세로 중앙 정렬 */
            justify-content: space-between; /* 양쪽 끝으로 정렬 */
            margin-bottom: 10px; /* 각 파일 항목 간격 조절 */
        }
        .file-item img {
            max-width: 100px; /* 미리보기 이미지 크기 조절 */
            max-height: 100px;
            margin-right: 10px; /* 이미지와 파일명 간격 조절 */
        }
        .file-item span {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px; /* 파일명 길이 조절 */
            display: inline-block;
        }
        .file-item button {
            margin-left: 10px; /* 파일명과 삭제 버튼 간격 조절 */
        }
    </style>
</head>
<body>


    <div id="deal">
        <form action="dealModify" method="post" enctype="multipart/form-data">
            <input type="hidden" name="idx" value="${deal.idx}" />
            <table id="list">
                <tr>
                    <td>제목</td>
                    <td><input type='text' name="title" value="${empty deal.title ? '화가난닭' : deal.title}" ></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="writer" value="${empty deal.writer ? '화가나기떄문이닭' : deal.writer}"></td>
                </tr>
                <tr>
                    <td colspan="2">내용</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- 이전에 업로드된 파일 목록 -->
                        <div id="existing-files">
                            <c:if test="${not empty deal.filenames}">
                                <ul>
                                    <c:forEach var="filename" items="${deal.filenames}">
                                        <li class="file-item">
                                            <img src="uploads/${filename}" alt="${filename}" onchange="loadImage(event)">
                                            <span>${filename}</span>
                                            <button type="button" onclick="removeExistingFile('${filename}')">삭제</button>
                                            <input type="hidden" name="existingFiles" value="${filename}">
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </div>
                       
                        <!-- 새로운 파일 업로드 -->
                         <div class="file-upload">
                        <input type="file" id="imageUpload" name="file" style="display: none;" onchange="loadImage(event)">
                        <label for="imageUpload" class="file-select-btn">파일선택</label>
                    </div><br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea rows="10" style="resize: none;" name="content">${empty deal.content ? '매우매우머리가아프닭' : deal.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="reset" value="초기화"><span>　　　</span>
                        <input type="submit" value="수정완료">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- Scripts -->
    <script src="resources/assets/js/jquery.min.js"></script>
    <script src="resources/assets/js/jquery.scrolly.min.js"></script>
    <script src="resources/assets/js/jquery.scrollex.min.js"></script>
    <script src="resources/assets/js/skel.min.js"></script>
    <script src="resources/assets/js/util.js"></script>
    <script src="resources/assets/js/main.js"></script>
 	
 	<!-- 프리뷰 -->
 	<script>
 	function loadImage(event) {
        const imagePreview = document.getElementById('preview');
        imagePreview.src = URL.createObjectURL(event.target.files[0]);
        imagePreview.onload = function() {
            URL.revokeObjectURL(imagePreview.src);
        }
    }
    </script>
</body>
</html>
