# config valid only for current version of Capistrano
lock '3.12.0'

set :application, 'freemarket_sample_68b'

set :repo_url,  'git@github.com:dorabby/freemarket_sample_68b.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/yasu1224.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :linked_files, fetch(:linked_files, []).push("config/master.key")

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

 task :restart do
   invoke 'unicorn:restart'
 end

 desc 'upload master.key'
 task :upload do
   on roles(:app) do |host|
     if test "[ ! -d #{shared_path}/config ]"
       execute "mkdir -p #{shared_path}/config"
     end
     upload!('config/master.key', "#{shared_path}/config/master.key")
   end
 end
 before :starting, 'deploy:upload'
 after :finishing, 'deploy:cleanup'
end


set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  BASIC_AUTH_USER: ENV["BASIC_AUTH_USER"],
  BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"]
}

set :format_options, truncate: false