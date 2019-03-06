
# main task list:

require "sshkit"
require "sshkit/dsl"
include SSHKit::DSL

## SSHKit configuration:
SSHKit::Backend::Netssh.configure do |ssh|
  ssh.ssh_options = {
    user: "USER_NAME",
    password: "PASSWORD",
  }
end
SSHKit.config.output_verbosity = :info

namespace :ssh do
  # rake hello_with_args[afei,bash]
  desc "Upload directory"
  task :upload, [:host, :source, :dist] do |task, args|
    on HOST do
      dir = args[:source]
      dist = args[:dist]
      within dist do
        Dir["#{dir}/*"].each do |item|
          upload! item, args[:dist], recursive: true
        end
      end
    end
  end
end
