import xml.etree.ElementTree as ET


tree = ET.parse('/Users/zhaoli/workspace/splunk/playground/var/lib/jenkins/jobs/Splunk/jobs/develop/jobs/platform/jobs/cli/jobs/trigger_cli_linux/config.xml')
root = tree.getroot()

# SPs = root.findall("properties/hudson.model.ParametersDefinitionProperty/parameterDefinitions/[hudson.model.StringParameterDefinition]")
SPs = root.findall("properties/hudson.model.ParametersDefinitionProperty/parameterDefinitions/hudson.model.StringParameterDefinition/[name='branch']")

print "***"
print dir(SPs)
print "***"

for s in SPs:
    print "-----"
    # print s.tag, ":", s.text
    ET.dump(s)



spd  = ET.Element("hudson.model.StringParameterDefinition")
name = ET.SubElement(spd, 'name')
name.text="version"
description=ET.SubElement(spd, 'description')
description.text="The product version"
defaultValue=ET.SubElement(spd, 'defaultValue')
defaultValue.text=""

ET.dump(spd)



tree.