<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<body>
    <h1>顧客管理</h1>
    <div class="main">
        <!-- TODO実装済み ｢新規登録完了｣画面 -->
        <h2>新規登録未完了</h2>
        <h2><%=session.getAttribute("errMessage")%></h2> <!-- エラーメッセージの表示 -->
        <form method="post">
            <p>
                <button name="state" value="search" formaction="CustomerServlet">検索画面</button> <!--「検索条件」画面に遷移-->
            </p>
        </form>
    </div>
</body>
</body>
</html>
