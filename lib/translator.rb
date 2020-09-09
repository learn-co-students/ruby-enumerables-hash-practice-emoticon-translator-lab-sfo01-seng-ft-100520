require 'pry'
require 'yaml'

def load_library(file)
  emoticons = YAML.load_file(file)
 
  emoticons.each_with_object ({}) do |(key, value), new_hash|
    value.each do 
    
      if !new_hash[key]
      new_hash[key] = {"english": value[0],
                       "japanese": value[1]}
      end
    end
    new_hash
  end
end


def get_japanese_emoticon(file, emoticon)
  load_library(file).each do |english_name, value|
    value.each do |version, face|
    
      if face == emoticon
        return load_library(file)[english_name][:japanese]
      end
      
    end  
  end
  return "Sorry, that emoticon was not found"
end



def get_english_meaning(file, emoticon)
  load_library(file).each do |english_name, value| 
    value.each do |version, face|
      if emoticon == face
        return english_name
      end
      
    end
  end
    return "Sorry, that emoticon was not found"
end

