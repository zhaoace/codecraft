#!ruby

# Usage:
#    ruby this.rb --branch=trunk/dev

p ARGV


branch = "trunk/PI_1.18"

ARGV.each do |argv|
      if /--branch=/.match argv then
             matchs = /(--branch=)(.*)/.match argv
             p matchs[0]
             p matchs[1]
             p matchs[2]
             branch = matchs[2]
      end
end

p4_changes = "p4 changes -m 1 "


components = [
"//components/sap.viz/" ,
"//components/sap.viz.api/" ,
"//components/sap.viz.chart/" ,
"//components/sap.viz.container/" ,
"//components/sap.viz.controls/" ,
"//components/sap.viz.extension/" ,
"//components/sap.viz.geo/" ,
"//components/sap.viz.sdk/" ,
]


p4_command = p4_changes
components.each do |component|
      p4_command += " #{component}#{branch}/... "
end

p p4_command
system "p4login & #{p4_command} "