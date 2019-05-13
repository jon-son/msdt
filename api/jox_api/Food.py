from jox_api import Mysql,Utils
import json

class Food():
    def __init__(self):
        self.mysqlClass = Mysql.MySQL()
        self.timeClass = Utils.Time()
    def get_food(self,shop_id):
        try:
            self.sql = "select * from food where shop_id=%s " %(shop_id)
            self.resql = self.mysqlClass.select_data(self.sql)
            if self.resql['state'] != 'E':

                return {'code':0,'msg': '获取食物成功','food_list':self.resql['alldata']}
            else:
                return {'code': -1, 'msg': '获取食物失败'}

        except Exception as e:
            print(e)
            return {"code": -1, "data": {"msg": str(e)}}

