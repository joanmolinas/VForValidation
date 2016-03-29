Pod::Spec.new do |s|
    s.name                  = "VForValidation"
    s.version               = "1.0.0"
    s.summary               = "VFV it's an easy way for check expressions"
    s.homepage              = "https://github.com/ulidev/VForValidation/"
    s.author                = { "Joan Molinas Ramon" => "joanmramon@gmail.com" }
    s.license               = { :type => 'MIT', :file => 'LICENSE' }

    s.platform              = :ios, '8.0'
    s.ios.deployment_target = '8.0'

    s.source                =  { :git => "https://github.com/ulidev/VForValidation.git", :tag => s.version.to_s }
    s.source_files          = 'Source/*.{h,m}'
    s.frameworks            = 'Foundation', 'UIKit'
    s.requires_arc          = true
end