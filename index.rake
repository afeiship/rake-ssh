# load subtask:
Dir.glob("./tasks/*.rake").each do |task|
  load task
end

# main task list:
namespace :ssh do
  # rake hello_with_args[afei,bash]
  desc "want to say hello"
  task :hello, [:name, :from] do |task, args|
    args.with_defaults(
      :name => "fei",
      :from => "github",
    )

    puts "hello world, #{args[:name]} from #{args[:from]}!"
  end
end
