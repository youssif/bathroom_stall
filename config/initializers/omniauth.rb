Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '451981254876272', '059d463ac0dfb0102511550b9e4962b9', :display => 'popup'
end
 
