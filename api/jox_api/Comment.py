from jox_api import Mysql,Utils
import json

class Comment():
    def __init__(self):
        self.mysqlClass = Mysql.MySQL()
        self.timeClass = Utils.Time()
    def get_comment(self,shop_id):
        try:
            self.sql = "select * from get_comment where shop_id=%s " %(shop_id)
            self.resql = self.mysqlClass.select_data(self.sql)
            if self.resql['state'] == 'T':
                self.data = self.resql['alldata'][0]

                self.sql1 = "select * from comment_img where comment_id=%s " % (self.data['id'])
                self.resql1 = self.mysqlClass.select_data(self.sql1)
                if self.resql1['state']=='T':
                    self.data['imgs'] = self.resql1['alldata']
                else:
                    self.data['imgs'] = []

                return {'code':0,'msg': '获取评论成功','comment_list':self.resql['alldata']}
            else:
                return {'code': -1, 'msg': '获取评论失败'}

        except Exception as e:
            print(e)
            return {"code": -1,"msg": str(e)}

    def add_comment(self,data,user_id):
        try:
            # data.imgs = json.loads(data.imgs)
            self.create_time = self.timeClass.get_time()
            self.sql = '''
               INSERT INTO comment (shop_id,user_id,comment_text,rate,create_time) 
               VALUES (%s,%s,\'%s\',%f,\'%s\')
               ''' % (data.shop_id, user_id, data.text, data.rate, self.create_time)

            self.resql = self.mysqlClass.add_insert(self.sql, "")
            self.conn = self.resql['conn']
            self.cur = self.resql['cur']
            self.comment_id = self.cur.lastrowid
            # for img in data.imgs:
            #     self.create_time = self.timeClass.get_time()
            #     self.sql = '''
            #                INSERT INTO comment_img (comment_id,comment_img,create_time)
            #                VALUES (%s,\'%s\',\'%s\')
            #                ''' % (self.comment_id, img, self.create_time)
            #
            #     self.resql = self.mysqlClass.add_insert(self.sql, self.conn)
            #     self.conn = self.resql['conn']

            self.sql = "UPDATE shop SET rate=(rate*comment+%s)/(comment+1), comment=comment+1 WHERE id=%s" % (data.rate,data.shop_id)
            self.resql = self.mysqlClass.add_insert(self.sql, self.conn)
            self.conn = self.resql['conn']

            self.resql = self.mysqlClass.commit_inserst(self.conn)
            if self.resql['state'] == 'T':

                return {'code': 0, 'msg': '添加评论成功'}
            else:
                return {'code': -1, 'msg': '添加评论失败'}
        except Exception as e:
            print(e)
            return {"code": -1, "msg": str(e)}
