<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
</head>
<body>
<h1>
	if not login, you can't see here
</h1>

<P> YOU CAN GO THREAD LIST USE THIS BUTTON </P>
<form action="/thread/main" METHOD="get">
	<button type="submit">Button !</button>
</form>
</body>
</html>
