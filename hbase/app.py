import time
import random
import json
import requests

metric = 'node1.cpu'

def create_measurement(metric):
    timestamp = int(time.time())
    value = random.randint(1,100)
    tag_1 = 'node'
    tag_value_1 = "node01"

    json_str = json.dumps({'metric' : metric,
                           'timestamp' : timestamp,
                           'value' : value,
                           'tags' : {
                               tag_1 : tag_value_1
                           }
                           }, sort_keys=False)
    #print(json_str)
    return json_str



def send_measurement(json_str):
    r = requests.post('http://localhost:4242/api/put', data=json_str)
    #print(r.text)
    #print(r.status_code)

def main():
    number_of_iterations = 5000
    for i in xrange(0, number_of_iterations):
        json_str = create_measurement(metric)
        send_measurement(json_str)
        print(i)


if __name__ == '__main__':
    main()
