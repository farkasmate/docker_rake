task default: :help

desc 'Print help'
task :help do
  sh 'cat README.md'
end

desc 'Build image'
task :build do
  sh 'docker-compose --file docker-compose_build.yaml build'
end

desc 'Test image'
task :test do
  sh 'QUIET=1 RAKE_ARGS="--tasks" docker-compose up'
  sh 'docker-compose down'
end

desc 'Tag and push image'
task release: :build do
  fail 'Relese on the master branch!' unless `git rev-parse --abbrev-ref HEAD`.chomp == 'master'

  sh 'git diff-index HEAD --quiet VERSION' do |version_unchanged|
    fail 'Bump VERSION first!' if version_unchanged
  end

  version = File.read('VERSION').chomp

  sh "git add VERSION"
  sh "git commit --message 'Release #{version}.'"
  sh "git tag #{version}"
  sh "git push --tags origin master"
end
