
# main task list:

require "./utils/config_sshkit.rb"

puts RakeSsh.load("./test/config.yaml")

# SSHKit::Backend::Netssh.configure do |ssh|
#   ssh.ssh_options = {
#     user: "USER_NAME",
#     password: "PASSWORD",
#   }
# end
# SSHKit.config.output_verbosity = :info


# puts ssh_options
# puts server
# puts dirs
# p *CONFIG.keys

# h = { 1 => "a", 2 => "b", 3 => "c" }
# p h.values_at(1)
