Pod::Spec.new do |spec|
  spec.name         = "MQKit"
  spec.version      = "0.0.1"
  spec.summary      = "自闭框架, 未来备胎"
  spec.ios.deployment_target = '9.0'

  spec.homepage     = "https://github.com/M-Quadra/MQKit"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "root@virtual.com" => "root@virtual.com" }
  spec.source       = { :git => "https://github.com/M-Quadra/MQKit.git", :tag => spec.version.to_s }

  spec.source_files  = 'MQKit/MQKit/**/*.{swift}', 'MQKit/MQKit-SwiftPM-future/**/*'
  
  spec.frameworks = 'UIKit', 'Foundation'
end
