# require modules here
require 'pry'
require 'yaml'

def load_library(path)
  newHash = {}
  emoticons = YAML.load_file(path)
  emoticons.each do |key, value|
    newHash[key] = {}
    newHash[key][:english] = value[0]
    newHash[key][:japanese] = value[1]
  end
  newHash
end

def get_japanese_emoticon(path, emoticon_e)
  load_library(path)
  newHash = {}
  answer = ""
  emoticons = YAML.load_file(path)
  emoticons.each do |key, value|
    if value[0] == emoticon_e
      answer = value[1]
    end
  end
  if answer == ""
    return "Sorry, that emoticon was not found"
  else
    return answer
  end
end

def get_english_meaning(path, emoticon_j)
  load_library(path)
  newHash = {}
  answer = ""
  emoticons = YAML.load_file(path)
  emoticons.each do |key, value|
    if value[1] == emoticon_j
      answer = key
      #binding.pry
    end
  end
  if answer == ""
    return "Sorry, that emoticon was not found"
  else
    return answer
  end
end
