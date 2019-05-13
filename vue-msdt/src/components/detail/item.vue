<template>
  <li
    class="m-detail-item">
    <dl class="section">
      <dd>
        <img
          :src="meta.img">
      </dd>
      <dd>
        <h4>{{ meta.name }}</h4>
        <p>
         
        </p>
        <p>
          <span class="price">{{ meta.price }}</span>
          <sub>门店价{{ meta.price}}</sub>
        </p>
      </dd>
      <dd>
        <el-button
          type="warning"
          round
          @click="createCart">立即抢购</el-button>
      </dd>
    </dl>
  </li>
</template>

<script>
export default {
  props: {
    meta: {
      type: Object,
      default: () => {
        return {}
      }
    }
  },
  methods: {
    createCart(){
      
    }
  }
}
</script>

<style lang="scss">
 

</style>
