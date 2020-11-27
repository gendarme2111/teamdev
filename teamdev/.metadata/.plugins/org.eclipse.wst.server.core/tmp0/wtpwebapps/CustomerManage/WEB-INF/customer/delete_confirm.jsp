<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="customer.CustomerBean" id="customer" scope="session" />
<!doctype html>
<html>
<head>
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>顧客管理</h1>
    <div class="main">
<!-- TODO実装済み ｢削除確認｣画面 -->
        <h2>削除の確認</h2>
        <table border="1">
            <tr>
                <td class="title">氏名</td>
                <td><%=customer.getName()%></td>
            </tr>
            <tr>
                <td class="title">郵便番号</td>
                <td><%=customer.getZip()%></td>
            </tr>
            <tr>
                <td class="title">住所1</td>
                <td><%=customer.getAddress1()%></td>
            </tr>
            <tr>
                <td class="title">住所2</td>
                <td><%=customer.getAddress2()%></td>
            </tr>
            <tr>
                <td class="title">TEL</td>
                <td><%=customer.getTel()%></td>
            </tr>
            <tr>
                <td class="title">FAX</td>
                <td><%=customer.getFax()%></td>
            </tr>
            <tr>
                <td class="title">E-mail</td>
                <td><%=customer.getEmail()%></td>
            </tr>
        </table>
        <form action="CustomerServlet" method="post">
            <h2>
                <!-- TODO実装済み ｢編集｣ボタン -->
                <button name="state" value="delete">OK</button> <!--procDeleteメソッドを呼び出す-->
                <input type="button" value="戻る" onclick="history.back()"> <!--一つ前の画面に遷移-->
            </h2>
        </form>
    </div>
</body>