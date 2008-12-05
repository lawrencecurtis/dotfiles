require 'rake'
# added comment
desc "install the dot files into user's home directory"
task :install do
  name = `git config --global user.name`.strip
  email = `git config --global user.email`.strip

  # git config --global user.name "Lawrence"
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
    
  puts "Name: (#{name})"
  new_name = STDIN.gets.strip
  
  puts "Email: (#{email})"
  new_email = STDIN.gets.strip
  
  if new_email == ""
    new_email = email
  end
  
  if new_name == ""
    new_name = name
  end

  `git config --global user.name "#{new_name}"`
  `git config --global user.email "#{new_email}"`
  `git config --global core.excludesfile "$HOME/.gitignore"`

end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
