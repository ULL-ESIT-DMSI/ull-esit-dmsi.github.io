task :setruby do
  # eval "$(rbenv init - zsh)"
  sh "eval \"$(rbenv init - zsh)\""
end

# Substitute 2425 for the new course
task :addnewremote do
  sh "cd ../website && 
  git remote add dmsi2425 git@github.com:ULL-ESIT-DMSI-2425/ull-esit-dmsi-2425.github.io.git"
  # "git remote add dmsi2425 https://github.com/ULL-ESIT-DMSI-2425/ull-esit-dmsi-2425.github.io.git"
end

desc "Publicar fuentes y build"
task :default => [ :pushhtml, :pub2425 ] do
  # remotes: Using the git protocol
  # source   git@github.com:ULL-ESIT-DMSI/ull-esit-dmsi.github.io-source.git 
  # dmsi2425 git@github.com:ULL-ESIT-DMSI-2425/ull-esit-dmsi-2425.github.io.git
  sh "git ci -am 2425 && git push -u source master"
end

desc "serve"
task :serve do
  sh "bundle exec jekyll s --watch -V -P 4444"
end

desc "cd ../website and add .nojekyll and push to dmsi and dmsi2425"
task :pushhtml => [ :b ] do
  sh "cd /Users/casianorodriguezleon/campus-virtual/1920/dmsi1920/website && ./scripts/build-and-push.sh"
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
  sh "npx http-server ../website -c-1 --port #{ args[:port] or Integer(1000+9000*rand())}"
end 

desc "Publicar solo fuentes en  dmsi2425 a git@github.com:ULL-ESIT-DMSI-2425/ull-esit-dmsi-2425.github.io-source.git"
task :pub2425 do
  sh "git ci -am 2425 && git push -u dmsi2425 master"
end

desc "Publicar solo fuentes en dmsi"
task :pubdmsi do
  sh "git ci -am 2425 && git push -u source master"
end

desc "Install node.js packages"
task :npm do
  sh "npm i"
end

desc  "Update teams"
task :teams do 
  sh "scripts/get-teams.sh > _data/teams.json"
end

desc "get workflows status of ULL-ESIT-DMSI/ull-esit-dmsi.github.io and ULL-ESIT-DMSI-2425/ull-esit-dmsi-2425.github.io"
task :workflows do
  sh "scripts/get-workflows.sh"
end

desc "Get pages workflows for both ULL-ESIT-DMSI/ull-esit-dmsi.github.io and ULL-ESIT-DMSI-2425/ull-esit-dmsi-2425.github.io"
task :workflows do
  sh "scripts/get-workflows.sh"
end
