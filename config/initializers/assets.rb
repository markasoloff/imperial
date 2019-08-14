# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')



# >..<
Rails.application.config.assets.paths << Rails.root.join("public", "fonts")

Rails.application.config.assets.precompile += %w(jquery/jquery.min.js) 

Rails.application.config.assets.precompile += %w(animate.min.css)
Rails.application.config.assets.precompile += %w(bootstrap.css)


Rails.application.config.assets.precompile += %w(style.css.scss)
Rails.application.config.assets.precompile += %w(sticky.js)
Rails.application.config.assets.precompile += %w(jquery.js)
Rails.application.config.assets.precompile += %w(bootstrap.js)
Rails.application.config.assets.precompile += %w(hoverIntent.js)
Rails.application.config.assets.precompile += %w(superfish.min.js)
Rails.application.config.assets.precompile += %w(morphext.min.js)
Rails.application.config.assets.precompile += %w(wow.js)


# >..<
# Rails.application.config.public_file_server.enabled 

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
