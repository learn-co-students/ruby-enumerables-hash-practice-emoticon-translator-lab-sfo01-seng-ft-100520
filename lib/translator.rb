require "yaml"
require 'pry'
emoticon_file = YAML.load_file('./lib/emoticons.yml')

def load_library(emoticon_file)
  emoticon = YAML.load_file('./lib/emoticons.yml')
final_result = emoticon.each_with_object({}) do |(key, value), result|
  result[key] = value
    result[key] = {
      :english => value[0],
      :japanese => value[1]
    }
end
final_result
end


def get_japanese_emoticon(emoticon_file, western_emoticon)
  emoticon = YAML.load_file('./lib/emoticons.yml')
  japanese_emoticon = ""
  load_library(emoticon_file).each do |key, value|
    if western_emoticon == value[:english]
      japanese_emoticon = value[:japanese]
    elsif japanese_emoticon == ""
      japanese_emoticon = "Sorry, that emoticon was not found"
    end
  end
  japanese_emoticon
end

def get_english_meaning(emoticon_file, japanese_emoticon)
  english_meaning = ""
  emoticon = YAML.load_file('./lib/emoticons.yml')
  load_library(emoticon_file).each do |key, value|
    if japanese_emoticon == value[:japanese]
      english_meaning = key
    elsif english_meaning == ""
      english_meaning = "Sorry, that emoticon was not found"
    end
  end
  english_meaning
end
