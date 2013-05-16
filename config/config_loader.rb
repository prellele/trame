require 'configurate'

AppConfig ||= Configurate::Settings.create do
  add_provider Configurate::Provider::Env
  add_provider Configurate::Provider::YAML, 'config/application.yml',
               namespace: Rails.env, required: false
  add_provider Configurate::Provider::YAML, 'config/defaults.yml'
end
