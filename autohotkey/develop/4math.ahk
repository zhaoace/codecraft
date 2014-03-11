;Math: To perform a math operation, use the colon-equal operator (:=) to assign the result of an expression to a variable as in the example below:

Price = 100
Discount = 0 

NetPrice := Price * (1 - Discount/100)
MsgBox, NetPrice=%NetPrice% Price=%Price%


Discount = 75 
NetPrice := Price * (1 - Discount/100)
MsgBox, NetPrice=%NetPrice% Price=%Price%
