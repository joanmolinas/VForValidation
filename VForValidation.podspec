Pod::Spec.new do |s|
s.name                  = "VForValidation"
s.version               = "1.0.0"
s.summary               = "VFV it's an easy way for check expressions"
s.homepage              = "https://github.com/ulidev/VForValidation/"
s.author                = { "Joan Molinas" => "joanmramon@gmail.com" }
s.license               = { :type => 'MIT', :file => 'LICENSE' }
s.social_media_url      = 'https://twitter.com/joanmolinas'

s.platform              = :ios, '8.0'
s.ios.deployment_target = '8.0'

s.source                = { :git => "https://github.com/DavdRoman/Popsicle.git", :tag => s.version.to_s }
s.source_files          = 'Popsicle/*.{h,swift}'
s.frameworks            = 'UIKit'
s.requires_arc          = true
end