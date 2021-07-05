require 'pry'
require 'yaml'

def load_library (file)
emoticons = YAML.load_file(file)
emoticons.each_with_object({}) do |(expression, faces), final_hash|
  faces.each do ||
    
    if !final_hash[expression]
      final_hash[expression] = { :english => faces[0],
                                 :japanese => faces[1] }
    end
  end
  final_hash
end
end


def get_english_meaning (file, emoticon)
  emoticons = load_library(file)
  
  emoticons.each do |expression, versions|
    versions.each do |english, japanese|
      if emoticon == japanese
        return expression
      end
      
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon (file, emoticon)
  emoticons = load_library(file)
  
  emoticons.each do |expression, versions|
    versions.each do |english, face|
      if emoticon == face
        return versions[:japanese]
      end
    end
  end   
  return "Sorry, that emoticon was not found"
end
  