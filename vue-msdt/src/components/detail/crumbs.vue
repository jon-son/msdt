<template>
  <div class="m-crumbs">
    <el-breadcrumb separator=">">
      <el-breadcrumb-item :to="{ path: '/' }">美食地图</el-breadcrumb-item>
      <el-breadcrumb-item>{{ decodeURIComponent(keyword) }}</el-breadcrumb-item>
    </el-breadcrumb>
  </div>
</template>

<script>
export default {
  props: {
    keyword: {
      type:String,
      default:''
    },
    type: {
      type:String,
      default:''
    }
  },
  data(){
    return{
      position:{
        city:'深圳'
      }
    }
  }
}
</script>
