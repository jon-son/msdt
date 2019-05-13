<!--  -->
<template lang="html">
  <div 
    :id="id" 
    :style="{width:width+'px',height:height+'px',margin:'34rpx auto'}" 
    class="m-map"/>
</template>

<script>
import { setTimeout } from 'timers';
export default {
    props:{
        width:{
            type:Number,
            default:300
        },
        height:{
            type:Number,
            default:300
        },
        point:{
            type:Array,
            default(){
                return [113.9501400000,22.5855700000]
            }
        },
        shopList:{
            type:Array,
            default(){
                return []
            }
        }
    },
    data() {
        return {
            id:`map`,
            key:'b366873e9dc6e3e0dce51b91d487d372'
        }
    },
    watch:{
        point:function(val,old){
            this.map.setCenter(val)
            this.marker.setPosition(val)
            this.map.add(marker);
        },
        shopList:function(val,old){
           this.Map(val)
            
        }
    },
    created(){
        this.Map([])
    },
    methods:{

        Map(val){
            let self =this;
            self.id=`map${Math.random().toString().slice(4,6)}`
            window.onmaploaded = () => {
                var map = new window.AMap.Map(self.id, {
                    resizeEnable: true,
                    center: self.point,
                    zoom: 18
                });
                self.map=map
                this.addMarker(val)
                    }
                    const url = `https://webapi.amap.com/maps?v=1.4.14&key=${self.key}&callback=onmaploaded`
            let jsapi = document.createElement('script')
            jsapi.charset = 'utf-8'
            jsapi.src=url
            document.head.appendChild(jsapi)
        },
         //添加marker标记
        addMarker(val) {
            
            let self=this;
            this.map.clearMap();
            let list =val
            var marker = []
            var title=[]
            for(let i=0;i<list.length;i++){
                marker[i] = new window.AMap.Marker({
                map: self.map,
                position: list[i].position
            });
            this.map.add(marker)
                //实例化信息窗体
           
            //鼠标点击marker弹出自定义的信息窗体
            AMap.event.addListener(marker[i], 'click', function () {
                     title[i] = `${list[i].name}<span style="font-size:11px;color:#F00;">价格:${list[i].price}</span>`;
                    var content = [];
                    content.push(`<img style="height:66px;width:100px" src='${list[i].img}'>地址：${list[i].address}`);
                    content.push(`电话：${list[i].tel}`);
                    content.push(`<a href='/detail?id=${list[i].id}'>详细信息</a>`);
                    var infoWindow = new window.AMap.InfoWindow({
                        isCustom: true,  //使用自定义窗体
                        content: self.createInfoWindow(title[i], content.join("<br/>")),
                        offset: new window.AMap.Pixel(16, -45)
                    });
                infoWindow.open(self.map, marker[i].getPosition());
            });
            }
        },
         //构建自定义信息窗体
        createInfoWindow(title, content) {
            let self=this;
            var info = document.createElement("div");
            info.className = "custom-info input-card content-window-card";

            //可以通过下面的方式修改自定义窗体的宽高
            //info.style.width = "400px";
            // 定义顶部标题
            var top = document.createElement("div");
            var titleD = document.createElement("div");
            var closeX = document.createElement("img");
            top.className = "info-top";
            titleD.innerHTML = title;
            closeX.src = "https://webapi.amap.com/images/close2.gif";
            closeX.onclick = self.closeInfoWindow;

            top.appendChild(titleD);
            top.appendChild(closeX);
            info.appendChild(top);

            // 定义中部内容
            var middle = document.createElement("div");
            middle.className = "info-middle";
            middle.style.backgroundColor = 'white';
            middle.innerHTML = content;
            info.appendChild(middle);

            // 定义底部内容
            var bottom = document.createElement("div");
            bottom.className = "info-bottom";
            bottom.style.position = 'relative';
            bottom.style.top = '0px';
            bottom.style.margin = '0 auto';
            var sharp = document.createElement("img");
            sharp.src = "https://webapi.amap.com/images/sharp.png";
            bottom.appendChild(sharp);
            info.appendChild(bottom);
            return info;
        },
        //关闭信息窗体
        closeInfoWindow() {
            this.map.clearInfoWindow();
        }
    }
}

</script>
<style lang='scss' >
    .content-window-card {
            position: relative;
            box-shadow: none;
            bottom: 0;
            left: 0;
            width: auto;
            padding: 0;
        }

        .content-window-card p {
            height: 2rem;
        }

        .custom-info {
            border: solid 1px silver;
        }

        div.info-top {
            position: relative;
            background: none repeat scroll 0 0 #F9F9F9;
            border-bottom: 1px solid #CCC;
            border-radius: 5px 5px 0 0;
        }

        div.info-top div {
            display: inline-block;
            color: #333333;
            font-size: 14px;
            font-weight: bold;
            line-height: 31px;
            padding: 0 10px;
        }

        div.info-top img {
            position: absolute;
            top: 10px;
            right: 10px;
            transition-duration: 0.25s;
        }

        div.info-top img:hover {
            box-shadow: 0px 0px 5px #000;
        }

        div.info-middle {
            font-size: 12px;
            padding: 10px 6px;
            line-height: 20px;
        }

        div.info-bottom {
            height: 0px;
            width: 100%;
            clear: both;
            text-align: center;
        }

        div.info-bottom img {
            position: relative;
            z-index: 104;
        }

        span {
            margin-left: 5px;
            font-size: 11px;
        }

        .info-middle img {
            float: left;
            margin-right: 6px;
        }
</style>