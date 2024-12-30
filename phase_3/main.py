import flask
from flask import request, jsonify,render_template
import database_utils

db=database_utils.init_db()



app = flask.Flask(__name__)


@app.route("/",)
def home():

    users= database_utils.get_users(db)

    return render_template('index.html',users=users)

@app.route("/register")
def register():

    return render_template('register.html')

@app.route("/register/add_user",methods=["POST"])
def add_user():
    data=request.get_json()
    
    name=data["name"]
    password=data["password"]

    users= database_utils.get_users(db)

    for user in users:
        if user["name"]==name:
            return "failed"

    app.logger.debug(f"Adding user {name} with password {password}")
    
    result= database_utils.add_user(name,password,db)
    
    if result:
        return "success"
    else:
        return "failed"


@app.route("/support/<string:username>")
def support(username):

    cases= database_utils.get_cases(username,db)

    return render_template('support.html',username=username,cases=cases)

@app.route("/support/<string:username>/add_case",methods=["POST"])
def add_case(username):

    data=request.get_json()
    
    subject=data["subject"]
    message=data["message"]

    app.logger.debug(f"Adding case {subject} with status {message} for user {username}")
    
    result= database_utils.add_case(username,subject,message,db)
    
    if result:
        return "success"
    else:
        return "failed"

@app.route("/support/<string:username>/add_message",methods=["POST"])
def post_message(username):

    data=request.get_json()
    subject=data["subject"]
    case_id=data["case_id"]
    message=data["message"]


    users= database_utils.get_users(db)

    user=None

    for user in users:
        if user["name"]==username:
            cases=user["cases"]
            break

    app.logger.debug(case_id)
    for i,case in enumerate(cases):
        app.logger.debug(case)
        
        if case["subject"]==subject and i==int(case_id):
            app.logger.debug("found case")
            case["chat_history"].append({"sender":"user","message":message})
            break
    
    app.logger.debug(user["cases"])

    user["cases"][int(case_id)]=case

    result=database_utils.update_user(user,db)

    if result:
        app.logger.warning("success")
        return "success"
    else:
        app.logger.warning("failed") 
        return "failed"



@app.route("/admin")
def admin():

    users= database_utils.get_users(db)

    users_filtered=[]
    for user in users:
        if user["type"]=="user":
            users_filtered.append(user)
    
    

    return render_template('admin.html',users=users_filtered)

@app.route("/admin/response",methods=["POST"])
def response():

    data=request.get_json()
    username=data["username"]
    subject=data["subject"]
    case_id=data["case_id"]
    message=data["message"]

    users= database_utils.get_users(db)

    user=None
    
    for user in users:
        if user["name"]==username:
            cases=user["cases"]
            break
    
    for i,case in enumerate(cases):
        if case["subject"]==subject and str(i)==case_id:
            case["chat_history"].append({"sender":"admin","message":message})
            break
        

    user["cases"][int(case_id)]=case

   

    result=database_utils.update_user(user,db)
    
    if result:
        app.logger.warning("success")
        return "success"
    else:
        app.logger.warning("failed") 
        return "failed"
    




if __name__ == "__main__":


    app.run(debug=True)