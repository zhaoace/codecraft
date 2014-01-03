def appendToFile file, append
	File.open(file, "w+") { |file|  
		content = file.read
		content << append
		file.write content
	}
end


def createChangelist  baseChangeslist
	Dir.mkdir "output" unless File.exist? "output"
	File.open("output/changelist.txt", "w+") { |file|  
		changelist = file.read
		changelist << "Change: new\n"
		changelist << "Client: master\n"
		changelist << "User: i015571\n"
		changelist << "Status: new\n"
		changelist << "Description:\n"
		changelist << "	==Summary*: Integrate from trunk/PI #{baseChangeslist}\n"
		changelist << "	==Reviewed by*: Zhao,Li \n"
		changelist << "	==Task*: BITVIZ-846 \n"
		file.write changelist
	}
	system "_login_p4  & p4 change -i < output/changelist.txt   " 
	system "_login_p4  & _get_pending_changlist   " 
end





def getRunScript baseChangeslist, pendingChangelist
	controls_list = [
		'controls/annotation',
		'controls/builder',
		'controls/chart',
		'controls/colorpicker',
		'controls/contextmenu',
		'controls/custombutton',
		'controls/datapicker',
		'controls/feeding',
		'controls/filterbar',
		'controls/filterbar2',
		'controls/frame',
		'controls/mapbuilder',
		'controls/switchbar',
		'common',
		'runtime',
		'services',		
	]

	folders = [
		'assets',
		'css',
		'js',
		# 'resources',
	]

	baseFrom = '//components/sap.viz.controls/trunk/PI/src'
	baseTo = '//experiments/shanghai/git/com.sap.viz/container/src/main'
	intergateType = '-v -o -d -i '

	run = ""
	controls_list.each do |x|
		folders.each do |folder| 		
			if folder == 'js'	
				from = "#{baseFrom}/#{x}/#{folder}/..." 				
				to = "#{baseTo}/js/#{x}/..." 
			else
				from = "#{baseFrom}/#{x}/#{folder}/..." 
				to = "#{baseTo}/resources/#{x}/..."
			end
			line =  "p4 integrate #{intergateType} -c #{pendingChangelist}  #{from}@#{baseChangeslist}  #{to}\n"
			run = run + line
			p "to ==> #{to}"
		end
	end	
	appendToFile "output/run_to_#{pendingChangelist}.bat",run
end 




def getPendingChanglist
	File.open("output/PENDING_CHANGELIST.txt", "r") { |file|  
		return file.readline.split[0]
	}
end



# --------------- Main Workflow --------------------

baseChangeslist = 5815673
createChangelist baseChangeslist
pendingChangelist = getPendingChanglist
getRunScript baseChangeslist, pendingChangelist
system "_login_p4 & cd output & run_to_#{pendingChangelist}.bat"