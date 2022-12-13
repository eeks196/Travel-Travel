from flask import Blueprint, request, jsonify, make_response, current_app
import json
from datetime import timedelta
from datetime import datetime
import random
from src import db


customer = Blueprint('customer', __name__)

# Get all customer from the DB
@customer.route('/customer', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select * from customer')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get customer detail for customer with particular userID
@customer.route('/customer/<userID>', methods=['GET'])
def get_customerID(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from customer where customer.id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Get customer flights to view
@customer.route('/customer/book_flight', methods=['GET'])
def get_Flights():
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


# let customer book flight
@customer.route('/customer/flight_invoice', methods=['POST'])
def bookFlight():
    current_app.logger.info(request.form)
    userID = request.form['User_ID']
    flightID = request.form['Flight_ID']
    seatNum = random.randint(0, 150)
    price = round(random.uniform(100.00, 700.00), 2)
    cursor = db.get_db().cursor()
    cursor.execute(f'insert into invoice_flights (price, seatNum, flightId, custId) VALUES ({price}, {seatNum}, {flightID}, {userID})')
    db.get_db().commit()
    return 'Hello your flight has been booked!'


# let customer book room
@customer.route("/customer/invoice_room", methods=['POST'])
def bookRoom():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    userID = request.form['User ID']
    roomNum = request.form['room']
    hotel = request.form['hotel']
    start = request.form['start']
    end = request.form['end']
    starttime = datetime.strptime(start, '%Y-%m-%d')
    endtime = datetime.strptime(end, '%Y-%m-%d')
    days = (endtime - starttime).days
    price = days * 175.54
    cursor.execute(f'insert into invoice_room (startDate, endDate, cost, customerId) values ({start}, {end}, {price}, {userID});')

    db.get_db().commit()
    return 'Hello your room has been booked!'