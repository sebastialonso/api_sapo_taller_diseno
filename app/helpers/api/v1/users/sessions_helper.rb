module Api
  module V1
    module Users
      module SessionsHelper
        
        def authorized(user_token)
          user = validate_user(user_token)
          user
        end

        def validate_user(token)
          uri = URI.parse("https://graph.facebook.com/me")
          fb_params = { access_token: token }   
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          request = Net::HTTP::Get.new uri.path
          request.set_form_data fb_params
          request = Net::HTTP::Get.new uri.path + "?" + request.body
          response = http.request request
          if response.code == "200"
            json_response = JSON.parse response.body
            json_response
          else
            "unauthorized"
          end
        end   

      end
    end
  end
end