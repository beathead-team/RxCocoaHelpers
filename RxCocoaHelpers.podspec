Pod::Spec.new do |s|
  s.name         = "RxCocoaHelpers"
  s.version      = "1.0.0"
  s.summary      = "RxCocoaHelpers"
  s.homepage     = "https://github.com/beathead-team/RxCocoaHelpers"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.swift_version = '5.2.4'
  s.ios.deployment_target = '10.0'
  s.source       = { :git => "https://github.com/beathead-team/RxCocoaHelpers", :tag => s.version.to_s }
  s.source_files = "RxCocoaHelpers/**/*.{h,swift}"
  s.requires_arc = true
  s.frameworks   = ["Foundation", "UIKit"]
  s.dependency "RxSwift", "~> 5.0"
  s.dependency "RxCocoa", "~> 5.0"
end
