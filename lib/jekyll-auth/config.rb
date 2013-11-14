class JekyllAuth
  def self.setup_config
  	config_file_path = File.join(Dir.pwd, "_config.yml")
  	config_file = YAML.safe_load_file(config_file_path)
  	config_file
  end

  def self.config
    @config ||= JekyllAuth.setup_config
  end

  def self.whitelist
    return nil unless whitelist = JekyllAuth::config["auth_whitelist"]
    Regexp.new(whitelist.join("|"))
  end
end
