from flask import Blueprint, request, jsonify, make_response, current_app
import random
import json
from datetime import timedelta
from src import db


airline = Blueprint('airline', __name__)


# Get all flights from the DB
@airline.route('/airline', methods=['GET'])
def get_flights():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Flight')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        rowList = list(row)
        json_data.append(dict(zip(row_headers, row)))
        for index, item in list(enumerate(rowList)):
            if isinstance(item, timedelta):
                rowList[index] = str(rowList[index])
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all pilots from the DB
@airline.route('/airline/pilots', methods=['GET'])
def get_Pilots():
    cursor = db.get_db().cursor()
    cursor.execute('select * from pilot')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# add flights to database
@airline.route('airline/add_flight', methods=['POST'])
def add_flights():
    current_app.logger.info(request.form)
    airlineID = request.form['airlineID']
    start = request.form['start']
    end = request.form['end']
    departure = request.form['departure']
    arrival = request.form['arrival']
    cursor = db.get_db().cursor()
    cursor.execute(f'insert into Flight (startDateTime, endDateTime, arrivalLocation, departureLocation, airlineID) VALUES ({start}, {end}, \"{departure}\", \"{arrival}\", {airlineID})')
    db.get_db().commit()
    return 'Hello your flight has been uploaded!'