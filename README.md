# TestLibSwift
##==Create framework==
1: Create framework project xcode
    Ex: Product Name: MyLibrary
2: Connect framework to github
3: Create source in library and push to github
4: Download cocoapods ussing terminal
    gem install cocoapods
5: Create file ".podspec" in MyLibrary
6: Change file ".podspec" with:
  ```swift
    Pod::Spec.new do |spec|

  spec.name         = "SwiftyLib"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "`myGithub`"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "`myName`" => "`myGmail`" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source        = { :git => "`myGithub`", :tag => "#{spec.version}" }
  spec.source_files  = "SwiftyLib/**/*.{h,m,swift}"

end
```

##==Using Framework==
1: Create project
2: Config podfile in project
3: In podfile
    pod'TestFramework', :git => "`myGithub`"
    
```ruby
pod'TestFramework', :git => "`Package.swift`"
```

