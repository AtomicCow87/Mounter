class CharacterExistenceChecker
  # Configure Blizzard Api
  BlizzardApi.configure do |config|
    config.app_id = ENV['BLIZZARD_CLIENT_ID']
    config.app_secret = ENV['BLIZZARD_CLIENT_SECRET']
    config.region = 'us'
    config.use_cache = false
    config.redis_host = ENV['REDIS_HOST']
    config.redis_port = ENV['REDIS_PORT']
    config.cache_access_token = true
  end

  # Does a call to the Blizzard API to check if a character exists
  # Returns true if the character exists, false if it does not
  def self.character_exists?(region, realm, character_name)
    character = BlizzardApi::Wow::CharacterProfile.new region: region
    character_data = character.get(realm, character_name)
    character_data.key?(:name)
  end
end