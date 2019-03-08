require "sshkit"
require "sshkit/dsl"
require "./utils/config_sshkit.rb"
include SSHKit::DSL

# ssh_options, server, dirs = CONFIG.values_at("ssh_p")

# p ssh_options
# p serer
# p sere

## SSHKit configuration:

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
  task :upload do |task, args|
    sshkit_config, ssh_options, host, dirs = RakeSsh.load("./test/tss.yaml")
    source, destination = dirs.values_at(*dirs.keys)

    # p sshkit_config
    Rake::Task["ssh:configuration"].invoke(sshkit_config, ssh_options)

    on host do
      within destination do
        Dir["#{dir}/*"].each do |item|
          puts item
          # puts execute(:ls, "-alh")
          # upload! item, destination, recursive: true
        end
      end
    end
  end
end
