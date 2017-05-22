import pymongo


client = MongoClient()

db = client.db_name
c  = db.collection_name
docs = [{"wid":"cc123", "sid":"sc123"},{"wid":"cc224", "sid":"sc224"}]


c.insert({"wid":"w001", "sid":"s001"})
result = c.insert_many(docs)
result.inserted_ids

c.find_one()
c.find_one({"wid":"cc123"})


for doc in c.find():
    print doc

c.count()


