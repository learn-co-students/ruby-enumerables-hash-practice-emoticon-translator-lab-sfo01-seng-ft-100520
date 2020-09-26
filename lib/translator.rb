# require modules here
require 'yaml'
require 'pry'

path = './lib/emoticons.yml'

def load_library(path)
  file_path = YAML.load_file('./lib/emoticons.yml')
  
  hash = file_path.each_with_object({}) do |(key, value), answer|
    answer[key] = {
      :english => value[0],
      :japanese => value[1]
    }
    end
  hash
end

def get_japanese_emoticon(path, emoticon)
  result = ""
  
  load_library(path).each do |key, value|
    if emoticon == value[:english]
      result = value[:japanese]
      break
    else
      result = "Sorry, that emoticon was not found"
    end
  end
  result
end


def get_english_meaning(path, emoticon)
  result = ""
  
  load_library(path).each do |key, value|
    if emoticon == value[:japanese]
      result = key
      break
    else
      result = "Sorry, that emoticon was not found"
    end
  end
  
  result
end