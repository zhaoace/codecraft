#testMkFile.rb





dd="c:/p4/master/tp/test/tp.canvg.js/1.2/REL/export/package/idcard/"
df=dd+"placeholder"

File.open(df, "r+") { |file|  
	p file.read
	p "aha?"
}

File.open(df, "w+")


