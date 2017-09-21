
Pod::Spec.new do |s|
  s.name             = 'opageviewcontroller'
  s.version          = '1.0.1'
  s.summary          = 'OPageViewControler lets you embed multiple UIViewControllers.'

  s.description      = <<-DESC
OPageViewControler lets you embed multiple UIViewControllers and access them based on swipe/ tap on controller's title in container Controller with Title Tab
                       DESC

  s.homepage         = 'https://github.com/abhishekaks/opageviewcontroller'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abhishek Singh' => 'abhishekattitude@gmail.com' }
  s.source           = { :git => 'https://github.com/abhishekaks/opageviewcontroller.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'opageviewcontroller/Classes/**/*'

#s.resource_bundles = {
#'opageviewcontroller' => ['opageviewcontroller/Assets/*.{png,xib,storyboard}']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
