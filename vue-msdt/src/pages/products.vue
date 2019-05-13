<template>
  <div class='container'>
    <div class="m-products-list">
      <dl>
        <dd
          v-for="(item,index) in nav"
          :key="item.name"
          :class="[item.name,index==key?'s-nav-active':'']"
          @click="navSelect(index)"
        >{{ item.txt }}</dd>
      </dl>
      <ul>
        <Item
          v-for="(item,idx) in list"
          :key="idx"
          :meta="item"/>
      </ul>
      <div v-if='list.length==0' class='no-message'>无匹配数据</div>
    </div>
  </div>
</template>

<script>
import Item from '@/components/products/product.vue'
export default {
  data() {
    return {
      list:[],
      key:0,
      nav: [
        {
          name: 's-price',
          txt: '价格最低',
          active: true
        }, {
          name: 's-comment',
          txt: '评价最高',
          active: false
        }
      ],
      
    };
  },
    created () {
    this.getList()
  },
  methods: {
    getList(){
      this.$http.post('http://jox.ngrok.xiaomiqiu.cn/api/shop_list',{
         keyword:this.$route.query.keyword
      })
      .then(res=>{
        const {code,shop_list,msg}=res.data
        if(code===0&&shop_list){
          this.list=shop_list.sort((a,b)=>{
              return a.price-b.price
            })
        }else{
          this.$message.error(msg)
        }
      })
    },
        navSelect: function (index) {
          this.key=index
          if(index==0){
            this.list=this.list.sort((a,b)=>{
              return a.price-b.price
            })
            return 
          }
          if(index==1){
            this.list=this.list.sort((a,b)=>{
              return b.rate-a.rate
            })
          }
        }
      },
 components: {
    Item
  },
};
</script>

<style scoped lang="scss" >
  .no-message{
    line-height:100px;
    font-size:18px;
    text-align:center;
    color:#999;
  }
  .container{
    width:1000px;
    margin:0 auto;
  }
  .m-products-list {
      box-sizing: border-box;
      margin-top: 10px;
      background: #FFF;
      border: 1px solid #E5E5E5;
      border-radius: 4px;
      color: #333;
      font-size: 14px;
      line-height: 20px;
      padding: 11px 20px;
      >dl {
        dd {
          width: 96px;
          height: 20px;
          display: inline-block;
          box-sizing: border-box;
          text-align: center;
          cursor: pointer;

          &.s-nav-active {
            color: #31BCAD;
          }
        }

        padding-bottom: 2px;

        .s-price {
          position: relative;

          &:before,
          

          &:after {
            top: 12px;
            border-bottom-color: transparent;
            border-top-color: #ddd;
          }
        }
      }

      >ul {
        list-style: none;
        padding: 11px 0;
      }
    }
</style>
