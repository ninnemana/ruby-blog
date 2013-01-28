module Blog
  class Application < Sinatra::Base  

    # include GoogleOauth

    get '/' do
      b = Band.new(name: "Phone No: 101-#{rand(999)}-#{rand(999)}")
      b.save
      @bands = Band.all.to_a
      if @bands.size > 10
        Band.where(_type: nil).first.delete
      end
      erb :home
    end
  end
end