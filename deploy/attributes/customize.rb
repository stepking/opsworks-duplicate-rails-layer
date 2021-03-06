custom_rails_layers = ["railsapp1"]
default_rails_layer = "rails-app"


# If an instance is part of a custom rails layer, trick OW into thinking it's part of the main rails layer as well.
for layer in custom_rails_layers
  if node[:opsworks][:instance][:layers].include?(layer)
    if not node[:opsworks][:instance][:layers].include?(default_rails_layer)
      normal[:opsworks][:instance][:layers].push(default_rails_layer)
    end
  end
end


