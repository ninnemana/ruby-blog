require 'uri'

module GoogleOauth

  def endpoint
    "https://accounts.google.com/o/oauth2/auth?"
  end

  def uniq_client_id
    ENV["GOOGLE_CLIENT_ID"]
  end

  def scope
    "https://www.googleapis.com/auth/userinfo.email"
  end

  def callback
    "http://localhost:9292/oauth2callback"
  end

  def request_params
    params = URI.encode_www_form("response_type" => "code", 
                                     "client_id" => uniq_client_id,
                                  "redirect_uri" => callback,
                                         "scope" => scope,
                                         "state" => request.path_info,
                               "approval_prompt" => "force")
  end

  def full_request_url
    return endpoint + request_params
  end

  def self.included(base)
    ::Sinatra::Base.instance_eval do
      get '/signin' do
        if session[:message].nil?
          redirect(self.full_request_url)
        else
          "AUTHORIZED"
        end
      end
      
      get '/oauth2callback' do
        if params[:error] == "access_denied"
          redirect("/")
        else
          session[:message] = "authorized"
          redirect(params[:state])
        end
      end
    end
  end
end