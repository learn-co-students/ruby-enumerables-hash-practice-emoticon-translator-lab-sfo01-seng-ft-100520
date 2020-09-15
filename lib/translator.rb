# require modules here
require "yaml"
require "pry"

def load_library(emoticon_yml)
  emoticon_list = YAML.load_file(emoticon_yml)
  new_list = {}
  emoticon_list.each do |emotion, faces|
    if !new_list[emotion]
      new_list[emotion] = {:english => emoticon_list[emotion][0], :japanese => emoticon_list[emotion][1]}
    end
  end
  new_list
end

def get_japanese_emoticon(emoticon_yml, emoticon)
  new_list = load_library(emoticon_yml)
  new_list.each do |feeling, versions|
    versions.each do |ej, face|
      if emoticon == face
        return versions[:japanese]
      end
    end
  end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticon_yml, emoticon)
  new_list = load_library(emoticon_yml)
  new_list.each do |feeling, versions|
    versions.each do |ej, face|
      if emoticon == face
        return feeling
      end
    end
  end
  return "Sorry, that emoticon was not found"
end
