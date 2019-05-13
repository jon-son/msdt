from jox_api import Mysql


class Shop():
    def __init__(self):
        self.mysqlClass = Mysql.MySQL()
    def get_shop(self,keyword):
        try:
            self.sql = "select * from shop where CONCAT(name,module,scene,type,address) like \'%%%s%%\' " %(keyword)
            self.resql =  self.mysqlClass.select_data(self.sql)
            if self.resql['state'] != 'E':
                for shop in self.resql['alldata']:
                    if shop['status']==1:
                        shop['status']="营业中"
                    else:
                        shop['status'] = '停止营业'
                return {'code':0,'shop_list':self.resql['alldata'],'msg': '获取商铺列表成功'}
            else:
                return {'code': -1, 'msg': '获取商铺列表失败'}
        except Exception as e:
            print(e)
            return {"code": -1, "data": {"msg": str(e)}}, 500
    def get_shop_info(self,shop_id):
        try:
            self.sql = "select * from shop where id=%s " %(shop_id)
            self.resql =  self.mysqlClass.select_data(self.sql)
            if self.resql['state'] == 'T':
                return {'code': 0, 'shop_inf': self.resql['alldata'][0], 'msg': '获取商铺详情成功'}
            else:
                return {'code': -1, 'msg': '获取商铺详情失败'}
        except Exception as e:
            print(e)
            return {"code": -1, "data": {"msg": str(e)}}, 500