class AuthenticationController < PrivateController
 skip_before_action :authenticate_request

 def authenticate
   r = request_params
   command = AuthenticateUser.call(r[:u], r[:p])
   if command.success?
     json_response({ auth_token: command.result })
   else
     json_response({ error: command.errors }, :unauthorized)
   end
 end
end
