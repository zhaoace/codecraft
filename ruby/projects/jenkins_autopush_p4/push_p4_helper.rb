#!ruby
# system "statement" means to run statement in Windows command line. 


## Setting Env Variables to use.
p4_workspace="scm_sap.viz_push_20130310"
p4_user=ENV["p4user"]
p4_integrate_changelist=ENV["changelist"]
p4_operat_time=Time.now
p4_reviewed_by="Zhao,Li"
p4_task_id="BITVIZ-846"

branch_from = ENV["integrate_from"]
branch_to   = ENV["integrate_to"]

parts=<<content_boundary
sap.viz.sdk
sap.viz.chart
sap.viz.api
sap.viz.extension
sap.viz
sap.viz.geo
sap.viz.controls
content_boundary




## Create the p4 pending list info file.
pendinglist_content=<<content_boundary
Change: new
Client: #{p4_workspace}
User: #{p4_user}
Status: new
Description:
    ==Summary*: Integrate from #{branch_from} #{p4_integrate_changelist} @#{p4_operat_time}
    ==Reviewed by*: #{p4_reviewed_by} 
    ==Task*: #{p4_task_id} 
content_boundary

File.open("pendinglist_file.txt", "w") { |file|  
    file << pendinglist_content
}



## P4 clean p4_workspace 
system "p4 changes -c #{p4_workspace} -s pending > exist_pendinglists_file.txt"

p4_clean_workspace_statement="set p4client=#{p4_workspace}\n"
File.open("exist_pendinglists_file.txt", "r") { |file|  
    file.readlines.each do |line|
        exist_pendinglist = line.split[1]  
        p4_clean_workspace_statement << "p4 revert -c #{exist_pendinglist} //...\n"     
        p4_clean_workspace_statement << "p4 change -d #{exist_pendinglist}\n"
    end
}
File.open("p4_run_clean_workspace.bat" , "w"){ |file|
    file << p4_clean_workspace_statement 
}
system "p4_run_clean_workspace.bat"
system "p4 changes -c #{p4_workspace} -s pending > verify_pendinglist_after_clean.txt"
#### TODO: report by verify result.


## P4 create pendinglist
system "p4 change -i < pendinglist_file.txt"



## P4 get pendinglist number, the latest changelist in this p4 workspace.
system "p4 changes -m 1 -c #{p4_workspace} -s pending > created_pendinglist_file.txt"
pendinglist = File.open("created_pendinglist_file.txt","r"){ |file|
    file.read.split[1]
}



## P4 put integrate operation into this pendinglist .
p4_integrate_statement="set p4client=#{p4_workspace}\n"
parts.split.each do |part|
    from = "//components/#{part}/#{branch_from}/..."
    to = "//components/#{part}/#{branch_to}/..."
    p4_integrate_statement << "p4 integrate  -o -d -i -c #{pendinglist} #{from}#{p4_integrate_changelist}  #{to}\n"
end
p4_integrate_statement<<"p4 resolve -as -dl -c #{pendinglist}\n"


## P4 submit if auto resolve succeed .
p4_integrate_statement<<"p4 submit -c #{pendinglist}\n"  if ENV["do_submmit"] == "yes"
p "p4 submit -c #{pendinglist}"



File.open("run_p4_integrate.bat", "w") { |file|  
    file << p4_integrate_statement
}

File.open("run_p4_integrate.bat.txt", "w") { |file|  
    file << p4_integrate_statement
}
system "run_p4_integrate.bat"




####  TODO add diff2 result.
