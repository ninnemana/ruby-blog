module Blog
  class Application < Sinatra::Base  

    # Register Sinatra Common Extensions
    register Sinatra::Contrib

    configure do
      enable :sessions
      set :app_file, __FILE__
      set :root, File.dirname(__FILE__)
      set :views, "views"
      set :public_folder, 'public'
      set :scss, {:style => :compact, :debug_info => false}
    end

    get '/stylesheets/:name.css' do
      content_type 'text/css', :charset => 'utf-8'
      sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
    end

    not_found do 
      status 404
      'not found'
    end

    error do
      'ERROR: ' + env['sinatra.error'].name
    end

  end
end