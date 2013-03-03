require 'xml_validator'

xmlfn = "sample/HFradar.xml"
schemafn = "sample/iugonet-1_0_3.xsd"


xmlvalid = Xml_validator.new(xmlfn, schemafn)

val = xmlvalid.syntax_check
puts "Syntax check: "+val.to_s
exit if val == false

val = xmlvalid.schema_check
puts "Schema check: "+val.to_s

xmlvalid.dump_schema_check_error if val != true


 

