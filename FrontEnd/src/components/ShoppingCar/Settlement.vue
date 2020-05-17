<template>
  <div class="purchase-wrap">
    <el-table ref="multipleTable" :data="goods" tooltip-effect="dark" style="width: 100%"
              @selection-change="handleSelectionChange">
      <el-table-column label="课程" width="800">
        <template slot-scope="scope">
          <img :src="scope.row.courseImage" alt="" width="250" height="125">
          <span style="margin-left: 30px;">{{scope.row.title}}</span>
        </template>
      </el-table-column>
      <el-table-column label="有效期" width="220">
        <template slot-scope="scope">
          <span>永久有效</span>
        </template>
      </el-table-column>
      <el-table-column label="单价" width="180">
        <template slot-scope="scope">
          <span>￥{{scope.row.price}}.0</span>
        </template>
      </el-table-column>
    </el-table>

    <div class="older-detail-list">
      <div style="text-align: right; margin-top: 30px">
        <div id="accordion">
          <div
            style="text-align: left; display: flex;padding-bottom: 22px;padding-left:30px;border-bottom: 1px solid #e8e8e8">
            <p class="sum-price-wrap" style="margin-right: 45px">商品总金额：
              <span class="sum-price">{{totalPrice}}.00元</span>
            </p>
          </div>
        </div>
<!--        <div style="height: 30px; margin-top: 40px; display: flex; align-items: center; justify-content: flex-end">-->
<!--          <input type="checkbox" class="ok" id="color-input-red">-->
<!--          <label for="color-input-red">-->
<!--            <img src="//hcdn1.luffycity.com/static/frontend/activity/hook.svg" alt="">-->
<!--          </label>-->
<!--          <p class="discount-num" style="color:#9B9B9B; margin-bottom: 0">使用我的贝里</p>-->
<!--          <p class="discount-num" style="margin-right: 45px">-->
<!--            <span style="display: none;">可用0个已抵扣 ￥0</span>-->
<!--          </p>-->
<!--        </div>-->
      </div>
      <ul class="pad-left">
        <div class="left">
          <span>支付方式：</span>
          <div class="paytype">
            <li class="payment bor">
              <img class="img1" src="/static/images/wx.svg" alt="">
              <span>微信</span>
              <img class="icon" src="/static/images/wx-selected.svg" alt="">
            </li>
            <li class="payment">
              <img class="img1" src="/static/images/zfb.svg" alt="">
              <span>支付宝</span>
              <img class="icon" src="/static/images/wx-selected.svg" style="display: none;" alt="">
            </li>
          </div>
        </div>
        <li class="pay">
          <span class="bot-font-small"> 实付款：
            <span class="true-price">¥{{totalPrice}}.00</span>
            </span>
<!--          <button class="go-buy-btn" @click="payment()">立即支付</button>-->
          <button class="go-buy-btn" data-toggle="modal" data-target="#vxPayment">立即支付</button>
        </li>
      </ul>
    </div>
    <div class="modal fade" id="vxPayment" tabindex="-1" role="dialog" aria-labelledby="vxPayment">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-body">
            <form>
              <div class="form-group">
                <img src="/static/images/WeChatPayment.png" alt="" style="width: 568px;">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Settlement",
    data() {
      return {
        body: '',
        goods: [],
        totalPrice: 0,
      }
    },
    methods: {
      getGoods() {
        this.$http.settlementList().then(res => {
          for (let i = 0; i < res.data.length; i++) {
            res.data[i]['courseImage'] = `http://127.0.0.1:8000/media/${res.data[i]['courseImage']}`;
            this.body += `${res.data[i]['title']} `;
            this.totalPrice += Number(res.data[i]['price']);
          }
          this.goods = res.data;
          console.log(res.data);
        }).catch(err => {
          console.log(err);
        })
      },
      payment() {
        let paymentData = {
          'total_amount': this.totalPrice,
          'subject': 'Luffy City Payment',
          'body': this.body,
        };
        this.$http.settlement(paymentData).then(res => {
          console.log(res);
        }).catch(err => {
          console.log(err);
        });
      },
    },
    created() {
      this.getGoods();
    },
  }
