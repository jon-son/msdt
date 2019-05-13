<template>
  <div class="container">
      <Map :shopList='list' class='map' :height=700 :width=1190 />
  </div>
</template>

<script>
  import Map from '@/components/public/map.vue'

export default {
  data() {
    return {
      list:[]
    };
  },
  created () {
    this.getList()
  },
  methods: {
    getList(){
      this.$http.post('http://jox.ngrok.xiaomiqiu.cn/api/shop_list',{
        keyword:''
      })
      .then(res=>{
        const {code,shop_list,msg}=res.data
        if(code===0&&shop_list){
          this.list=shop_list.map(item=>{
            item.position=[item.lng,item.lat]
            return item
          })
        }
      })
    }
  },
  components: {
      Map,
  },
};
</script>

<style scoped lang="scss" >
  .container{
    width:100%;
    .map{
    margin:0 auto;

    }
  }
</style>
