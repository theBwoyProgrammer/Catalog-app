require 'json'

def write_json_file(_file_name, arr)
  opts = {
    object_nl: ' ',
    array_nl: ' ',
    indent: ' ',
    space: ' ',
    space_before: ' '
  }
  file.write(JSON.pretty_generate(arr, opts))
end

def read_json_file(file_name)
  file = File.read(file_name)
  JSON.parse(file)
end
