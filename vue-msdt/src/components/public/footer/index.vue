<template>
  <div class="container">
    <ul>
      <li>首页</li>
      <li>美食地图</li>
      <li>美食推荐</li>
      <li>美食排行</li>
    </ul>
    <p>© 2019 美食地图有限公司 京ICP证080268号</p>
  </div>
</template>

<script>
export default {
  data() {
    return {

    };
  },
  components: {

  },
};
</script>

<style scoped lang="scss" >
  .container{
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    ul{
      list-style:none;
      display: flex;
      justify-content: center;
      li{
        font-size: 12px;
         color: #a4a4a4;
         margin-right: 20px;
      }
    }
    p{
      font-size: 12px;
      color: #bcbcbc;
      margin-top: 16px;
    }
  }
</style>
