<template>
  <div class="page-detail">
    <el-row>
      <el-col :span="24">
        <crumbs
          :keyword="keyword"
          :type="type"/>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="24">
        <summa :meta="product"/>
      </el-col>
    </el-row>
    <el-row class="m-title">
      <el-col :span="24">
        <h3>商家菜单</h3>
      </el-col>
    </el-row>
    <el-row >
      <el-col :span="24">
        <list
          :list="food_list"/>
      </el-col>
    </el-row> 
       <el-row class="m-title">
      <el-col :span="24">
        <h3>精选评论</h3>
      </el-col>
    </el-row>
    <el-row >
      <el-col :span="24">
        <div class='commen-wrap'>
            <div class='commen-box' v-for='(item,index) in comment_list' 
            :key='index'>
                <h1>{{item.username}}</h1>
                <p class='date'> {{item.create_time}}</p>
                <div class='center'>
                    <span class='text'>打分</span>
                    <el-rate
                    style='font-size:10px'
                    v-model="item.rate"
                    disabled
                    show-score
                    text-color="#ff9900"
                    >
                    </el-rate>
                </div>
                <p>{{item.comment_text}}</p>
            </div>
            <el-input
            type="textarea"
            :rows="3"
            placeholder="请输入评论"
            v-model="textarea">
            </el-input>
             <el-rate style='margin:20px 0' v-model="value1"></el-rate>
            <el-button 
            @click='submit'
            type="primary">评论</el-button>
        </div>
      </el-col>
    </el-row> 
  </div>
</template>

<script>
import Crumbs from '@/components/detail/crumbs.vue';
import Summa from '@/components/detail/summary.vue';
import List from '@/components/detail/list.vue';
export default {
  data() {
    return {
        value1:0,
        textarea:'',
        keyword:'',
        type:'',
        product:{},
        food_list:[],
        comment_list:[]
    };
  },
  created () {
    this.getInfo()
    this.getComments()
    this.getFoods()
  },
  methods: {
    getInfo(){
      this.$http.post('shop_inf',{
         shop_id:1
      })
      .then(res=>{
        const {code,shop_inf}=res.data
        if(code==0&&shop_inf){
          this.product=shop_inf
        }
      })
    },
     getComments(){
      this.$http.post('comment_list',{
         shop_id:1
      })
      .then(res=>{
        const {code,comment_list}=res.data
        if(code==0&&comment_list){
          this.comment_list=comment_list
        }
      })
    },
     getFoods(){
      this.$http.post('food_list',{
         shop_id:1
      })
      .then(res=>{
        const {code,food_list}=res.data
        if(code==0&&food_list){
          this.food_list=food_list
        }
      })
    },
    submit(){
      if(this.textarea==''){
        this.$message.warning('请输入评论')
        return
      }
      if(this.value1==0){
        this.$message.warning('请评分')
        return
      }
      this.$http.post('add_comment',{
        text:this.textarea,
        rate:this.value1,
        shop_id:1
      }).then(res=>{
        const {code,msg} = res.data
        if(code===0){
          this.$message.success('评论成功')
          this.getComments()
        }
        else if(code===1004){
           this.$confirm('清先登陆再评论', '提示', {
          confirmButtonText: '立刻登陆',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$router.push('/login')
        }).catch(() => {
                   
        });
        }
        else{
          this.$message.error(msg)
        }
      })
    }
  },
  components: {
    Crumbs,
    Summa,
    List
  },
};
</script>

<style  lang="scss" >
    .page-detail{
        width:1200px;
        margin:0 auto;
    }
    .commen-wrap{
        list-style: none;
        background-color: #fff;
        padding: 20px;
        margin-bottom: 10px;
        border-radius: 4px;
        border: 1px solid #E5E5E5;
        .commen-box{
            background:#f8f8f8;
            padding:10px;
            margin-bottom:20px;
            border-radius:8px;
            h1{
                font-size:18px;
            }
            .date{
                font-size:12px;
                color:#999;
            }
            .center{
                display:flex;
                margin:6px 0;
                font-size:14px;
                align-items: center;
                
                .el-rate__icon{
                    font-size:12px;
                    line-height:20px;
                }
                .text{
                    margin-right:20px;
                }
            }
        }
    }
    
     @import "@/assets/css/detail/index.scss";
</style>
