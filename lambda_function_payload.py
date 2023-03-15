import http.client

def lambda_handler(event, context):
    # TODO implement
    conn = http.client.HTTPSConnection('X-Siemens-Auth': 'test')

    payload = {
  "name": "Sumit Wani",
  "email": "sumitwani111@gmail.com"
}

    conn.request("POST", "https://2xfhzfbt31.execute-api.eu-west-1.amazonaws.com/candidate-email_serverless_lambda_stage/data", payload, headers)
    res = conn.getresponse()
    data = res.read()

    return {
        "statusCode": 200,
        "isBase64Encoded": true,
        "LogResult": "U1RBUlQgUmVxdWVzdElkOiAyMjVjNTNmZC1hYTg0LTQwMzgtODA0OS1iYTYwN2M5ZmZjMWQgVmVyc2lvbjogJExBVEVTVAp7Im1lc3NhZ2UiOiAiTWVzc2FnZSBwcm9jZXNzZWQgc3VjY2Vzc2Z1bGx5LiJ9CjIwMApFTkQgUmVxdWVzdElkOiAyMjVjNTNmZC1hYTg0LTQwMzgtODA0OS1iYTYwN2M5ZmZjMWQKUkVQT1JUIFJlcXVlc3RJZDogMjI1YzUzZmQtYWE4NC00MDM4LTgwNDktYmE2MDdjOWZmYzFkCUR1cmF0aW9uOiAyODY1LjA2IG1zCUJpbGxlZCBEdXJhdGlvbjogMjg2NiBtcwlNZW1vcnkgU2l6ZTogMTI4IE1CCU1heCBNZW1vcnkgVXNlZDogNDkgTUIJSW5pdCBEdXJhdGlvbjogMzQzLjUxIG1zCQo=",
        "ExecutedVersion": "$LATEST"
    }