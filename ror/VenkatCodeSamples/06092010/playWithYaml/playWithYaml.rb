require 'yaml'

langs = {'C++' => 'Stroustrup', 'Java' => 'Gosling', 'Lisp' => 'McCarthy'}

File.open('langs.yml', 'w') do |file|
  YAML.dump(langs, file)
end

langs2 = {
  'static' =>
    {'C++' => 'Stroustrup', 'Java' => 'Gosling'},
  'dynamic' =>
    {'Lisp' => 'McCarthy', 'Ruby' => 'Matz'}
}

File.open('langs2.yml', 'w') do |file|
  YAML.dump(langs2, file)
end

langs3 = {
  'static' => "",
  'C++' => 'Stroustrup', 'Java' => 'Gosling',
  'dynamic' => "",
  'Lisp' => 'McCarthy', 'Ruby' => 'Matz',
  "blub" => nil
}

File.open('langs3.yml', 'w') do |file|
  YAML.dump(langs3, file)
end