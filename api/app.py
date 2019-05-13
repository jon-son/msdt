# -*- coding: utf-8 -*-
# by jonson 2018/10/27
from flask import Flask,send_file,jsonify,render_template,redirect
from flask_restful import Api,request, reqparse,Resource
from flask_cors import CORS
from jox_restful import Shop,Upload,User
import json

app = Flask(__name__)
CORS(app, supports_credentials=True)
api = Api(app)


# 设置路由

api.add_resource(Upload.UploadRoute, '/api/upload')

api.add_resource(Shop.GetShopRoute, '/api/shop_list')
api.add_resource(Shop.GetShopInfoRoute, '/api/shop_inf')

api.add_resource(Shop.GetCommentRoute, '/api/comment_list')
api.add_resource(Shop.AddCommentRoute, '/api/add_comment')

api.add_resource(Shop.GetFoodRoute, '/api/food_list')

api.add_resource(User.LoginRoute, '/api/login')
api.add_resource(User.AddUserRoute, '/api/add_user')
api.add_resource(User.GetCodeRoute, '/api/code')
api.add_resource(User.GetUserRoute, '/api/user_inf')

if __name__ == '__main__':
    app.run(host='127.0.0.1',port=8081)
