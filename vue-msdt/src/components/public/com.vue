<template>
  <el-container class="layout-default">
    <el-header height="120px">
      <my-header/>
    </el-header>
    <el-main >
      <router-view></router-view>
    </el-main>
     <el-footer height='100px'>
      <Footer/>
    </el-footer>
  </el-container>
</template>

<script>
  import MyHeader from '@/components/public/header/index.vue'
  import Footer from '@/components/public/footer/index.vue'
  export default {
    components:{
      MyHeader,
      Footer
    }
  }
</script>
<style lang='scss'>
.layout-default{
  display: flex;
  flex-direction: column;
  height: 100vh;
  .el-header{
  background: #fff;
}
  .el-main{
    flex:1;
    background:#f8f8f8;
    width:100%;
  }
  .el-footer{
    background:#ffffff;
  }
}

</style>
