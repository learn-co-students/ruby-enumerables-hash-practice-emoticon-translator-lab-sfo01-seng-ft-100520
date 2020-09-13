#require 'pry'
require "yaml"

def load_library(file)
final_hash = {}
emoticons = YAML.load_file(file)
  
 emoticons.each do |key, value|
   final_hash[key] = {}
   final_hash[key][:english] = value[0]
   final_hash[key][:japanese] = value[1]
 end
 final_hash
end

def get_japanese_emoticon(file, emoticon)
  load_library(file).each {|key, value| if value[:english] == emoticon then  return value[:japanese] end}
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  load_library(file).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end