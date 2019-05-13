<!--  -->
<template lang="html">
  <div class="page-register">
    <article class="header">
      <header>
        <img src='@/assets/images/logo2.png'>
        <span class="login">
          <em class="bold">已有美食地图账号?</em>
          <a href="/login">
            <el-button 
              type="primary" 
              size="small">登录</el-button>
          </a>
        </span>
      </header>
    </article>
    <section>
      <el-form 
        ref="ruleForm" 
        :model="ruleForm" 
        :rules="rules" 
        label-width="100px" 
        class="demo-ruleForm">
        <el-form-item 
          label="昵称" 
          prop="name">
          <el-input v-model="ruleForm.name"/>
        </el-form-item>
        <el-form-item 
          label="邮箱" 
          prop="email">
          <el-input v-model="ruleForm.email"/>
          <el-button 
            size="mini" 
            round 
            @click="sendMsg">发送验证码</el-button>
          <span class="status">{{ statusMsg }}</span>
        </el-form-item>
        <el-form-item 
          label="验证码" 
          prop="code">
          <el-input 
            v-model="ruleForm.code" 
            maxlength="6"/>
        </el-form-item>
        <el-form-item 
          label="密码" 
          prop="pwd">
          <el-input 
            v-model="ruleForm.pwd" 
            type="password"/>
        </el-form-item>
        <el-form-item 
          label="确认密码" 
          prop="cpwd">
          <el-input 
            v-model="ruleForm.cpwd" 
            type="password"/>
        </el-form-item>
        <el-form-item>
          <el-button 
            type="primary" 
            @click="register">同意以下协议并注册</el-button>
          <div class="error">{{ error }}</div>
        </el-form-item>
        <el-form-item>
          <a 
            href="https://www.meituan.com/about/terms" 
            target="_blank" 
            class="f1">《美食地图用户协议》
          </a>
        </el-form-item>
      </el-form>
    </section>
  </div>
</template>

<script>
// 用于加密
import CryptoJS from 'crypto-js'
export default {
    layout:'blank',
    data() {
        return {
          statusMsg:'',
          error:'',
          ruleForm:{
            name:'',
            code:'',
            pwd:'',
            cpwd:'',
            email:''
          },
          rules:{
            name:[{
              required:true,type:'string',message:'请输入昵称',trigger:'blur'
            }],
            email:[{
              required:true,
              type:'email',
              message:'请输入邮箱',
              trigger:'blur'
            }],
            pwd:[{
              required:true,
              message:'创建密码',
              trigger:'blur'
            }],
            cpwd:[{
              required:true,
              message:'确认密码',
              trigger:'blur'
            },{
              validator:(rule,value,callback)=>{
                if(value===''){
                  callback(new Error('请再次输入密码'))
                }else if(value!==this.ruleForm.pwd){
                  callback(new Error('两次输入密码不一样'))
                }else{
                  // callback一定要不然会影响验证
                  callback()
                }
              },
              trigger:'blur'
            }]
          }
        }
    },
    methods:{
      sendMsg:function(){
          const self=this;
          let namePass
          let emailPass
          if(self.timerid){
            return false
          }
          // 获取验证结果
          this.$refs['ruleForm'].validateField('name',valid=>{
            namePass=valid
          })
          // 清空提示
          self.statusMsg=''
          if(namePass){
            return false
          }
          this.$refs['ruleForm'].validateField('email',valid=>{
            emailPass=valid
          })
          // 如果有值表示错误
          if(!namePass&&!emailPass){
              self.$http.post('code',{
                // 中文编码
                // username:encodeURIComponent(self.ruleForm.name),
                receiver:self.ruleForm.email
              }).then(({
                status,data
              })=>{
                if(status==200&&data&&data.code===0){
                  let count=60;
                  self.statusMsg=`验证码已发送,剩余${count--}秒`
                  self.timerid=setInterval(function(){
                    self.statusMsg=`验证码已发送,剩余${count--}秒`
                    if(count===0){
                      clearInterval(self.timerid)
                     self.timerid=null
                    }
                  },1000)
                }else{
                  self.statusMsg=data.msg
                }
              })
          }
      },
      register:function(){
        let self=this;
        this.$refs['ruleForm'].validate((valid)=>{
            console.log(valid)
          if(valid){
            self.$http.post('add_user',{
              username:window.encodeURIComponent(self.ruleForm.name),
              password:CryptoJS.MD5(self.ruleForm.pwd).toString(),
              email:self.ruleForm.email,
              code:self.ruleForm.code
            }).then(({status,data})=>{
              if(status===200){
                
                if(data&&data.code===0){
                  location.href='/login'
                }else{
                  self.error=data.msg
                }
              }else{
                self.error=`服务器错误,错误码:${status}`
              }
              setTimeout(() => {
                self.error=''
              }, 1500);
            })
          }else{
            console.log('验证失败')
          }
        })
      }
    }
}

</script>
<style lang='scss' >
a{
  text-decoration:none;
}
@import '@/assets/css/register/index.scss';
</style>