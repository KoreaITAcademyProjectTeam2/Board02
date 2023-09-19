<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<div class="left-box">
			<span class="camera_box">
				<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/logo.png" alt="insta photo">
			</span>
			<!-- camera_box -->
			<span class="line">
				<img alt="" src="">
			</span>
			<!-- line -->
			<!-- 
			<span class="logo_box">
				<img class="logo" src="/resources/img/logo_text.png" alt="인스타 로고" />
			</span> 
			-->
			<!-- logo_box -->
			
		</div>
		<!-- div .left-box -->
	    <div class="search_box">
			<div class="magnifier_box">
				<img class="magnifier" src="/resources/img/magnifier.png" alt="검색 버튼">
			</div>
			<!-- magnifier_box (image)-->
			<form action="./search" method="get">
				<input type="text" id="search" name="q" required>
				<button type="submit">검색</button>
			</form>
			<!-- search form -->
	    </div>
		<!--  .search_box -->
	</header>
	<!-- header -->
	<!-- body -->
	<div class="none"></div>
	<div class="main_body">
		<article>
			<div class="new_post">
				<form action="./newThread" method="get">
					<label>
						<input type="text" name="" placeholder="Make New Post!">
					</label>
					<button type="submit">New Post!</button>
				</form>
			</div>
		</article>
	</div>
</body>
</html>