# --- encoding: utf-8 ---
# 关注print后的逗号 comma， 这样的话就不会换行了。

print "How old are you?",
age = raw_input()
print "How tall are you ?",
height = raw_input()
print "How much do you weigh?"
weight = raw_input()


print "So, you're %r old, %r tall and %r heavy." % ( age, height, weight)