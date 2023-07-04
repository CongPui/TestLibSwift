
Pod::Spec.new do |spec|

  spec.name         = "TestFramework"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/CongPui/TestLibSwift.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "CongPui" => "138424374+CongPui@users.noreply.github.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source       = { :git => "https://github.com/CongPui/TestLibSwift.git", :tag => "#{spec.version}" }
  spec.source_files = "TestFramework/**/*.{h,m,swift}"

end
