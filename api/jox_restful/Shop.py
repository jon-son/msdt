from flask_restful import reqparse, Resource,request
from jox_api import Shop,Auth,Comment,Token,Food
import hashlib
import os
import json

class GetShopRoute(Resource):
    @Auth.permission(identifier="any")
    def post(self):
        try:
            self.parser = reqparse.RequestParser()
            self.shopClass = Shop.Shop()
            self.parser.add_argument('keyword', type=str, help='keyword: type is str')
            self.args = self.parser.parse_args()
            self.keyword = self.args['keyword']
            self.restatus = self.shopClass.get_shop(self.keyword)

            return self.restatus, 200
        except Exception as e:
            print(e)
            return {"code":-1,"msg":str(e)},200

class GetShopInfoRoute(Resource):
    @Auth.permission(identifier="any")
    def post(self):
        try:
            self.shopClass = Shop.Shop()
            self.parser = reqparse.RequestParser()
            self.parser.add_argument('shop_id', type=str, help='shop_id: type is str')
            self.args = self.parser.parse_args()
            self.shop_id = self.args['shop_id']
            self.restatus = self.shopClass.get_shop_info(self.shop_id)
            return self.restatus, 200

        except Exception as e:
            print(e)
            return {"code":-1,"msg":str(e)},200

class GetFoodRoute(Resource):
    @Auth.permission(identifier="any")
    def post(self):
        try:
            self.foodClass = Food.Food()
            self.parser = reqparse.RequestParser()
            self.parser.add_argument('shop_id', type=str, help='shop_id: type is str')
            self.args = self.parser.parse_args()
            self.shop_id = self.args['shop_id']
            self.restatus = self.foodClass.get_food(self.shop_id)
            return self.restatus, 200

        except Exception as e:
            print(e)
            return {"code":-1,"msg":str(e)},200


class GetCommentRoute(Resource):
    @Auth.permission(identifier="any")
    def post(self):
        try:
            self.commentClass = Comment.Comment()
            self.parser = reqparse.RequestParser()
            self.parser.add_argument('shop_id', type=str, help='shop_id: type is str')
            self.args = self.parser.parse_args()
            self.shop_id = self.args['shop_id']
            self.restatus = self.commentClass.get_comment(self.shop_id)
            return self.restatus, 200

        except Exception as e:
            print(e)
            return {"code":-1,"msg":str(e)},200

class AddCommentRoute(Resource):
    @Auth.permission(identifier="token")
    def post(self):
        try:
            self.commentClass = Comment.Comment()
            tokenClass = Token.Token()

            self.parser = reqparse.RequestParser()
            self.parser.add_argument('shop_id', type=str, help='shop_id: type is str')
            self.parser.add_argument('text', type=str, help='shop_id: type is str')
            self.parser.add_argument('rate', type=int, help='rate: type is int')
            self.parser.add_argument('imgs', type=str, help='shop_id: type is str')

            self.token = request.headers['token']
            validate_token = tokenClass.validate(self.token)
            self.args = self.parser.parse_args()
            self.user_id = validate_token["user_id"]

            # self.user_id = 4
            self.restatus = self.commentClass.add_comment(self.args,self.user_id)
            return self.restatus, 200

        except Exception as e:
            print(e)
            return {"code":-1,"msg":str(e)},200