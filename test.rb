require 'xml_validator'

xmlfn = "Tomoaki.Hori.xml"
schemafn = "iugonet-1_0_3.xsd"


xmlvalid = Xml_validator.new(xmlfn, schemafn)

val = xmlvalid.syntax_check
puts val
exit if val == false

val = xmlvalid.schema_check
puts val

xmlvalid.dump_schema_check_error if val != true


 

