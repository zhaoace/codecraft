
Configuration files in python

There are several ways to do this depending on the file format required.

ConfigParser [.ini format]

I would use the standard configparser approach unless there were compelling reasons to use a different format.

Write a file like so:

from ConfigParser import SafeConfigParser

config = SafeConfigParser()
config.read('config.ini')
config.add_section('main')
config.set('main', 'key1', 'value1')
config.set('main', 'key2', 'value2')
config.set('main', 'key3', 'value3')

with open('config.ini', 'w') as f:
    config.write(f)
The file format is very simple with sections marked out in square brackets:

[main]
key1 = value1
key2 = value2
key3 = value3
Values can be extracted from the file like so:

from ConfigParser import SafeConfigParser

config = SafeConfigParser()
config.read('config.ini')

print config.get('main', 'key1') # -> "value1"
print config.get('main', 'key2') # -> "value2"
print config.get('main', 'key3') # -> "value3"

# getfloat() raises an exception if the value is not a float
a_float = config.getfloat('main', 'a_float')

# getint() and getboolean() also do this for their respective types
an_int = config.getint('main', 'an_int')
JSON [.json format]

JSON data can be very complex and has the advantage of being highly portable.

Write data to a file:

import json

config = {'key1': 'value1', 'key2': 'value2'}

with open('config.json', 'w') as f:
    json.dump(config, f)
Read data from a file:

import json

with open('config.json', 'r') as f:
    config = json.load(f)

#edit the data
config['key3'] = 'value3'

#write it back to the file
with open('config.json', 'w') as f:
    json.dump(config, f)





up vote
296
down vote
accepted
The easiest and pureist method without relying on C headers is PyYaml:

#!/usr/bin/env python

import yaml

with open("example.yaml", 'r') as stream:
    try:
        print(yaml.load(stream))
    except yaml.YAMLError as exc:
        print(exc)
Err.. that's it... how many lines of code would that take me in Java... any ideas? : ) more info here:

http://pyyaml.org/wiki/PyYAMLDocumentation
