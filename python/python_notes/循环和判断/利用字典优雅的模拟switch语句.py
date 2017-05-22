msgs = {'create': 'create item',
'delete': 'delete item',
'update': 'update item'}
default = 'invalid choice... try again!'
action = msgs.get(user.cmd, default)
