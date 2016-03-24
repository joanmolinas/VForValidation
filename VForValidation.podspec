Pod::Spec.new do |s|

  s.name         = "VForValidation"
  s.version      = "0.0.1"
  s.summary      = "VFV it's an easy way for check expressions"
  s.homepage     = "https://github.com/ulidev/VForValidation/"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = { "Joan Molinas Ramon" => "joanmramon@gmail.com" }

  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/ulidev/VForValidation.git", :tag => s.version.to_s }
  s.frameworks   = 'Foundation', 'UIKit'
  s.source_files = 'Source/*.{h,m}'
  s.requires_arc = true

end
