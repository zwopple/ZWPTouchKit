Pod::Spec.new do |s|
  s.name = "ZWPTouchKit"
  s.summary = "A small collection of iOS extensions, utilities and view."
  
  s.version = "1.0.0"
  s.license = "None"
  s.homepage = "https://github.com/zwopple/ZWPTouchKit"
  s.author = { "Zwopple | Creative Software" => "support@zwopple.com" }
  s.source = { :git => "https://github.com/zwopple/ZWPTouchKit.git", :tag => "1.0.0" }
  s.requires_arc = true
  s.prefix_header_file = "ZWPTouchKit/ZWPTouchKit-Prefix.pch"
  s.source_files = "ZWPTouchKit"
  s.frameworks = "UIKit"
  s.ios.deployment_target = "6.0"
end