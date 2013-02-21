require 'rexml/document'
require 'rubygems'
require 'nokogiri'

class Xml_validator
  def initialize( xmlfn, schemafn)

    @syntax_valid = true
    @schema_valid = false

    @doc = open(xmlfn) {|fp|
      begin
        REXML::Document.new fp
      rescue
        @syntax_valid = false
      end
    }
    return if @syntax_valid == false

    open(xmlfn) {|fp|
      @doc = Nokogiri::XML(fp)
    }
    open(schemafn) {|fp|
      @schema = Nokogiri::XML::Schema(fp)
    }
    return if @schema == nil

  end

  def syntax_check
    @syntax_valid
  end

  def schema_check

    @schema_valid = true
    @error = @schema.validate(@doc)
    @schema_valid = false if @error != nil

    @schema_valid

  end

  def dump_schema_check_error

    @error.each do |error|
      puts "XML not schema valid ([#{error.line}-#{error.column}] #{error.message})"
    end

  end

end