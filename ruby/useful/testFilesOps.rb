#testFilesOps.rb
require 'FileUtils' 


 #  pom.xml / *.deps / *.gmk
def refillThirdPart targetFile, targetName, targetVersion, demoName="tp_demo", demoVersion="1.0.0"
	content = ""
	File.open(targetFile, "r+") { |file|  	

		content = file.read.
						gsub(demoName) { targetName }.
						gsub(demoName.upcase) { targetName.upcase }.
						gsub(demoVersion) { targetVersion }
		file<<content
	}
	File.open(targetFile, "w") { |file|  
		file<<content
	}
end






tempFile   = 'C:\Users\i015571\Dropbox\Workspace\tempFile.txt'
targetFile = tempFile+".temp.txt"


FileUtils.cp tempFile, targetFile

refillThirdPart targetFile,"thrid_part","2.3.5"


#FileUtils.remove targetFile 
