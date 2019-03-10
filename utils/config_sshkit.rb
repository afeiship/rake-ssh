require "yaml"

module RakeSsh
  def self.load(filename)
    config = YAML.load_file(filename)
    config.values_at(*config.keys)
  end
end
