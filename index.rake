require "sshkit"
require "sshkit/dsl"
require "./utils/config_sshkit.rb"
include SSHKit::DSL

namespace :ssh do
  # rake hello_with_args[afei,bash]
  task :configuration, [:sshkit_config, :ssh_options] do |task, args|
    SSHKit.config.output_verbosity = args[:sshkit_config]["output_verbosity"]
    SSHKit.config.format = args[:sshkit_config]["format"]
    SSHKit::Backend::Netssh.configure do |ssh|
      ssh.ssh_options = args[:ssh_options]
    end
  end

  desc "Upload directory"
  task :upload, [:config] do |task, args|
    sshkit_config, ssh_options, host, dirs = RakeSsh.load(args[:config])
    source, destination = dirs.values_at(*dirs.keys)

    # p sshkit_config
    Rake::Task["ssh:configuration"].invoke(sshkit_config, ssh_options)

    on host do
      within destination do
        Dir["#{source}/*"].each do |item|
          upload! item, destination, recursive: true
        end
      end
    end
  end
end
