# require modules here

def load_library(path)
  # code goes here
  #./lib/emoticons.yml
  puts path
  require "yaml"
  library = YAML.load_file(path)

  result = {}
  get_meaning_obj = {}
  get_emoticon_obj = {}
  library.each do |def_key, lang_array|
    get_meaning_obj[lang_array[1]] = def_key
    get_emoticon_obj[lang_array[0]] = lang_array[1]
  end

  puts get_meaning_obj
  puts "--------------------------------------------"
  puts get_emoticon_obj

  result["get_meaning"] = get_meaning_obj
  result["get_emoticon"] = get_emoticon_obj
  puts "********************************************"
  puts result
  result
end

def get_japanese_emoticon(path,emoticon)
  # code goes here
  error_msg = "Sorry, that emoticon was not found"
  library = load_library(path)
  library["get_emoticon"].each do |english_emot, japanese_emot|
    if english_emot == emoticon
      return japanese_emot
    end
  end
  error_msg
end

def get_english_meaning(path, emoticon)
  # code goes here
  error = "Sorry, that emoticon was not found"
  library = load_library(path)
  library["get_meaning"].each do |japanese_emot, meaning|
    if japanese_emot == emoticon
      return meaning
    end
  end
  error
end
