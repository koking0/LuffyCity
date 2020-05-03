<template>
  <div class="shopping-cart-wrap">
    <h3 class="shopping-cart-tit">
      <span>我的购物车 </span>
      <small>共<span>1</span>门课程</small>
    </h3>
    <div class="row col-xs-12">
      <table class="table shopping-cart-list" style="table-layout:fixed">
        <thead class="shopping-cart-list-head" style="background: #F7F7F7; width: 100%; height: 80px">
        <tr class="shopping-cart-list-head-wrap" style="background: #F7F7F7; width: 100%">
          <th class="shopping-cart-list-head-item" width="8%"></th>
          <th class="shopping-cart-list-head-item" width="50%">课程</th>
          <th class="shopping-cart-list-head-item" width="20%">有效期</th>
          <th class="shopping-cart-list-head-item" width="15%">单价</th>
          <th class="shopping-cart-list-head-item" width="15%">操作</th>
        </tr>
        </thead>
        <tbody>
        <tr id="195">
          <td width="8%" class="pad-left">
            <input class="check J-check-btn" type="checkbox" id="color-input0">
            <label for="color-input0">
              <img src="//hcdn1.luffycity.com/static/frontend/activity/hook_1564141042.8333368.svg">
            </label>
          </td>
          <td width="50%">
            <img alt=" " class="product-img"
                 src="//hcdn1.luffycity.comhttp://hcdn2.luffycity.com/media/frontend/course/列表图_Lcs535o.png">
            <a class="shopping-cart-course-title" href="/courses/195/details-introduce">
              基于Django开发轻量级Bug管理平台
            </a>
          </td>
          <td width="20%">
            <select class="select-option" name="datetime">
              <option value="10000" selected="">永久有效</option>
            </select>
          </td>
          <td width="15%" class="shopping-cart-course-price">¥199.0</td>
          <td width="15%" style="text-align: left;position: relative">
            <button class="do-btn">删除</button>
            <div class="delete-wrap">
              <div style="padding: 20px 0 24px 20px">
                <img width="14" height="14"
                     src="//hcdn1.luffycity.com/static/frontend/activity/warn-icon_1564127731.1963127.png">
                <span class="delete-text" style="display: inline-block; margin-left: 10px">
                  你确定删除该课程吗？
                </span>
              </div>
              <div class="delete-btn-wrap">
                <button class="delete-cancel">取消</button>
                <button class="delete-sure">确定</button>
              </div>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
      <ul class="pad-left"
          style="width: 100%; height: 80px; background: #F7F7F7; margin-bottom: 100px;margin-top:50px; display: flex; align-items: center">
        <li class="charge-list">
          <label for="color-input-red"></label>
          <input class="select_all" id="color-input-red" type="checkbox" width="20px" height="20px">
          <span class="shopping-cart-bot-font" style="margin-left: 15px; cursor: pointer">全选</span>
        </li>
        <li class="charge-list" style="margin-left: 58px">
          <img src="static/images/delete-icon_1564127719.3867524.png" alt="delete-icon">
          <span class="shopping-cart-bot-font" style="margin-left: 15px; cursor: pointer">删除</span>
        </li>
        <li class="charge-list" style="margin-left: auto">
          <span class="shopping-cart-bot-font" style="margin-right: 62px">总计：¥0.0</span>
          <button class="go-charge-btn">去结算</button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  export default {
    name: "ShoppingTrolley",
    data() {
      return {
        // 商品列表
        goods: [],
      }
    },
    methods: {
      getGoods() {
        this.$http.getContent('user/shop_cart/list/').then(res => {
          this.goods = res.data;
          console.log(this.goods);
        })
      }
    },
    created() {
      this.getGoods();
    },
  }
</script>

<style scoped>
  .shopping-cart-wrap {
    width: 1200px;
    margin: 0 auto;
  }

  .shopping-cart-tit {
    font-size: 18px;
    color: #666;
    margin: 25px 0;
  }

  .shopping-cart-tit small {
    font-size: 12px;
    color: #d0d0d0;
    display: inline-block;
  }

  .table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
  }

  table {
    background-color: transparent;
  }

  table {
    border-spacing: 0;
    border-collapse: collapse;
  }

  .table > thead > tr > th {
    vertical-align: middle !important;
    border-bottom: none !important;
    font-weight: 400 !important;
  }

  .table > thead > tr > th {
    border-top: none !important;
  }

  .table > thead > tr > th {
    height: 80px;
    line-height: 80px;
    padding: 0 0 0 10px;
  }

  .shopping-cart-list-head-item {
    font-size: 14px;
    color: #333;
    height: 80px;
  }

  .table > thead > tr > th {
    vertical-align: bottom;
    border-bottom: 2px solid #ddd;
  }

  tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
  }

  .table > tbody > tr:last-child {
    border-bottom: none;
  }

  .table > tbody > tr {
    border-bottom: 1px solid #ddd;
  }

  tr {
    width: 100%;
  }

  .table > tbody > tr > td {
    padding: 67px 10px;
    vertical-align: middle !important;
  }

  .pad-left {
    padding-left: 25px !important;
  }

  input[type=checkbox] {
    visibility: hidden;
  }

  input[type=checkbox], input[type=radio] {
    margin: 4px 0 0;
    margin-top: 1px \9;
    line-height: normal;
  }

  input[type=checkbox], input[type=radio] {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0;
  }

  .pad-left > input + label {
    display: block;
    width: 16px;
    height: 16px;
    cursor: pointer;
    border: 1px solid #9b9b9b;
    background: transparent;
    margin-bottom: 0;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    margin-right: 8px;
  }

  label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 700;
  }

  .do-btn {
    border: none;
    outline: none;
    background: none;
    font-size: 14px;
    color: #ffc210;
    margin-right: 15px;
  }

  button {
    outline: none;
  }

  button {
    cursor: pointer;
    border: none;
    background: transparent;
  }

  .delete-wrap {
    width: 211px;
    height: 116px;
    position: absolute;
    top: 0;
    left: -3px;
    background: url(//hcdn1.luffycity.com/static/frontend/activity/tip-panel_1564127730.529643.png) no-repeat;
    background-size: 100% 100%;
    display: none;
  }

  .delete-text {
    font-size: 12px;
    color: #666;
    line-height: 18px;
  }

  .shopping-cart-course-title {
    font-size: 16px;
    color: #333;
    text-decoration: none;
  }

  .delete-btn-wrap {
    text-align: right;
    padding-right: 20px;
  }

  .delete-cancel {
    background: none;
    border: 1px solid #d9d9d9;
    color: #666;
  }

  .delete-cancel, .delete-sure {
    width: 44px;
    height: 27px;
    outline: none;
    border-radius: 4px;
    font-size: 12px;
    line-height: 18px;
  }

  .shopping-cart-bot-font {
    font-size: 18px;
    color: #666;
  }

  .go-charge-btn {
    width: 159px;
    height: 80px;
    outline: none;
    border: none;
    background: #ffc210;
    font-size: 18px;
    color: #fff;
  }
</style>
