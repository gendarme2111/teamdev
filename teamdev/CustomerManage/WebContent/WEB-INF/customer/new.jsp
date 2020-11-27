<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="user.UserBean" id="user" scope="session" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
 <h1>顧客管理</h1>
    <div class="main">
        <!-- alertが作動した際にformの処理を止める -->
        <form action="CustomerServlet" method="post" onsubmit="return funcConfirm()">
        <h2>新規登録</h2>
        <table border="1">
            <tr>
                <td class="title">氏名</td>
                <!-- 最大文字数を20文字に設定 -->
                <td><input name="name" id="name" type="text" maxlength="20"></td>
            </tr>
            <tr>
                <!-- 最大文字数を20文字に設定 -->
                <td class="title">郵便番号</td>
                <td><input name="zip" id="zip" type="text" maxlength="20"></td>
            </tr>
            <tr>
                <!-- 最大文字数を100文字に設定 -->
                <td class="title">住所1</td>
                <td><input name="address1" id="address1" type="text" maxlength="100"></td>
            </tr>
            <tr>
                <!-- 最大文字数を100文字に設定 -->
                <td class="title">住所2</td>
                <td><input name="address2" id="address2" type="text" maxlength="100"></td>
            </tr>
            <tr>
                <!-- 最大文字数を20文字に設定 -->
                <td class="title">TEL</td>
                <td><input name="tel" id="tel" type="text" maxlength="20"></td>
            </tr>
            <tr>
                <!-- 最大文字数を20文字に設定 -->
                <td class="title">FAX</td>
                <td><input name="fax" id="fax" type="text" maxlength="20"></td>
            </tr>
            <tr>
                <!-- 最大文字数を100文字に設定 -->
                <td class="title">E-mail</td>
                <td><input name="email" id="email" type="text" maxlength="100"></td>
            </tr>
        </table>
            <p>
                <!-- TODO実装済み ｢編集｣ボタン -->
                <button name="state" value="new_confirm">送信</button> <!-- procNewConfirmメソッドを呼び出す -->
                <input type="button" value="戻る" onclick="history.back()"> <!-- 一つ前の画面に戻る -->
            </p>
        </form>
    </div>
</body>
<script type="text/javascript">
    function funcConfirm() {
        // TODO実装済み バリデーションチェック･alertダイアログ処理
        const name = document.getElementById('name').value;
        const zip = document.getElementById('zip').value;
        const address1 = document.getElementById('address1').value;
        const address2 = document.getElementById('address2').value;
        const tel = document.getElementById('tel').value;
        const fax = document.getElementById('fax').value;
        const email = document.getElementById('email').value;
        // 入力がない場合はエラーメッセージを表示させる
        // address2,faxは入力なしを許容する
        if(name==""){
            alert('氏名が入力されていません');
            return false
        }
        if(zip==""){
            alert('郵便番号が入力されていません');
            return false
        }
        if(address1==""){
            alert('住所1が入力されていません');
            return false
        }
        if(tel==""){
            alert('電話番号が入力されていません');
            return false
        }
        if(email==""){
            alert('E-mailが入力されていません');
            return false
        }
        // [\w\-._]+ 半角英数字-._が1文字以上
        // @
        // [\w\-._]+ 半角英数字-._が1文字以上
        // .
        // [A-Za-z]+$ 半角英字が1文字以上で終わる
        if(!email.match(/[\w\-._]+@[\w\-._]+\.[A-Za-z]+$/)){
            alert('メールアドレスを正しく入力してください');
            return false
        }
    }
</script>
</html>