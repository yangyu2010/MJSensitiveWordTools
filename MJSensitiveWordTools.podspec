#
# Be sure to run `pod lib lint MJSensitiveWordTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#


Pod::Spec.new do |s|
  s.name             = 'MJSensitiveWordTools'
  s.version          = '0.1.0'
  s.summary          = '敏感词过滤'

  s.homepage         = 'https://github.com/yangyu2010@aliyun.com/MJSensitiveWordTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yu Yang' => 'yangyu2010@aliyun.com' }
  s.source           = { :git => 'https://github.com/yangyu2010/MJSensitiveWordTools.git', :tag => "v-#{s.version}" }

  s.ios.deployment_target = '9.0'

  s.source_files = 'MJSensitiveWordTools/Classes/**/*'
  
end


