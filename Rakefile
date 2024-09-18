task :setruby do
  # eval "$(rbenv init - zsh)"
  sh "eval \"$(rbenv init - zsh)\""
end

# Substitute 2324 for the new course
task :addnewremote do
  sh "cd ../website && git remote add dmsi2324 https://github.com/ULL-ESIT-DMSI-2324/ull-esit-dmsi-2324.github.io.git"
end

desc "Publicar fuentes y build"
task :default => [ :pushhtml ] do
  sh "git ci -am 2324 && git push -u source master && git push -u dmsi2324 master"
end

desc "serve"
task :serve do
  sh "bundle exec jekyll s --watch -V -P 2324"
end

desc "cd ../website and add .nojekyll and push to dmsi and dmsi2324"
task :pushhtml => [ :b ] do
  sh "./scripts/build-and-push.sh"
end

desc "build"
task :b do
  sh "bundle exec jekyll build --future  -d ../website"
end

desc "build and watch"
task :bw do
  sh "bundle exec jekyll build --watch --future  -d ../website"
end

desc "dmsi: serve raw html from ../website. Use: \"rake 'rawserve[<portnumber>]'\" otherwise a random port will be chosen"
task :rawserve, [:port] => [:b] do |t, args|
  sh "http-server ../website -c-1 --port #{ args[:port] or Integer(1000+9000*rand())}"
end 

desc "Publicar solo fuentes en  dmsi2324"
task :pub2324 do
  sh "git ci -am 2324 && git push -u dmsi2324 master"
end

desc "Publicar solo fuentes en dmsi"
task :pubdmsi do
  sh "git ci -am 2324 && git push -u source master"
end

desc  "Update teams"
task :teams do 
  sh "scripts/get-teams.sh > _data/teams.json"
end
