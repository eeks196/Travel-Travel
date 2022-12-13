from flask import Blueprint, request, jsonify, make_response, current_app
import json
from datetime import timedelta
import random
from src import db


hotel = Blueprint('hotel', __name__)

# Get all hotels from the DB
@hotel.route('/hotel', methods=['GET'])
def get_hotels():
    cursor = db.get_db().cursor()
    cursor.execute('select * from hotel')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all rooms from the DB
@hotel.route('/hotel/rooms', methods=['GET'])
def get_rooms():
    cursor = db.get_db().cursor()
    cursor.execute('select * from room natural join hotel')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response