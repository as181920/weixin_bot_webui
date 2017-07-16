ENV_FILE = File.join Rails.root, 'config', 'local_env.yml'
ENV_CONFIG = YAML.load_file(ENV_FILE)[Rails.env] || {} rescue {}

class ENVConfig
  ENV_CONFIG.each do |key, value|
    const_set key.upcase, value
  end

  class << self
    ENV_CONFIG.each do |key, value|
      define_method(key.to_sym) { value }
    end

    def method_missing(method_sym, *arguments, &block)
      nil
    end
  end
end
