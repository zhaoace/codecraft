require "json"

# Dir.mkdir('folder path')
p 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

def buildStructure my_folder, depth=0
	p  ' '*4*depth + my_folder[:title]
	if my_folder[:title] == 'pom.xml'		
	else
		my_folder[:children].each do |fc|
			buildStructure fc, depth+1
		end
	end
end




my_structure={
	title: 'project_name',
	children: [	{
		title: 'pom.xml'
		},{
		title: 'src',
		children: [{
			title:'pom.xml'
		},{
			title:'sdk',
			children: [	{title: 'pom.xml'}   ]
		},{ 
			title:'api',
			children: [	{title: 'pom.xml'}	]
		}]
	},{
		title: 'test',
		children: [{
			title:'unit_test',
			children: [	{title: 'pom.xml'}   ]
		},{ 
			title:'func_test',
			children: [ {title: 'pom.xml'}	]
		},{ 
			title:'pnr_test',
			children: [	{title: 'pom.xml'}	]
		}]
	}]
}



buildStructure my_structure


p 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

	
