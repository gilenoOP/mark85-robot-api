from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://Gileno:123456GOP@cluster0.l31qerx.mongodb.net/markdb?retryWrites=true&w=majority&appName=Cluster0')

db = client['markdb']

@keyword('Remove user from database')
def remove_user(email):
    users = db['users']
    users.delete_many({'email':email})
    print('removing user by ' + email)

@keyword('Insert user from database')
def insert_user(user):
    # doc = {
    #     'name': name,
    #     'email': email,
    #     'password': password
    # }
    users = db['users']
    # users.insert_one(doc)
    # print('insert user ' + str(doc))
    users.insert_one(user)
    print('insert user ' + str(user))