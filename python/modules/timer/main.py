import datetime
import time

def run():
    import time
    import random
    time.sleep(random.randint(1,3))
    pass


start_at =  datetime.datetime.now()
run()
end_at =  datetime.datetime.now()

print end_at - start_at

start_at =  time.time()
run()
end_at =  time.time()

print end_at - start_at
