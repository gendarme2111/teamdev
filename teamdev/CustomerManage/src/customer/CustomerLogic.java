package customer;

import static constants.MessageConstants.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import util.LogUtil;
import util.StringUtil;

/**
 * 顧客情報のロジック
 */
public class CustomerLogic {

    /**
     * DAO経由で顧客情報をDBから取得する
     * @param id 取得する顧客情報のID
     * @return 顧客情報Bean
     */
    public CustomerBean load(int id) {
        LogUtil.println(this.getClass().getSimpleName() + "#load");

        CustomerDao customerDao = new CustomerDao();
        CustomerBean customer = customerDao.load(id);

        return customer;
    }

    /**
     * DAO経由で顧客情報をDBに追加する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String add(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#add");

        // TODO 実装済(テスト中)

        // DAO経由でcustomerの情報をデータベースに登録し、エラーメッセージを取得(成功時はnull)
        CustomerDao cstDao = new CustomerDao();
        String errMessage = cstDao.add(customer);
        if (errMessage != null) {
            errMessage = MESSAGE_CAN_NOT_ADD;
        }
        return errMessage;
    }

    /**
     * DAO経由でDBの顧客情報を更新する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String update(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#update");

        // TODO 実装済(テスト中)

        // DAO経由でcustomerの情報をデータベースに登録しエラーメッセージを取得(成功時はnull)
        CustomerDao cstDao = new CustomerDao();
        String errMessage = cstDao.update(customer);
        if (errMessage != null) {
            errMessage = MESSAGE_CAN_NOT_UPDATE;
        }
        return errMessage;
    }

    /**
     * DAO経由でDBの顧客情報を削除する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String delete(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#delete");

        // TODO 実装済(テスト中)

        // DAO経由でcustomerの情報をデータベースから削除しエラーメッセージを取得(成功時はnull)
        CustomerDao cstDao = new CustomerDao();
        String errMessage = cstDao.delete(customer.getId());
        if (errMessage != null) {
            errMessage = MESSAGE_CAN_NOT_DELETE;
        }
        return errMessage;
    }

    /**
     * リクエスト内の顧客情報をセッションに顧客情報Beanとして設定する
     * @param request 顧客情報を含むリクエスト
     */
    public void setCustomerBeanFromRequestToSession(HttpServletRequest request) {
        LogUtil.println(this.getClass().getSimpleName() + "#setCustomerBeanFromRequestToSession");

        // TODO 実装済(テスト中)

        // 顧客情報Bean(customer)を生成する
        CustomerBean customer = new CustomerBean();

        // リクエストパラメーターから取得した値をcustomerに保存
        // リクエストにID情報がある(nullでない)場合のみBeanにidの値をsetする
        if (request.getParameter("id") != null) {
            customer.setId(Integer.parseInt(StringUtil.exchangeESCEncoding(request.getParameter("id"))));
        }
        customer.setName(StringUtil.exchangeESCEncoding(request.getParameter("name")));
        customer.setZip(StringUtil.exchangeESCEncoding(request.getParameter("zip")));
        customer.setAddress1(StringUtil.exchangeESCEncoding(request.getParameter("address1")));
        customer.setAddress2(StringUtil.exchangeESCEncoding(request.getParameter("address2")));
        customer.setTel(StringUtil.exchangeESCEncoding(request.getParameter("tel")));
        customer.setFax(StringUtil.exchangeESCEncoding(request.getParameter("fax")));
        customer.setEmail(StringUtil.exchangeESCEncoding(request.getParameter("email")));

        //セッションスコープの生成
        HttpSession session = request.getSession();

        //customerをセッションスコープに入れる
        session.setAttribute("customer", customer);

    }
}