namespace :engine do
  def rename(old_path, new_name)
    sh "git mv #{old_path} #{(old_path.split("/")[0..-2]+[new_name]).join("/")}"
  end
  
  def search_and_replace(old_name, new_name)
    sh "find . -type f -not -path './.git/*' -exec sed -i '' 's/#{old_name}/#{new_name}/g' {} \\;"
  end
  
  desc "Rename the rails base engine to your desired namespace"
  task :rename, [:name]  do |t, args|
    #just in case you passed in the CamelCasedVersion instead
    puts args
    name = args.name.underscore
    base = "spree"
    
    # Rename each directory named 'atlas' with the name of [your_namespace]

    # rename "app/assets/images/#{base}", name

    rename "app/assets/javascripts/#{base}", name

    rename "app/assets/stylesheets/#{base}", name
    
    rename "app/controllers/#{base}", name

    rename "app/helpers/#{base}", name
    
    rename "app/models/#{base}", name

    rename "app/views/layouts/#{base}", name

    rename "lib/#{base}", name

    rename "spec/models/#{base}", name
    
    # Rename files that include atlas in the name

    rename "lib/#{base}.rb", "#{name}.rb"

    rename "lib/tasks/#{base}_tasks.rake", "#{name}_tasks.rake"

    rename "#{base}.gemspec", "#{name}.gemspec"
    
    # Replace Strings in files

    search_and_replace base, name
    
    search_and_replace base.camelize, name.camelize
    
    sh "bundle install"
    
    sh "git commit -am 'Renamed #{base} to #{name}'"
    
  end
  
end