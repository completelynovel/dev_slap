CONFIG = {}.merge(YAML.load_file("#{Rails.root}/config/config.yml")['default']).merge(YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env])
