
Pod::Spec.new do |s|
  s.name             = 'ALCountryPicker'
  s.version          = '1.0.0'
  s.summary          = 'This is country picker framework.'


  s.description      = <<-DESC
                        List of all countries. You can search your country via name, country code and dialing code.
                       DESC

  s.homepage         = 'https://github.com/abdulshamim/ALCountryPicker.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abdul Khan' => 'abdul.shamimkhan5@gmail.com' }
  s.source           = { :git => 'https://github.com/abdulshamim/ALCountryPicker.git', :tag => s.version.to_s }

  s.platform     = :ios, "10.0"
  s.ios.deployment_target = '10.0'
  s.swift_version = "4.1"

  s.source_files = 'Files/**/*.{swift}'

  s.resource_bundles = {
     'ALCountryPicker' => ['Views/**/*.{storyboard,xib}']
  }
end
