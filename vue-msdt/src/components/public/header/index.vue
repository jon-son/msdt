<template>
  <div class="search-panel">
     <el-row type='flex' justify='space-around' class="m-header-searchbar">
      <el-col 
        class="left">
        <a href="/">
          <img 
            src="@/assets/images/logo2.png"
            alt="美团">
         </a>
      </el-col>
      <el-col 
        class="center">
        <div class="wrapper">
          <el-input 
            v-model="search"
            placeholder="搜索商家或地点"
            @focus="focus"
            @blur="blur"
            @input="input" />
          <button 
            class="el-button el-button--primary" 
            @click="toSearch"><i class="el-icon-search" /></button>
          <dl 
            v-if="isHotPlace"
            class="hotPlace">
            <dt>热门搜索</dt>
            <dd 
              v-for="(item,idx) in list"
              :key="idx">
              <a :href="'/products?keyword='+encodeURIComponent(item.name)">{{ item.name }}</a>
            </dd>
          </dl>
          <dl 
            v-if="isSearchList"
            class="searchList">
            <dd 
              v-for="(item,idx) in searchList"
              :key="idx">
              <a :href="'/products?keyword='+encodeURIComponent(item.name)">{{ item.name }}</a>
            </dd>
          </dl>
        </div>
        <p class="suggest">
          <a 
            v-for="(item,idx) in searchList"
            :key="idx"
            :href="'/products?keyword='+encodeURIComponent(item)">{{ item }}</a>
        </p>
      </el-col>
      <el-col 
        class="right">
        <p v-if='!userName'>
           <a class="login"  href="/register">注册</a>
           <a class="login"  href="/login">登陆</a>
        </p>
        <p v-else
        @click="exit">
          <span class="username">欢迎您,{{userName}}</span>
          <span class="exit-box">[<span class="exit">退出</span>]</span>
        </p>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      search: '',
      isFocus: false,
      hotPlace: [],
      searchList: [],
      userName:null,
      list:[]
    }
  },
  computed: {
    isHotPlace: function () {
      return this.isFocus && !this.search
    },
    isSearchList: function () {
      return this.isFocus && this.search
    }
  },
  components: {

  },
  created(){
    let list =this.$Store.localGet('history')||[]
    this.searchList=list.slice(-5)
    this.getUser();
    this.getList()
  },
  methods: {
     toSearch:function(){
      let history=this.$Store.localGet('history')||[]
      history.push(this.search)
      this.$Store.localSet('history',history)
      location.href=`/products?keyword=${this.search}`
    },
    focus: function () {
      this.isFocus = true
    },
    exit(){
      this.userName=null;
      this.$Store.localRemove('token')
    },
    getUser(){
      this.$http.get('user_inf')
      .then(res=>{
        console.log(res);
        const {user_inf,code} =res.data
        if(code===0&&user_inf){
          this.userName=user_inf.username
          console.log(this.userName)
        }
      })
    },
    getList(){
      this.$http.post('http://jox.ngrok.xiaomiqiu.cn/api/shop_list',{
         keyword:'热门'
      })
      .then(res=>{
        console.log(res);
        const {code,shop_list,msg}=res.data
        if(code===0&&shop_list){
          this.list=shop_list
        }
      })
    },
    blur: function () {
      let self = this;
      setTimeout(function () {
        self.isFocus = false
      }, 200)
    },
    input(){
      
    }
  }
};
</script>

<style scoped lang="scss" >
  .m-header-searchbar{
    width: 100%;
    padding: 0 200px;
  }
  .search-panel {
     background: #fff;
      .search-panel{
        width: 1190px;
        margin: 0 auto;
      }
      height: 157px;
      display: flex;
      padding: 20px 20px;
      background: #fff;
      align-items: flex-start;
      box-sizing: border-box;

      .left {
        // width: 280px;
        padding-top: 15px;
        img {
          width: 198px;
          height: 56px;
        }
      }
      .center {
        flex: 1;
        // justify-content: center;
        // display:flex;
        .wrapper {
          margin-top: 16px;
          border: 1px solid #13D1BE;
          border-radius: 4px;
          width: 552px;
          box-sizing: border-box;
          position: relative;
          white-space: nowrap;
          .el-input {
            width: 462px;
          }

          input {
            border: none;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
          }

          .el-button {
            width: 88px;
            border: none;
            background: #13D1BE;
            font-size: 16px;
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            vertical-align: -1px;

            i {
              font-weight: bold;
            }
          }
          .hotPlace,
          .searchList {
            position: absolute;
            top: 41px;
            left: 0;
            background: #fff;
            padding: 10px;
            font-size: 12px;
            width: 462px;
            box-sizing: border-box;
            border: 1px solid #E5E5E5;
            border-top: none;
            z-index: 999;
            box-shadow: 0 3px 5px 0 rgba(0, 0, 0, .1);
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;

            dt {
              color: #999;
              font-weight: bold;
            }

            dd {
              display: inline-block;
              color: #666;
              margin-right: 10px;
              margin-bottom: 3px;
              margin-top: 5px;
              cursor: pointer;

              &:hover {
                background: #F8F8F8;
                color: #31BBAC;
              }
            }

            &.searchList {
              padding: 0;
              margin: 0;
              dd {
                margin: 0;
                padding: 3px 10px;
                display: block;
                line-height: 1.6;
              }
            }
          }
        }

        .suggest {
          width: 552px;
          overflow: hidden;
          padding-left: 16px;
          line-height: 1;
          margin-top: 8px;
          a {
            color: #999;
            margin-right: 10px;
            margin-bottom: 3px;
            display: inline-block;
            font-size: 12px;

            &:hover {
              color: #31BBAC;
            }
          }
        }

        .nav {
          list-style: none;
          display: flex;
          margin-top: 25px;

          li {
            font-weight: 700;
            font-size: 16px;
            margin: 0 20px;
            cursor: pointer;
            position: relative;

            a {
              color: #222;

              &:hover {
                color: #f04d4e;
              }

              &.takeout:hover {
                color: #fbc700;
              }

              &.apartment:hover {
                color: #FDC411;
              }

              &.business:hover {
                color: #31BBAC;
              }
            }
          }
        }
      }

      .right {
        p{
          height: 100%;
          display: flex;
          align-items: center;
          justify-content: center;
          .username{
            color: #666;
            font-size: 16px;
          }
          .exit-box{
             color: #666;
            font-size: 16px;
            margin-left: 10px;
              cursor: pointer;

            .exit{
              color: #13D1BE;
              margin: 0 6px;
            }
          }
          .login{
            color:#13D1BE;
            font-size: 16px;
            margin-right: 10px;
            text-decoration:none;
            cursor:pointer;
            &:hover{
              text-decoration:underline
            }
          }
        }
      }
    }
</style>