</script>

<style scoped>
  #accordion > div:nth-child(1) > div > span {
    margin-left: 15px;
  }

  .purchase-wrap {
    width: 1200px;
    margin: 0 auto;
  }

  .project .module .info img {
    margin-right: 24px;
  }

  .project .module .info span {
    display: block;
  }


  .project .module .info span {
    display: block;
  }


  .project .module .courseDiscountPrice span {
    display: block;
    font-size: 16px;
  }

  .project .module .courseDiscountPrice span {
    display: block;
    font-size: 16px;
  }


  .sum-price-wrap {
    display: inline-block;
    margin-left: auto;
    font-size: 16px;
    color: #4a4a4a;
  }

  .sum-price {
    font-size: 18px;
    color: #fa6240;
  }


  input[type=checkbox] {
    visibility: hidden;
  }

  input[type=checkbox], input[type=radio] {
    margin: 1px 0 0;
    line-height: normal;
  }

  input[type=checkbox], input[type=radio] {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0;
  }

  input, select, textarea {
    border: none;
    outline: none;
  }

  #color-input-red + label {
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


  .sun-coupon-num span {
    font-size: 18px;
    color: #fa6240;
  }

  .pad-left .left, .pad-left {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .pad-left {
    width: 1200px;
    margin-bottom: 180px;
    -ms-flex-pack: justify;
    justify-content: space-between;
    position: relative;
  }

  .pad-left .left {
    margin-left: 30px;
  }

  .pad-left .left, .pad-left {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .pad-left .left .payment, .pad-left .left .paytype {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
  }

  .pad-left .left .bor {
    border: 1px solid #f5a623;
  }

  .pad-left .left .payment {
    width: 120px;
    height: 48px;
    border-radius: 3px;
    margin-right: 36px;
    border: 1px solid #e9e9e9;
    -ms-flex-pack: center;
    justify-content: center;
    font-size: 18px;
    cursor: pointer;
    position: relative;
  }

  .pad-left .left .payment, .pad-left .left .paytype {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .pad-left .left .payment:last-child {
    margin-right: 0;
  }

  .pad-left .left .payment img {
    width: 26px;
    height: 26px;
    margin-right: 8px;
  }

  .pad-left .left .payment .icon {
    width: 18px;
    height: auto;
    position: absolute;
    right: -9px;
    bottom: -1px;
  }

  .pad-left .left .payment img {
    width: 26px;
    height: 26px;
    margin-right: 8px;
  }

  .pay {
    float: right;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-right: 45px;
  }

  .bot-font-small {
    margin-right: 15px;
  }

  .true-price {
    font-size: 36px;
    color: #333;
  }

  .go-buy-btn {
    width: 110px;
    height: 38px;
    outline: none;
    border: none;
    color: #fff;
    line-height: 38px;
    background: #ffc210;
    border-radius: 4px;
    font-size: 16px;
  }

  .wx-pay {
    width: 100%;
    height: 100%;
    position: fixed;
    left: 0;
    top: 0;
    background: rgba(0, 0, 0, .5);
    z-index: 101;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
  }

  .wx-pay .mask {
    padding: 36px 54px;
    text-align: center;
    background: #fff;
    animation: x0ppop .45s ease;
  }

  .wx-pay .mask p:first-of-type {
    font-size: 21px;
    color: #4a4a4a;
  }

  .wx-pay .mask p:first-of-type i {
    font-style: normal;
  }

  .wx-pay .mask .code {
    width: 212px;
    height: 190px;
    margin-top: 20px;
    margin-bottom: 10px;
  }

  .wx-pay .mask span {
    display: block;
    font-size: 15px;
    color: #9b9b9b;
    margin-bottom: 20px;
  }

  .wx-pay .mask p:nth-of-type(2) {
    font-size: 18px;
    color: #5e5e5e;
    cursor: pointer;
  }

  .wx-pay .mask p:nth-of-type(2) img {
    margin-right: 7px;
  }
</style>
