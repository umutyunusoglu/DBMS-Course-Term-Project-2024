
import firebase_admin
from firebase_admin import firestore,credentials
from google.cloud.firestore_v1 import FieldFilter
import os


def init_db():
    cred = credentials.Certificate('phase_3\credentials.json')
    app = firebase_admin.initialize_app(cred)
    db = firestore.client()

    return db

def add_user(name,password,db):
    try:
        doc_ref = db.collection(u'users').document(name)

        doc_ref.set({
            "name": name,
            "password": password,
            "type": "user",
            "cases": []
        })
        return True
    except:
        return False
    

def update_user(user,db):
    
    try:
        user_ref=db.collection(u'users').document(user["name"])
        user_ref.set(user)
        return True
    except:
        return False

def add_case(name,subject,message,db):
    try:
        user_ref=db.collection(u'users').document(name)

        user = user_ref.get().to_dict()

        case={
            "subject": subject,
            "message": message,
            "status": "open",
            "chat_history": [
                {
                    "sender": "user",
                    "message": message},
            ]
        }

        user["cases"].append(case)
        
        user_ref.set(user)


        return True
    except:
        return False

def get_cases(user:None,db):
    if(user==None):
        cases = []
    else:
        user_ref=db.collection(u'users').document(user)

        user = user_ref.get().to_dict()

        cases = user["cases"]

 
    return cases




def get_users(db):
    users = db.collection(u'users').stream()
    users_list = []
    for user in users:
        users_list.append(user.to_dict())
    return users_list

    

def validate_user(name,password,db):
    doc_ref = db.collection(u'users').document(name)
    doc = doc_ref.get()
    if doc.exists:
        if doc.to_dict()["password"]==password:
            return True
    return False



if __name__ == "__main__":
    db = init_db()
    
    print("x")
    users= db.collection(u'users').stream()
    print("y")

    print(users)
    for user in users:
        print(user)
        print("a")
        print(user.to_dict())
