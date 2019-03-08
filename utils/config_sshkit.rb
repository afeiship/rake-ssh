require "yaml"

module RakeSsh
  def self.load(filename)
    config = YAML.load_file(filename)
    config.values_at(*config.keys)
  end

  def self.mix(inSettings, inObject)
    inSettings.each do |key, value|
      inObject[key] = value
    end
  end
end
