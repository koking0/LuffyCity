<template>
  <div class="shopping-cart-wrap">
    <h3 class="shopping-cart-tit">
      <span>我的购物车</span>
      <small>共<span>{{goods.length}}</span>门课程</small>
    </h3>

    <el-table ref="multipleTable" :data="goods" tooltip-effect="dark" style="width: 100%"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="150"></el-table-column>
      <el-table-column label="课程" width="800">
        <template slot-scope="scope">
          <img :src="scope.row.courseImage" alt="" width="250" height="125">
          <span style="margin-left: 30px;">{{scope.row.title}}</span>
        </template>
      </el-table-column>
      <el-table-column label="单价" width="250">
        <template slot-scope="scope">
          <span>￥{{scope.row.price}}.0</span>
        </template>
      </el-table-column>
    </el-table>
    <div style="margin-top: 20px">
      <el-button @click="toggleSelection()">
        <span class="shopping-cart-bot-font" style="margin-left: 15px; cursor: pointer">取消选择</span>
      </el-button>
      <el-button @click="deleteGoods()">
        <img src="/static/images/delete-icon_1564127719.3867524.png" alt="delete-icon" style="margin-bottom: 5px;">
        <span class="shopping-cart-bot-font" style="margin-left: 15px; cursor: pointer">删除</span>
      </el-button>
      <el-button class="charge-list" style="float: right;">
        <span class="shopping-cart-bot-font" style="margin-right: 40px;">总计：¥ {{totalPrice}}.0</span>
        <button class="go-charge-btn" @click="buy()">去结算</button>
      </el-button>
    </div>
  </div>
</template>

<script>
  export default {
    name: "ShoppingCar",
    data() {
      return {
        goods: [],
        totalPrice: 0,
        multipleSelection: [],
      }
    },
    methods: {
      toggleSelection(rows) {
        if (rows) {
          rows.forEach(row => {
            this.$refs.multipleTable.toggleRowSelection(row);
          });
        } else {
          this.$refs.multipleTable.clearSelection();
        }
      },
      deleteGoods() {
        let deleteCourseList = "";
        for (let i = 0; i < this.multipleSelection.length; i++) {
          deleteCourseList += `${this.multipleSelection[i].id},`;
        }
        $.ajax({
          url: 'http://127.0.0.1:8000/api/shopping/delete',
          type: 'DELETE',
          data: {'deleteCourseList': deleteCourseList, 'userToken': localStorage.getItem('access_token')},
          success: function (res) {
            console.log(res);
            location.reload();
          },
          error: function (err) {
            console.log(err);
          }
        });
      },
      handleSelectionChange(val) {
        this.totalPrice = 0;
        this.multipleSelection = val;
        for (let i = 0; i < this.multipleSelection.length; i++) {
          this.totalPrice += Number(this.multipleSelection[i].price);
        }
      },
      getGoods() {
        this.$http.shopCarList().then(res => {
          for (let i = 0; i < res.data.length; i++) {
            res.data[i]['courseImage'] = `http://127.0.0.1:8000/media/${res.data[i]['courseImage']}`
          }
          this.goods = res.data;
        }).catch(err => {
          console.log(err);
        })
      },
      buy() {
        let buyCourseList = "";
        for (let i = 0; i < this.multipleSelection.length; i++) {
          buyCourseList += `${this.multipleSelection[i].id},`;
        }
        $.ajax({
          url: 'http://127.0.0.1:8000/api/shopping/buy',
          type: 'PUT',
          data: {'buyCourseList': buyCourseList, 'userToken': localStorage.getItem('access_token')},
          success: function (res) {
            console.log(res);
          },
          error: function (err) {
            console.log(err);
          }
        });
        this.$router.push({name:"Settlement"});
      },
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
    height: 50px;
    outline: none;
    border: none;
    background: #ffc210;
    font-size: 18px;
    color: #fff;
  }
</style>
