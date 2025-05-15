from flask import Blueprint, request, jsonify
from .models import db, DataRecord

main_bp = Blueprint('main', __name__)

@main_bp.route('/data', methods=['POST'])
def handle_data():
    data = request.get_json()

    # Basic validation
    if not data or 'key' not in data or 'value' not in data:
        return jsonify({"error": "Both 'key' and 'value' fields are required"}), 400

    key = data['key']
    value = data['value']

    record = DataRecord.query.filter_by(key=key).first()
    if record:
        record.value = value
        message = "Record updated"
    else:
        record = DataRecord(key=key, value=value)
        db.session.add(record)
        message = "Record created"

    db.session.commit()

    return jsonify({
        "message": message,
        "record": {
            "id": record.id,
            "key": record.key,
            "value": record.value
        }
    }), 200

@main_bp.route('/get', methods=['GET'])
def get_data():
    records = DataRecord.query.all()
    result = [
        {
            "id": record.id,
            "key": record.key,
            "value": record.value
        }
        for record in records
    ]
    
    return jsonify({"records": result}), 200
