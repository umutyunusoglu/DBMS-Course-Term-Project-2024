from flask import Flask, request, render_template, flash
from mysql.connector import connect, Error
import mysql.connector





def get_db_connection():
    return mysql.connector.connect(
    host='localhost',
    port=3307,
    user='root',
    password='',
    database='dnd'
)
app = Flask(__name__)

# Set the secret key for session management
app.config['SECRET_KEY'] = 'your_secret_key_here'  # Replace with a unique, secret key

# Route to handle form submission and display success message
@app.route('/', methods=['GET', 'POST'])
def home():
    connection = get_db_connection()
    if request.method == 'POST':
        if "npc" in request.form:

            app.logger.warning('NPC')
            # Process NPC form data
            npc_data = {
                "faction": request.form.get("faction"),
                "name": request.form.get("name"),
                "wis": request.form.get("wis"),
                "int_": request.form.get("int_"),
                "con": request.form.get("con"),
                "chr": request.form.get("chr"),
                "dex": request.form.get("dex"),
                "str": request.form.get("str"),
                "type": request.form.get("type"),
                "alignment": request.form.get("alignment"),
                "class_id": request.form.get("class_id"),
                "species_id": request.form.get("species_id"),
                "diety_id": request.form.get("diety_id")
            }

            try:
                connection.cursor().execute(
                    """
                    INSERT INTO npc (faction, name, wis, int_, con, chr, dex, str, type, aligment, class_id, species_id, diety_id)
                    VALUES (%(faction)s, %(name)s, %(wis)s, %(int_)s, %(con)s, %(chr)s, %(dex)s, %(str)s, %(type)s, %(alignment)s, %(class_id)s, %(species_id)s, %(diety_id)s)
                    """,
                    npc_data
                )

                connection.commit()
                app.logger.debug("NPC data saved successfully!")
                flash("NPC data saved successfully!", "success")
            except Error as e:
                app.logger.warning(e.msg)
                flash("Error saving NPC data!", "error")

            
        
        elif "class" in request.form:
            # Process Class form data

            class_data = {}
         
            class_data["name"] = request.form.get("name")
            class_data["role"] = request.form.get("role")
            class_data["explanation"] = request.form.get("explanation")
            class_data["main_attribute"] = request.form.get("main_attribute")

            try:
                connection.cursor().execute(
                    """
                    INSERT INTO classes (name, role, explanation, main_attribute)
                    VALUES (%(name)s, %(role)s, %(explanation)s, %(main_attribute)s)
                    """,
                    class_data
                )

                connection.commit()
                app.logger.debug("Class data saved successfully!")
                flash("Class data saved successfully!", "success")
            except Error as e:
                app.logger.warning(e.msg)
                flash("Error saving Class data!", "error")



            
        
        elif "skill" in request.form:   
            # Process Skill form data

            skill_data = {}
            skill_data["class_id"] = request.form.get("class_id")
            skill_data["skill_name"] = request.form.get("skill_name")
            skill_data["level"] = request.form.get("level")
            skill_data["explanation"] = request.form.get("explanation")
            skill_data["type"] = request.form.get("type")
            
            try:   
                connection.cursor().execute(
                    """
                    INSERT INTO skills (class_id, skill_name, level, explanation, type)
                    VALUES (%(class_id)s, %(skill_name)s, %(level)s, %(explanation)s, %(type)s)
                    """,
                    skill_data
                )

                connection.commit()
                app.logger.debug("Skill data saved successfully!")
                flash("Skill data saved successfully!", "success")

            except Error as e:
                app.logger.warning(e.msg)
                flash("Error saving Skill data!", "error")

                



            

    return render_template('index.html')




@app.route("/trigger", methods=["GET", "POST"])
def trigger():
    output = None

    if request.method == "POST":
        procedure_name = request.form.get("procedure_name")
        name_value = request.form.get("name_value")  # Get the name value input from the form

        try:
            conn = get_db_connection()
            cursor = conn.cursor(dictionary=True)  # Use dictionary=True to fetch results as dictionaries

            # Call the stored procedure dynamically based on user selection
            if procedure_name == "FindClass":
                cursor.callproc("FindClass", (name_value,))
            elif procedure_name == "FindNPC":
                cursor.callproc("FindNPC", (name_value,))
            elif procedure_name == "FindSkill":
                cursor.callproc("FindSkill", (name_value,))

            # Fetch the results of the procedure
            output = []
            for result in cursor.stored_results():
                output.extend(result.fetchall())

            conn.commit()
            flash(f"Stored procedure '{procedure_name}' executed successfully!", "success")

        except mysql.connector.Error as e:
            conn.rollback()
            flash(f"An error occurred: {e}", "error")
        finally:
            cursor.close()
            conn.close()

    return render_template("trigger.html", output=output)


if __name__ == '__main__':
    
    app.run(debug=True)
